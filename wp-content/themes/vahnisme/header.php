<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="alternate" href="https://www.ervandra.com/" hreflang="x-default" />
	<meta name="author" content="Ervandra Halim">
	<link rel="author" href="https://plus.google.com/u/0/110270446180309877178">

	<link rel="shortcut icon" href="<?php echo esc_url(home_url('/')); ?>favicon.ico"/>

    <meta name="theme-color" content="#045f8c">
	
	<?php add_action('wp_head', 'vahn_styles',5);?>
	<?php add_action('wp_enqueue_scripts', 'vahn_scripts');?>
	<title><?php wp_title( '|', true, 'right' ); ?></title>
	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>