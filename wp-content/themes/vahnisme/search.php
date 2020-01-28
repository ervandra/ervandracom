<?php get_header();?>
<?php include 'menu.php';?>

<section id="content" class="internal search">

  <?php $paged = ( get_query_var( 'paged' ) ) ? get_query_var( 'paged' ) : 1; ?>
  
  <?php if(have_posts()) : ?>
  <div class="section" id="search">
	  
		  <div class="section-title text-center">
              <div class="row">
		<div class="columns">
			<h1>Search Results</h1>
            <div class="internal-search">
                <form role="search" method="get" id="searchform-internal" class="search-form" action="<?php echo esc_url( home_url( '/' ) ); ?>">
                <input type="search" class="search-field" placeholder="Search here.." value="<?php echo get_search_query(); ?>" name="s" id="s-internal"/>
                <button type="submit" class="button search-submit"><span class="fa fa-search"></span><span class="text">Search</span></button>
                </form>
            </div>
            </div>
            </div>
		  </div>
		  <div class="section-content">
              <div class="row">
		<div class="columns">
			<div class="news-list normal-news">
			  <?php while(have_posts()) : the_post();?>
			  <div class="news-item">
				<div class="news-thumbnail">
				  <a href="<?php the_permalink();?>" title="<?php the_title();?>"><?php the_post_thumbnail('thumbnail');?></a>
				</div>
				<div class="news-content">
				  <h4><a href="<?php the_permalink();?>" title="<?php the_title();?>"><?php the_title();?></a></h4>
				  <h6 class="meta date"><?php echo human_time_diff(get_the_time('U'), current_time('timestamp')) . ' ago'; ?></h6>
				</div>
			  </div>
			  <?php endwhile;?>
			</div>
			<div class="ciayo-pagination">
			  <ul>
                  <?php global $wp_query;?>
				<?php $big = 999999999; ?>
				<?php $args = array('base' => str_replace( $big, '%#%', esc_url( get_pagenum_link( $big ) ) ),'format' => '?page=%#%','total' => $wp_query->max_num_pages,'current' => max( 1, get_query_var( 'paged') ),'show_all' => false,'end_size' => 3,'mid_size' => 2,'prev_next' => True,'prev_text' => __('<span class="fa fa-angle-left"></span>'),'next_text' => __('<span class="fa fa-angle-right"></span>'),'type' => 'list',); ?>
				<?php echo paginate_links($args);?>
			  </ul>
			</div>
		  </div>
		</div>
	  </div>
	</div>
	<?php else : ?>
			<div class="section" id="empty">
				
						<div class="section-title text-center">
                            <div class="row">
					<div class="columns">
                            <h1>Search Results</h1>
                            <div class="internal-search">
                <form role="search" method="get" id="searchform-internal" class="search-form" action="<?php echo esc_url( home_url( '/' ) ); ?>">
                <input type="search" class="search-field" placeholder="Search here.." value="<?php echo get_search_query(); ?>" name="s" id="s-internal"/>
                <button type="submit" class="button search-submit"><span class="fa fa-search"></span><span class="text">Search</span></button>
                </form>
            </div>
                            </div>
                            </div>
						</div>
						<div class="section-content text-center">
                            <div class="row">
					<div class="columns">
                        <div class="search-not-found">
							<p>Oh, shoot. We couldn’t find anything about &ldquo;<?php echo esc_html( get_search_query());?>&rdquo;.<br>Try a different keyword for a different result.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
  <?php endif; wp_reset_query();?>

<?php get_footer();?>