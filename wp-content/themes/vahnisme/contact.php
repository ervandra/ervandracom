<?php
/*
Template Name: Contact
*/
?>

<?php get_header();?>
<?php include 'menu.php';?>
<section id="content" class="internal">
	<?php if(have_posts()) : ?>
	<?php while(have_posts()) : the_post();?>
	<div class="hero">
		<h1><?php the_title();?></h1>
		<h3>Producing high quality responsive websites, web apps and exceptional user experience.</h3>
	</div>

	<div id="maincontent">
		<div class="row">
			<div class="columns">
				<div class="section">
					<?php the_content();?>
					<hr/>
					<h6>Say Hello, and perhaps meet a bit for a cup of coffee</h6>
					<div class="contact callout primary">
						<?php echo do_shortcode('[contact-form-7 id="108" title="Contact"]');?>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php endwhile;?>
<?php endif; wp_reset_query();?>
</section>
<?php get_footer();?>