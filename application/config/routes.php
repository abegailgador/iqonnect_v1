<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'Auth/index';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;


// --------------------------------------------------------------------------
// Auth Routes

$route['user/login'] = 'Auth/login';
$route['user/updatepassword'] = 'Auth/updatepassword';


$route['iqonnect'] = 'Pages/view';
