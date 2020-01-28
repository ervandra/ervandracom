<?php get_header();?>
<?php include 'menu.php';?>

<?php $_the_cat_id = 2;?>
<?php if(is_category() || is_single()) : ?>
<?php $_the_cat_id = get_query_var('cat'); ?>
<?php endif;?>

<?php if(have_posts()) : ?>
<section id="content" class="internal">

<div class="hero">
		<h1><?php the_title();?></h1>
		<h3>Producing high quality responsive websites/web apps and mobile apps.</h3>
  </div>
  
  <div id="maincontent">
  
          <div id="portfolio" class="inner-section">
            <div class="row-project">

              <div class="">
                <div id="container-isotope" class="js-isotope">
                  <?php while(have_posts()) : the_post();?>

                  <div class="item large">
                    <div class="portfolio-item">
                      <div class="portfolio-img">
                        <?php the_post_thumbnail('medium');?>
                      </div>
                      <div class="portfolio-info">
                        <h3>
                          <?php the_title();?>
                        </h3>
                        <p>
                          <?php echo get_the_excerpt(get_the_ID());?>
                        </p>
                      </div>
                      <a href="<?php echo get_permalink(get_the_ID());?>" class="link-block" title="View detail <?php the_title();?>">
                        <span class="fa fa-search-plus"></span>
                      </a>
                    </div>
                  </div>
                  <?php endwhile;?>
                </div>

              
        </div>
      </div>
    </div>
  </div>

</section>
<?php endif;?>

<?php get_footer();?>