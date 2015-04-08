; Make file for Spanish Profile.
api = 2
core = 7.x

; Close future
; translations[] = es

; Modules
projects[] = backup_migrate
projects[] = captcha
projects[] = ckeditor
projects[] = css_emimage
projects[] = ctools
projects[] = devel
projects[] = dhtml_menu
projects[] = ds
projects[] = filefield_paths
projects[] = imce
projects[] = l10n_client
projects[] = l10n_update
projects[] = libraries
projects[] = page_title
projects[] = pathauto
projects[] = entity
projects[] = entityreference
projects[] = token
projects[] = transliteration
projects[] = views
projects[] = admin_menu
projects[] = skinr
projects[] = diff
projects[] = google_analytics
projects[] = typogrify
projects[] = features
projects[] = media
projects[] = link
projects[] = context
projects[] = luxe
projects[] = date
projects[] = webform
projects[] = jquery_update
projects[] = xmlsitemap
projects[] = views_slideshow
projects[] = redirect
projects[] = metatag
projects[] = less
projects[] = honeypot
projects[] = nivo_slider
projects[] = mailsystem
projects[] = mimemail
projects[] = cloud_zoom
projects[] = chosen
projects[] = videojs
projects[] = jquery_ajax_load
projects[] = twitter_bootstrap_modal
projects[] = social-share
projects[] = shorten
projects[] = search_api
projects[] = search_api_db
projects[] = search_api_sorts
projects[] = facetapi
projects[] = facetapi_pretty_paths
projects[] = seo_ui
projects[] = save_draft
projects[] = javascript_libraries
projects[] = edit_profile
projects[] = edit
projects[] = menu_attributes
projects[] = scrollreveal
projects[] = parallax_bg
projects[] = navbar

; themes
projects[] = bootstrap_barrio
projects[] = bootstrap
projects[] = tao
projects[] = rubik

; PLUPLOAD
libraries[plupload][download][type] = "get"
libraries[plupload][download][url] = "https://github.com/jamie-pate/plupload/archive/master.zip"
libraries[plupload][directory_name] = "plupload"
libraries[plupload][destination] = "libraries"

; CKEditor
libraries[ckeditor][download][type]= "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.4.4/ckeditor_4.4.4_full.zip"
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][destination] = "libraries"

; Underscore
libraries[underscore][download][type]= "get"
libraries[underscore][download][url] = "http://underscorejs.org/underscore-min.js"
libraries[underscore][directory_name] = "underscore"
libraries[underscore][destination] = "libraries"

; Backbone
libraries[backbone][download][type]= "get"
libraries[backbone][download][url] = "http://backbonejs.org/backbone-min.js"
libraries[backbone][directory_name] = "ckeditor"
libraries[backbone][destination] = "libraries"

; Cloud Zoom
libraries[cloud-zoom][type] = "libraries"
libraries[cloud-zoom][download][type] = "file"
libraries[cloud-zoom][download][url] = "http://www.professorcloud.com/downloads/cloud-zoom.1.0.3.zip"
libraries[ckeditor][destination] = "libraries"

; Chosen included in chosen.make
