<?php
//var_dump(123);die;
// Version
define('VERSION', '2.3.0.2');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: install/index.php');
	exit;
}
//  var_dump(DIR_SYSTEM . 'startup.php');die;
// Startup
require_once(DIR_SYSTEM . 'startup.php');
//var_dump(123);die
start('catalog');
