<?php

/**
 * @file
 * Export of OAuth login provider's Services endpoint
 */

/**
 * Implementation of hook_default_services_endpoint().
 */
function oauthloginprovider_default_services_endpoint() {
  $endpoints = array();

  $endpoint = new stdClass;
  $endpoint->disabled = FALSE; /* Edit this to true to make a default endpoint disabled initially */
  $endpoint->api_version = 3;
  $endpoint->name = 'oauthlogin';
  $endpoint->title = 'OAuth login API';
  $endpoint->server = 'rest_server';
  $endpoint->path = 'oauthlogin/api';
  $endpoint->authentication = array(
    'services_oauth' => array(
      'oauth_context' => 'oauthlogin',
      'authorization' => '',
      'credentials' => 'token',
    ),
  );
  $endpoint->server_settings = array(
    'formatters' => array(
      'bencode' => TRUE,
      'json' => TRUE,
      'php' => TRUE,
      'rss' => TRUE,
      'xml' => TRUE,
      'yaml' => TRUE,
      'jsonp' => FALSE,
    ),
    'parsers' => array(
      'application/json' => TRUE,
      'application/vnd.php.serialized' => TRUE,
      'application/x-www-form-urlencoded' => TRUE,
      'application/x-yaml' => TRUE,
      'multipart/form-data' => TRUE,
    ),
  );
  $endpoint->resources = array(
    'oauthlogin' => array(
      'alias' => 'login',
      'actions' => array(
        'info' => array(
          'enabled' => 1,
          'services_oauth' => array(
            'credentials' => 'token',
            'authorization' => 'user_info',
          ),
        ),
      ),
    ),
  );
  $endpoints[$endpoint->name] = $endpoint;

  return $endpoints;
}
