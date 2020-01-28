<?php

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('WP_CACHE', true);

define('DB_NAME', 'DB_NAME');

/** MySQL database username */
define('DB_USER', 'DB_USER');

/** MySQL database password */
define('DB_PASSWORD', 'DB_PASSWORD');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'ffqdihiu0uuvzvxntigibfl4wuaq9aoaqcf9pwdkg6h510qidmdt8fp4qhxkl955');
define('SECURE_AUTH_KEY',  '0lnzsiffffzkgssddqwpnnhmkxeej2vloid6kfa9pjqbthusykvsv5teuihi6ibn');
define('LOGGED_IN_KEY',    '0qfab3qa54kjjlt5viwvbu9j4ut3knfx2buvvswfowq5ocetixszdi3gcugfkzzi');
define('NONCE_KEY',        'b7zjdzor5yjw7tkox3f4k14gj6m5zi3bqq57htnxxge04ruqlbxhgezrzuqt7cz4');
define('AUTH_SALT',        'kezcoszrk8avbcgugk2reeblq36dokqt9hechjb4zrbfbsxbqyhxqzgeksvdplro');
define('SECURE_AUTH_SALT', 'kbeoikbcrhrbvllsduwphp6eqbq3p7mxfwlvwhtefe96kzpq6ew9erga06hiptnq');
define('LOGGED_IN_SALT',   'btruf0icewkvwjvmsxixvzwsmxxgm5rcqwaal2j2eqcik6moxlxjhofekj3zdm3e');
define('NONCE_SALT',       'awrvs6shmurkuilcxsqei6eyqbxi1hf8ykez7spey7lemsup5ndgljfkviwpy8xb');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'sriwp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
