<?php
/*
Template Name: Internal
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
				<div class="section">
					<?php the_content();?>
				</div>
			</div>
		</div>
	</div>
<?php endwhile;?>
<?php endif; wp_reset_query();?>
</section>
<?php get_footer();?>