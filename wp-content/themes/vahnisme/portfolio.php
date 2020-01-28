<?php
/*
Template Name: Portfolio
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

<?php $argsPortfolio = array('category__in'=>array(2), 'posts_per_page'=>'-1')?>
<?php $queryPortfolio = new WP_Query($argsPortfolio);?>
<?php if($queryPortfolio->have_posts()) : ?>
<div id="portfolio" class="inner-section">
	<div class="row-project">

			<div class="">
				<div id="container-isotope" class="js-isotope">
					<?php while($queryPortfolio->have_posts()) : $queryPortfolio->the_post();?>
					<?php $ptype = get_field('project_type');?>
					<div class="item <?php foreach($ptype as $type) { echo $type.' '; }?>">
						<div class="portfolio-item">
							<div class="portfolio-img">
								<?php the_post_thumbnail('medium');?>
							</div>
							<div class="portfolio-info">
								<h3><?php the_title();?></h3>
								<p><span class="fa fa-user-o"></span><?php the_field('project_role')?></p>
							</div>
							<a href="<?php echo get_permalink(get_the_ID());?>" class="link-block" title="View detail <?php the_title();?>"><span class="fa fa-search-plus"></span></a>
						</div>
					</div>
					<?php endwhile;?> 
				</div>

		</div>
	</div>
</div>
<?php endif;?>
<?php wp_reset_query();?>
</section>
<?php get_footer();?>