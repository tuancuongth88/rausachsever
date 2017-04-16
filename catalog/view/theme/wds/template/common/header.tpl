<!DOCTYPE html>
<!--[if IE 7]>
<html lang="<?php echo $lang; ?>" class="ie7 responsive"> <![endif]-->
<!--[if IE 8]>
<html lang="<?php echo $lang; ?>" class="ie8 responsive"> <![endif]-->
<!--[if IE 9]>
<html lang="<?php echo $lang; ?>" class="ie9 responsive"> <![endif]-->
<!--[if !IE]><!-->
<html lang="<?php echo $lang; ?>" class="responsive"> <!--<![endif]-->
<head>
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>"/>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <!-- Google Fonts -->
    <link
        href='http://fonts.googleapis.com/css?family=Roboto:400,300,500,400italic,300italic,500italic,700,700italic,900,900italic,100italic,100&amp;subset=latin,cyrillic-ext,greek-ext,greek,vietnamese,latin-ext,cyrillic'
        rel='stylesheet' type='text/css'>
    <link
        href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300,300italic,400italic,700italic&amp;subset=latin,cyrillic-ext,greek-ext,greek,vietnamese,latin-ext,cyrillic'
        rel='stylesheet' type='text/css'>

    <link rel="stylesheet" type="text/css" href="catalog/view/theme/wds/css/cache_css.css" media="screen"/>
    <script type="text/javascript" src="catalog/view/theme/wds/js/cache_js.js"></script>
    <script type="text/javascript" src="catalog/view/theme/wds/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="catalog/view/theme/wds/js/jquery.themepunch.revolution.min.js"></script>
    <script type="text/javascript" src="catalog/view/theme/wds/js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="catalog/view/theme/wds/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="catalog/view/theme/wds/js/jquery.jcarousel.min.js"></script>
    <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
              media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
        <?php echo $analytic; ?>
    <?php } ?>
    <style>
    <?php if($change_color_bg_menu){ ?>
    .button,.htabs a,#header .button-search, .megamenu-wrapper{background: #<?php echo $change_color_bg_menu; ?>;}
    <?php } ?>
    <?php if($change_color_bg_copyright){ ?>
    .copyright{background: #<?php echo $change_color_bg_copyright; ?>;}
    <?php } ?>
    <?php if($change_color_bg_body_background_image){ ?>
    body{background-image: url("<?php echo $change_color_bg_body_background_image; ?>");
    <?php if($change_color_bg_body_image_background_attachment){ ?>background-attachment: <?php echo $change_color_bg_body_image_background_attachment; ?>;<?php } ?>
    <?php if($change_color_bg_body_image_background_repeat){ ?>background-repeat: <?php echo $change_color_bg_body_image_background_repeat; ?>;<?php } ?>
    <?php if($change_color_bg_body_image_background_size){ ?>background-size: <?php echo $change_color_bg_body_image_background_size; ?>;<?php } ?>
    <?php if($change_color_bg_body_image_background_position){ ?>background-position: <?php echo $change_color_bg_body_image_background_position; ?>;<?php } ?>}
    <?php } elseif($change_color_bg_body ){ ?>
    body {background: #<?php echo $change_color_bg_body; ?>;}
    <?php } ?>
    <?php if($change_color_link_hover){ ?>
    .scrollup {background: none repeat scroll 0 0 #<?php echo $change_color_link_hover; ?>;}
    .htabs a:hover,.htabs a.selected,ul.megamenu > li:hover,#header .button-search:hover,#cart .cart-heading{background: #<?php echo $change_color_link_hover; ?>;}
    .center-column #title-page,.custom-footer a:hover, .footer a:hover,.product-list .actions > div .price,.product-list .name a:hover,.rating i.active,.product-grid .product .name a:hover,.product-grid .product .price,.box-information > ul > li > a:hover ,.category-list a:hover,.product-compare a:hover,.product-filter .options .button-group button:hover,.product-filter .options .button-group .active.tab-content .prev-button:hover,.tab-content .next-button:hover,.tab-content .prev-button span:hover, .tab-content .next-button span:hover,.box .prev-button:hover,.box .prev-button span:hover, .box .prev-button2:hover,.box .prev-button2 span:hover, .box .next-button:hover ,.box .next-button span:hover,.box .next-button2:hover ,.box .next-button2 span:hover,.box .next-button span:hover, .box .prev-button span:hover, .box .next-button2 span:hover, .box .prev-button2 span:hover#welcome a:hover,a:hover {color:#<?php echo $change_color_link_hover; ?>;}
    .button:hover {background:none repeat scroll 0 0 #<?php echo $change_color_link_hover; ?>;color:#ffffff;}.box-heading::before {border-bottom:2px solid #<?php echo $change_color_link_hover; ?>;}
    <?php } ?>
    </style>
    <script type="text/javascript">
        var transition = 'slide';
        var animation_time = 300;
    </script>
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script src="catalog/view/theme/wds/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div id="quickview" class="modal fade bs-example-modal-lg">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" style="text-align:left;" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title"><?php echo $text_wds_product; ?></h4>
            </div>
            <div class="modal-body">
                <p></p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('body').on('click', '.quickview a', function () {
        $('#quickview .modal-header .modal-title').html($(this).attr('title'));
        $('#quickview .modal-body').load($(this).attr('rel') + ' #quickview_product', function (result) {
            $('#quickview').modal('show');
            $('#quickview .popup-gallery').magnificPopup({
                delegate: 'a',
                type: 'image',
                tLoading: 'Loading image #%curr%...',
                mainClass: 'mfp-img-mobile',
                gallery: {
                    enabled: true,
                    navigateByImgClick: true,
                    preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
                },
                image: {
                    tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
                    titleSrc: function (item) {
                        return item.el.attr('title');
                    }
                }
            });
        });
        return false;
    });

    $('#quickview').on('click', '#button-cart', function () {
        $('#quickview').modal('hide');
        cart.add($(this).attr("rel"));
    });
</script>
<div class="fixed-body">
    <div id="main" class="main-fixed">
        <header>
            <div id="top-line">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 hidden-xs">
                            <div id="welcome">
                                <?php echo $config_owner; ?>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12 hidden-xs">
                            <div class="quick-access">
                                <?php echo $currency; ?>
                                <div class="dropdown  my-account tg-account hidden-xs hidden-sm">
                                    <div id="my-account">
                                        <div class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                                            <?php echo $text_account; ?>
                                        </div>

                                        <ul class="dropdown-menu" role="menu">
                                            <?php if ($logged) { ?>
                                                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                            <?php } else { ?>
                                                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                            <?php } ?>
                                            <li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
                                            <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                                            <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <?php echo $language; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="header">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 logo-inner">
                            <div class="logo-store">
                                <?php if ($logo) { ?>
                                    <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
                                                                        alt="<?php echo $name; ?>" class="img-responsive"/></a>
                                <?php } else { ?>
                                    <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                                <?php } ?>
                            </div>
                        </div>

                        <!-- Search Holder -->
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 hidden-xs">
                            <?php echo $search; ?>
                        </div>

                        <!-- Cart Holder -->
                        <div id="header-right" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 hidden-xs">
                            <!-- Cart block -->
                            <?php echo $cart; ?>
                        </div>
                    </div>
                </div>

                <div class="visible-xs col-xs-12" style="text-align:center;display:inline-block; margin-bottom:20px;">
                    <div id="megaMenuToggle">
                        <div class="megamenuToogle-wrapper">
                            <div class="megamenuToogle-pattern">
                                <div class="container">
                                    <span class="fa fa-bars"></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a href="<?php echo $shopping_cart; ?>">
                        <div class="tg-search" style="display:inline-block;">
                            <span class="fa fa-shopping-cart"></span>
                        </div>
                    </a>
                </div>

                <div class="container horizontal">
                    <div class="megamenu-wrapper">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
                             style="padding-left: 0px; padding-right: 0px;">
                            <ul class="megamenu">
                                <?php foreach ($categories as $category) { ?>
                                    <?php if ($category['children']) { ?>

                                        <li class="with-sub-menu hover"><p class="close-menu"></p>
                                            <a href="<?php echo $category['href']; ?>"><span><strong><?php echo $category['name']; ?></strong></span></a>
                                            <div class="sub-menu" style="width: 220px">
                                                <div class="content">
                                                    <div class="row hover-menu">
                                                        <div class="col-sm-12">
                                                            <div class="menu">
                                                                <ul>
                                                                    <?php foreach ($category['children'] as $child) { ?>
                                                                        <li>
                                                                            <a href="<?php echo $child['href']; ?>" onclick="window.location = '<?php echo $child['href']; ?>';"><?php echo $child['name']; ?></a>
                                                                        </li>
                                                                    <?php } ?>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    <?php } else { ?>
                                        <li><a href="<?php echo $category['href']; ?>"><span><strong><?php echo $category['name']; ?></strong></span></a></li>
                                    <?php } ?>
                                <?php } ?>
                                    <!-- add ve chung toi -->
                                   <?php
                                        $dataInfomation = search_in_array($informations, 'id', 4);
                                   ?>
                                    <li><a href="<?php print $dataInfomation[0]['href']; ?>"><?php print $dataInfomation[0]['title']; ?></a></li>
                                    <?php 
                                     ?>
                                    <li><a href="index.php?route=custom/serwis">Tin mới</a></li>
                                    <?php ?>
                            </ul>
                        </div>
                    </div>
                </div>
        </header>
        <div class="container"><div id="notification"><div id="content"></div></div></div>
