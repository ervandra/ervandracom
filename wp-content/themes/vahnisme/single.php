<?php get_header();?>
<?php include 'menu.php';?>

<?php $cat = get_the_category(); ?>
<?php $title = "";?>
<?php if($cat[0]->term_id==3) :?>
<?php $title = "Testimonial: ";?>
<?php elseif($cat[0]->term_id==2) :?>
<?php $title = "Portfolio: ";?>
<?php endif;?>

<section id="content" class="single <?php echo strtolower($cat[0]->name);?>">
<?php if(have_posts()) : ?>
<?php while(have_posts()) : the_post();?>
<div class="hero">
  <h1><small><?php echo $title;?></small><?php the_title();?></h1>
  <h3>Producing high quality responsive websites/web apps and mobile apps.</h3>
</div>

<div id="maincontent">
  <div class="row">
    <div class="columns">
      <div class="section">
      <?php if(has_post_thumbnail()) : ?>
          <div class="post-thumbnail">
            <?php the_post_thumbnail();?>
          </div>
        <?php endif;?>
        <?php if($cat[0]->term_id==3) : ?>
          <blockquote>
            <?php the_content();?>
          </blockquote>
        <?php else : ?>
        <?php the_content();?>
        <?php endif;?>
        <div class="hire-ervan-now">
          <h3>Get your own customized <strong>Website</strong>, <strong>Web Apps</strong> or <strong>Android Apps</strong> now! Hire me or contact me through this online form to request quotation for all of your online needs:</h3>
          <p><a href="<?php echo get_permalink(12)?>" class="button success large">Hire Now</a></p>
        </div>

      </div>
    </div>
  </div>
</div>
<?php endwhile;?>
<?php endif; wp_reset_query();?>
</section>

<?php get_footer();?>