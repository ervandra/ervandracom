<?php
/*
Template Name: Testimonials
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

<?php $argsTestimonials = array('category__in'=>array(3), 'posts_per_page'=>'-1');?>
<?php $queryTestimonials = new WP_Query($argsTestimonials);?>
<?php if($queryTestimonials->have_posts()) : ?>

	<div class="inner-section">
		<div class="row">
			<div class="columns">
				<div class="section">
				<?php while($queryTestimonials->have_posts()) : $queryTestimonials->the_post();?>
					<blockquote>
						<?php the_content();?>
						<cite><?php the_title();?>, <?php the_field('company_position');?> of <?php the_field('testimonial_company');?></cite>
					</blockquote>
					
				<?php endwhile;?>
				<hr id="write">
				<h6>You can also write recommendation letter for Ervan below. Your testimonial will be published into this page.</h6>
				<div class="callout secondary hire-form">
						<?php echo do_shortcode('[contact-form-7 id="120" title="Recommendation"]');?>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php endif;?>
<?php wp_reset_query();?>
</section>
<?php get_footer();?>