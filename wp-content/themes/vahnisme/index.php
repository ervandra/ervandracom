<?php get_header(); ?>
<?php include 'menu.php';?>

<section id="content" class="home">
  <div class="hero home">
    <h1>WordPress & Web Apps Developer</h1>
    <h2>Producing high quality responsive websites/web apps and mobile apps.<br/>Are you with me? <span class="blinking">_</span></h2>
    <h4 class="perspective"><a href="#portfolio">View Portfolio<br/><span class="fa fa-angle-down"></span></a></h3>
  </div>

  <div class="van-portfolio featured" id="portfolio">
    <div class="row">
      <div class="columns">
        <h2>Latest Projects</h2>
      </div>
    </div>

    <div class="row-project">
      <div class="columns">
        <div id="container-isotope" class="js-isotope">

          <?php $count = 8;?>
          <?php if(wp_is_mobile()){ $count = 3; }?>

          <?php $argsPortfolio = array('post_type'=>'post', 'posts_per_page'=>$count, 'category__in'=>array('2'));?>
          <?php $queryPortfolio = new WP_Query($argsPortfolio);?>
          <?php if($queryPortfolio->have_posts()) : ?>
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
          <?php endif;?>
          <?php wp_reset_query();?>

          <!-- <div class="item corporate webapps">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-ciayo-comics.jpg" alt="CIAYO Comics">
              </div>
              <div class="portfolio-info">
                <h3>CIAYO Comics</h3>
                <p><span class="fa fa-user-o"></span>Front-End Developer</p>
              </div>
            </div>
          </div>
          
          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-ciayo-blog.jpg" alt="CIAYO Blog">
              </div>
              <div class="portfolio-info">
                <h3>CIAYO Blog</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-ciayo-games.jpg" alt="CIAYO Games">
              </div>
              <div class="portfolio-info">
                <h3>CIAYO Games</h3>
                <p><span class="fa fa-user-o"></span>Front-End Developer / QA</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-bulumataelise.jpg" alt="Bulu Mata Elise">
              </div>
              <div class="portfolio-info">
                <h3>Bulu Mata Elise</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-gerobakakilima.jpg" alt="Gerobak Kaki Lima">
              </div>
              <div class="portfolio-info">
                <h3>Gerobak Kaki Lima</h3>
                <p><span class="fa fa-user-o"></span>Front-End Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-sudirmanhill.jpg" alt="Sudirman Hill">
              </div>
              <div class="portfolio-info">
                <h3>Sudirman Hill</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-dragoncapital.jpg" alt="Dragon Capital Center">
              </div>
              <div class="portfolio-info">
                <h3>Dragon Capital Center</h3>
                <p><span class="fa fa-user-o"></span>Front-End Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-sanasini.jpg" alt="Sana Sini Travel">
              </div>
              <div class="portfolio-info">
                <h3>Sana Sini Travel</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-exoticon.jpg" alt="Exoticon">
              </div>
              <div class="portfolio-info">
                <h3>Exoticon</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-semenmerahputih.jpg" alt="Semen Merah Putih">
              </div>
              <div class="portfolio-info">
                <h3>Semen Merah Putih</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-divisi1.jpg" alt="Divisi-1">
              </div>
              <div class="portfolio-info">
                <h3>Divisi-1</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-innovative.jpg" alt="Innovative Formula">
              </div>
              <div class="portfolio-info">
                <h3>Innovative Formula</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-lightworks.jpg" alt="Lightworks">
              </div>
              <div class="portfolio-info">
                <h3>Lightworks</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-ultimo.jpg" alt="Ultimo Clinic">
              </div>
              <div class="portfolio-info">
                <h3>Ultimo Clinic</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-ovela.jpg" alt="Ovela Clinic">
              </div>
              <div class="portfolio-info">
                <h3>Ovela Clinic</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-lolibi.jpg" alt="Lolibi">
              </div>
              <div class="portfolio-info">
                <h3>Lolibi</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-iliadi.jpg" alt="Iliadi">
              </div>
              <div class="portfolio-info">
                <h3>Iliadi</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-ptrk.jpg" alt="PT Royal Korindah">
              </div>
              <div class="portfolio-info">
                <h3>PT Royal Korindah</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-homer.jpg" alt="Homer Interior">
              </div>
              <div class="portfolio-info">
                <h3>Homer Interior</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-zavoir.jpg" alt="ZAVOIR">
              </div>
              <div class="portfolio-info">
                <h3>ZAVOIR</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-kayonputih.jpg" alt="Kayon Putih">
              </div>
              <div class="portfolio-info">
                <h3>Kayon Putih</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-balagi.jpg" alt="Balagi & Dilmoni">
              </div>
              <div class="portfolio-info">
                <h3>Balagi & Dilmoni</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-raperind.jpg" alt="Raperind Motor">
              </div>
              <div class="portfolio-info">
                <h3>Raperind Motor</h3>
                <p><span class="fa fa-user-o"></span>Front-End Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-inciid.jpg" alt="INCIID">
              </div>
              <div class="portfolio-info">
                <h3>INCIID</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-solway.jpg" alt="Solway Indonesia">
              </div>
              <div class="portfolio-info">
                <h3>Solway Indonesia</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-rubyndo.jpg" alt="Rubyndo">
              </div>
              <div class="portfolio-info">
                <h3>Rubyndo</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-mulxindo.jpg" alt="Mulxindo">
              </div>
              <div class="portfolio-info">
                <h3>Mulxindo</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-indomaguro.jpg" alt="Indo Maguro">
              </div>
              <div class="portfolio-info">
                <h3>Indo Maguro</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-pembicara.jpg" alt="Pembicara">
              </div>
              <div class="portfolio-info">
                <h3>Pembicara</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-makanluar.jpg" alt="Makan Luar">
              </div>
              <div class="portfolio-info">
                <h3>Makan Luar</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-liyu.jpg" alt="Liyu Indonesia">
              </div>
              <div class="portfolio-info">
                <h3>Liyu Indonesia</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-ikons.jpg" alt="Ikons Furniture">
              </div>
              <div class="portfolio-info">
                <h3>Ikons Furniture</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-thekasablanka.jpg" alt="The Kasablanka">
              </div>
              <div class="portfolio-info">
                <h3>The Kasablanka</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-micebiz.jpg" alt="Mice Biz">
              </div>
              <div class="portfolio-info">
                <h3>Mice Biz</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-upperroom.jpg" alt="Upperroom">
              </div>
              <div class="portfolio-info">
                <h3>Upperroom</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-soundworks.jpg" alt="Soundworks">
              </div>
              <div class="portfolio-info">
                <h3>Soundworks</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-batiqa.jpg" alt="Batiqa Hotels">
              </div>
              <div class="portfolio-info">
                <h3>Batiqa Hotels</h3>
                <p><span class="fa fa-user-o"></span>Front-End Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-jababeka.jpg" alt="Jababeka Residence">
              </div>
              <div class="portfolio-info">
                <h3>Jababeka Residence</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-grandhatika.jpg" alt="Grand Hatika Hotels">
              </div>
              <div class="portfolio-info">
                <h3>Grand Hatika Hotels</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div>

          <div class="item corporate">
            <div class="portfolio-item">
              <div class="portfolio-img">
                <img src="<?php echo $_dir;?>/images/showcase/portfolio-plazahotel.jpg" alt="Plaza Hotel Glodok">
              </div>
              <div class="portfolio-info">
                <h3>Plaza Hotel Glodok</h3>
                <p><span class="fa fa-user-o"></span>Full Stack Developer</p>
              </div>
            </div>
          </div> -->

        </div>
      </div>
    </div>

    <div class="text-center perspective">
      <div class="columns small-12">
        <a href="<?php echo get_permalink(6);?>" class="button explore"><span class="blinking">Explore</span> More PORTFOLIO</a>
      </div>
    </div>
    
    <!-- <div class="horizontal-button perspective">
      <a href="#" class="button">Explore Portfolio <span class="fa fa-angle-right"></span></a>
    </div> -->
  </div>

  <div class="van-testimonials featured title-on-small" id="testimonials">
    <div class="row">
      <div class="columns">
        <h2>Testimonials</h2>
        <?php $argsTestimonials = array('category__in'=>array(3), 'posts_per_page'=>3)?>
        <?php $queryTestimonials = new WP_Query($argsTestimonials);?>
        <?php if($queryTestimonials->have_posts()) : ?>
          <?php while($queryTestimonials->have_posts()) : $queryTestimonials->the_post();?>
          <blockquote>
            <?php the_content();?>
            <cite><?php the_title();?>, <?php the_field('company_position');?> of <?php the_field('testimonial_company');?></cite>
          </blockquote>
          <?php endwhile;?>
        <?php endif;?>
        <?php wp_reset_query();?>

      </div>
    </div>
  </div>

  <div class="horizontal-button about-van featured perspective">
    <a href="<?php echo get_permalink(4);?>" class="button">About Ervandra <span class="fa fa-angle-right"></span></a>
  </div>
</section>

<?php get_footer(); ?>