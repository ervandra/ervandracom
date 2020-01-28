<?php
$_home = esc_url(home_url('/'));
$_dir = get_template_directory_uri();
$_idx = get_the_ID();
$_parents = get_post_ancestors(get_the_ID());
$_parent = ($_parents) ? $_parents[count($_parents)-1]: get_the_ID();
?>
<div class="off-canvas-wrapper">
<div class="off-canvas position-right" id="mobile-menu" data-off-canvas>
  <div class="mobile-offcanvas-container">
    <div class="logo-mobile-container" class="close-button" aria-label="Close menu" data-close>
      <div class="logo-mobile">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 160 160" xmlns:xlink="http://www.w3.org/1999/xlink" width="48" height="48">
        <defs>
          <path id="a" d="M80 160c44.183 0 80-35.817 80-80S124.183 0 80 0 0 35.817 0 80s35.817 80 80 80zm0-17c34.794 0 63-28.206 63-63 0-24.76-14.285-46.186-35.063-56.483C99.517 19.345 90.033 17 80 17c-34.794 0-63 28.206-63 63s28.206 63 63 63z"/>
        </defs>
        <g fill="#fff" fill-rule="evenodd">
          <path fill="#FFF" d="M66 72h44v16H66zM50 96h60v16H50zm0-48h60v16H50z"/>
          <use class="circle-fill" xlink:href="#a"/>
        </g>
      </svg>
      <div class="sitename">
        <div class="logo-name">Ervandra Halim</div>
        <div class="slogan-name">Website & Mobile Developer</div>
      </div>
      </div>
      <div  aria-label="Close menu" class="closebutton"><span aria-hidden="true">&times;</span></div>
    </div>
    <?php wp_nav_menu( array( 'theme_location' => 'primary-menu', 'container_id'=>'mobile-menu-nav', 'menu_class'=>'my-mobile-menu') );?>
    <div class="social-mobile">
      <ul>
        <li class="facebook"><a href="https://www.facebook.com/ervandra.halim" target="_blank" rel="noopener"><span class="fa fa-facebook"></span></a></li>
        <li class="twitter"><a href="https://www.twitter.com/vahnisme" target="_blank" rel="noopener"><span class="fa fa-twitter"></span></a></li>
        <li class="instagram"><a href="https://www.instagram.com/vahnisme" target="_blank" rel="noopener"><span class="fa fa-instagram"></span></a></li>
        <li class="linkedin"><a href="https://www.linkedin.com/in/ervandra" target="_blank" rel="noopener"><span class="fa fa-linkedin"></span></a></li>
      </ul>
    </div>
  </div>
</div>
<div class="off-canvas-content" data-off-canvas-content>
<header id="header">
  <div class="row align-justify">
    <div class="columns shrink">
      <div class="logo">
        <a href="<?php echo $_home;?>">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 160 160" xmlns:xlink="http://www.w3.org/1999/xlink" width="48" height="48">
            <defs>
              <path id="a" d="M80 160c44.183 0 80-35.817 80-80S124.183 0 80 0 0 35.817 0 80s35.817 80 80 80zm0-17c34.794 0 63-28.206 63-63 0-24.76-14.285-46.186-35.063-56.483C99.517 19.345 90.033 17 80 17c-34.794 0-63 28.206-63 63s28.206 63 63 63z"/>
            </defs>
            <g fill="#fff" fill-rule="evenodd">
              <path fill="#FFF" d="M66 72h44v16H66zM50 96h60v16H50zm0-48h60v16H50z"/>
              <use class="circle-fill" xlink:href="#a"/>
            </g>
          </svg>
          <span class="site-name">
            <span class="title">
              <span class="letter l1">E</span>
              <span class="letter l2">r</span>
              <span class="letter l3">v</span>
              <span class="letter l4">a</span>
              <span class="letter l5">n</span>
              <span class="letter l6">d</span>
              <span class="letter l7">r</span>
              <span class="letter l8">a</span>
              <span class="letter l9 space">&nbsp;</span>
              <span class="letter l10">H</span>
              <span class="letter l11">a</span>
              <span class="letter l12">l</span>
              <span class="letter l13">i</span> 
              <span class="letter l14">m</span>
            </span>
            <span class="slogan">
              <span class="letter s1">W</span>
              <span class="letter s2">e</span>
              <span class="letter s3">b</span>
              <span class="letter s4">s</span>
              <span class="letter s5">i</span>
              <span class="letter s6">t</span>
              <span class="letter s7">e</span>
              <span class="letter s8">&nbsp;</span>
              <span class="letter s9">&amp;</span>
              <span class="letter s10">&nbsp;</span>
              <span class="letter s11">M</span>
              <span class="letter s12">o</span>
              <span class="letter s13">b</span>
              <span class="letter s14">i</span>
              <span class="letter s15">l</span>
              <span class="letter s16">e</span>
              <span class="letter s17">&nbsp;</span>
              <span class="letter s18">D</span>
              <span class="letter s19">e</span>
              <span class="letter s20">v</span>
              <span class="letter s21">e</span>
              <span class="letter s22">l</span>
              <span class="letter s23">o</span>
              <span class="letter s24">p</span>
              <span class="letter s25">e</span>
              <span class="letter s26">r</span>
            </span>
          </span>
        </a>
      </div>
    </div>
    <div class="columns">
      <div class="main-navigation">
        <?php wp_nav_menu( array( 'theme_location' => 'primary-menu', 'container_id'=>'main-menu', 'menu_class'=>'my-menu') );?>
        <div class="mobile-nav-container">
          <a class="mobile-nav-trigger" href="#mobile-menu" data-toggle="mobile-menu" title="Open Menu"><span class="fa fa-bars"></span></a>
        </div>
      </div>
    </div>
  </div>
</header>