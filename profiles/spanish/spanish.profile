<?php
/**
 * @file
 * Install spanish profile.
 */

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function spanish_form_install_configure_form_alter(&$form, $form_state) {
  // Populate variables.
  $profilename = drupal_get_profile();
  $function = $profilename . '_profile_details';
  if (function_exists($function)) {
    $details = $function();
    // $details = spanish_profile_details();
    // Pre-populate the site name with the server name.
    $form['site_information']['site_name']['#default_value'] = $details['site_name'];
    $form['site_information']['site_mail']['#default_value'] = $details['site_mail'];
    $form['admin_account']['account']['name']['#default_value'] = $details['name'];
    $form['admin_account']['account']['mail']['#default_value'] = $details['mail'];
    $form['server_settings']['date_default_timezone']['#default_value'] = 'America/Lima';
    $form['update_notifications']['update_status_module']['#default_value'] = array(1);
    $file_private_path = $details['file_private_path'];
  }
  // Add textfield for private filesystem settings.
  $form['filesystem_settings'] = array(
    '#title' => st('Filesystem settings'),
    '#type' => 'fieldset',
  );
  $form['filesystem_settings']['file_private_path'] = array(
    '#type' => 'textfield',
    '#title' => st('Private file system path'),
    '#default_value' => variable_get('file_private_path', $file_private_path),
    '#maxlength' => 255,
    '#required' => TRUE,
  );

  $form['#validate'][] = 'spanish_file_private_path_validate';
  $form['#submit'][] = 'spanish_file_private_path_submit';
}

/**
 * Validate private path as a sumbit validate.
 */
function spanish_file_private_path_validate($form, $form_state) {
  $dir = $form_state['values']['file_private_path'];
  if (!file_prepare_directory($dir, FILE_CREATE_DIRECTORY)) {
    if (is_dir($dir)) {
      form_set_error('file_private_path', 'The private filesystem path is not writable. Drupal needs write permissions to ' . $dir);
    }
    else {
      form_set_error('file_private_path', 'The private filesystem folder does not exist and can not be created. Please set the permissions, or create the folder manually.');
    }
  }
}

/**
 * Set the privte path as a submit action.
 */
function spanish_file_private_path_submit($form, $form_state) {
  variable_set('file_private_path', $form_state['values']['file_private_path']);
}

/**
 * Allow profile to pre-select the language, skipping the selection.
 */
function spanish_profile_details() {
  $details['language'] = "es";
  $details['pathauto_update_action'] = 2;
  $details['pathauto_ignore_words'] = 'a, an, as, at, before, but, by, for, from, is, in, into, like, of, off, on, onto, per, since, than, the, this, that, to, up, via, with, ¡, ¿, el, la, con, de, lo, y, del, es, en, como, por, que';
  $details['pathauto_reduce_ascii'] = TRUE;
  $details['pathauto_transliterate'] = TRUE;
  // Sistema de archivos.
  $details['file_private_path'] = 'sites/default/files/private';
  // Captcha.
  $details['captcha_default_challenge'] = 'image_captcha/Image';
  // Set timezone for date_timezone.module.
  $details['date_format_short'] = 'd/m/Y - H:i';
  $details['date_format_medium'] = 'D, d/m/Y - H:i';
  $details['date_format_long'] = 'l, j F, Y - H:i';
  $details['site_default_country'] = "PE";
  // Alter configuration form.
  $details['site_name'] = $_SERVER['SERVER_NAME'];
  $details['site_mail'] = "webmaster@" . $_SERVER['SERVER_NAME'];
  $details['name'] = "admin";
  $details['mail'] = "webmaster@" . $_SERVER['SERVER_NAME'];
  // If PROFILENAME.inc exists, override variables.
  $profilename = drupal_get_profile();
  $include_file = DRUPAL_ROOT . '/profiles/' . $profilename . '/includes/' .  $profilename . '.inc';
  if (is_file($include_file)) {
    include_once $include_file;
    $function = $profilename . '_variable_set';
    if (function_exists($function)) {
      $override_details = $function();
      $details = array_merge($details, $override_details);
    }
  }
  return $details;
}
