(function ($) {

  Drupal.behaviors.addCurrentLocation = {
    attach: function (context, settings) {

      var callback_url = Drupal.settings.basePath + settings.ip_geoloc_menu_callback;

      var startTime = (new Date()).getTime();

      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(getLocation, handleLocationError, {enableHighAccuracy: true, timeout: 20000});
      }
      else {
        var data = new Object;
        data['error'] = Drupal.t('IPGV&M: device does not support W3C API.');
        callback_php(callback_url, data, false);
        return;
      }

      function getLocation(position) {

        var refresh_page = settings.ip_geoloc_refresh_page;
        var ip_geoloc_address = new Object;
        ip_geoloc_address['latitude']  = position.coords.latitude;
        ip_geoloc_address['longitude'] = position.coords.longitude;
        ip_geoloc_address['accuracy']  = position.coords.accuracy;

        if (window.console && window.console.log) { // Does not work on IE8
          var elapsedTime = (new Date()).getTime() - startTime;
          window.console.log(elapsedTime/1000 + ' s to locate visitor');
        }

        if (!settings.ip_geoloc_reverse_geocode) {
          // Pass lat/long back to Drupal without street address.
          callback_php(callback_url, ip_geoloc_address, refresh_page);
          return;
        }
        // Reverse-geocoding of lat/lon requested.
        startTime = (new Date()).getTime();
        var location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        new google.maps.Geocoder().geocode({'latLng': location }, function(response, status) {

          if (status === google.maps.GeocoderStatus.OK) {
            var google_address = response[0];
            ip_geoloc_address['formatted_address'] = google_address.formatted_address;
            for (var i = 0; i < google_address.address_components.length; i++) {
              var component = google_address.address_components[i];
              if (component.long_name !== null) {
                var type = component.types[0];
                ip_geoloc_address[type] = component.long_name;
                if (type === 'country' && component.short_name !== null) {
                  ip_geoloc_address['country_code'] = component.short_name;
                }
              }
            }
          }
          else {
            //alert(Drupal.t('IPGV&M: Google Geocoder returned error !code.', { '!code': status }));
            ip_geoloc_address['error'] = Drupal.t('getLocation(): Google Geocoder address lookup failed with status code !code.', { '!code': status });
            refresh_page = false;
          }
          if (window.console && window.console.log) {
            var elapsedTime = (new Date()).getTime() - startTime;
            window.console.log(elapsedTime/1000 + ' s to reverse-geocode to address');
          }

          // Pass lat/long, accuracy and address back to Drupal
          callback_php(callback_url, ip_geoloc_address, refresh_page);
        });
      }

      function handleLocationError(error) {
        var data = new Object;
        data['error'] = Drupal.t('getCurrentPosition() returned error !code: !text Browser: @browser',
          {'!code': error.code, '!text': error.message, '@browser': navigator.userAgent});
        // Pass error back to PHP rather than alert();
        callback_php(callback_url, data, false);
      }

      function callback_php(callback_url, data, refresh_page) {
        $.ajax({
          url: callback_url,
          type: 'POST',
          dataType: 'json',
          data: data,
          success: function () {
          },
          error: function (http) {
            if (http.status > 0 && http.status !== 200 && http.status !== 404 && http.status !== 503) {
              // 404 may happen intermittently and when Clean URLs isn't enabled
              // 503 may happen intermittently, see [#2158847]
              alert(Drupal.t('IPGV&M: an HTTP error @status occurred.', { '@status': http.status }));
            }
          },
          complete: function() {
            if (refresh_page) {
              window.location.reload();
            }
          }
        });
      }

    }
  };
})(jQuery);