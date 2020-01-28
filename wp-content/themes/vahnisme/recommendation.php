<?php
/*
Template Name: Recommendation
*/
?>

<?php get_header();?>
<?php include 'menu.php';?>
<section id="content" class="internal">
	<?php if(have_posts()) : ?>
	<?php while(have_posts()) : the_post();?>
	<div class="hero">
		<h1><?php the_title();?></h1>
		<h3>Producing high quality responsive websites/web apps and mobile apps.</h3>
	</div>

	<div id="maincontent">
		<div class="row">
			<div class="columns">
				<div class="section" id="write">
					<?php the_content();?>
					
					<div class="callout success hire-form">
						<?php echo do_shortcode('[contact-form-7 id="120" title="Recommendation"]');?>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php endwhile;?>
<?php endif; wp_reset_query();?>
</section>
<?php get_footer();?>