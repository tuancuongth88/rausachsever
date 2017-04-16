<div class="row">
    <?php if ($banners) { ?>
        <div class="col-sm-3" id="column_left">
            <?php foreach ($banners as $key => $banner) {
                if ($key == 0) {
                    if ($banner['link']) {
                        echo "<a href='" . $banner['link'] . "'><img alt=\"" . $banner['title'] . "\" src=\"" . $banner['image'] . "\" class=\"hidden-xs\"></a>";
                    } else {
                        echo "<img alt=\"" . $banner['title'] . "\" src=\"" . $banner['image'] . "\" class=\"hidden-xs\">";
                    }
                }
            } ?>
        </div>
    <?php } ?>
    <div class="col-sm-9">
        <div class="row">
            <div class="col-sm-8">
                <div class="box with-scroll hidden-xs">
                    <!-- Carousel nav -->
                    <a class="next-button" href="#myCarouse_product_latest_l3221640"
                       id="myCarouse_product_latest_l3221640_next"><span></span></a>
                    <a class="prev-button" href="#myCarouse_product_latest_l3221640"
                       id="myCarouse_product_latest_l3221640_prev"><span></span></a>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            var owl3221640 = $(".box #myCarouse_product_latest_l3221640 .carousel-inner");

                            $("#myCarouse_product_latest_l3221640_next").click(function () {
                                owl3221640.trigger('owl.next');
                                return false;
                            })
                            $("#myCarouse_product_latest_l3221640_prev").click(function () {
                                owl3221640.trigger('owl.prev');
                                return false;
                            });

                            owl3221640.owlCarousel({
                                slideSpeed: 500,
                                singleItem: true
                            });
                        });
                    </script>

                    <div class="box-heading2"><?php echo $heading_title; ?></div>
                    <div class="box-content products ">
                        <div class="box-product">
                            <div id="myCarouse_product_latest_l3221640" class="carousel slide">
                                <!-- Carousel items -->
                                <div class="carousel-inner">
                                    <?php if ($products) { ?>
                                        <?php foreach (array_chunk($products, 3) as $key2 => $_products) { ?>
                                            <div class="<?php if ($key2 == 0) { ?>active<?php } ?> item">
                                                <div class="product-grid">
                                                    <div class="row">
                                                        <?php foreach ($_products as $product) { ?>
                                                            <div class="col-sm-4 col-xs-6">
                                                                <!-- Product -->
                                                                <div class="product clearfix">
                                                                    <div class="left">
                                                                        <div class="image">
                                                                            <div class="flybar">
                                                                                <div class="compare">
                                                                                    <a onclick="compare.add('<?php echo $product['product_id']; ?>');"
                                                                                       title="<?php echo $button_compare; ?>"
                                                                                       class="fa  fa-external-link product-icon"></a></a>
                                                                                </div>
                                                                                <div class="quickview">
                                                                                    <a rel="<?php echo $product['href']; ?>"
                                                                                       title="<?php echo $product['name']; ?>"
                                                                                       class="fa fa-search"></a>
                                                                                </div>
                                                                                <div class="wishlist">
                                                                                    <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');"
                                                                                       title="<?php echo $button_wishlist; ?>"
                                                                                       class="fa fa-heart-o product-icon"></a></a>
                                                                                </div>

                                                                                <div class="addtocart">
                                                                                    <a onclick="cart.add('<?php echo $product['product_id']; ?>');"
                                                                                       class="button"><span><?php echo $button_cart; ?></span></a>
                                                                                </div>
                                                                            </div>


                                                                            <a href="<?php echo $product['href']; ?>">
                                                                                <img
                                                                                    src="<?php echo $product['thumb']; ?>"
                                                                                    alt="<?php echo $product['name']; ?>"/>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="right">
                                                                        <div class="name"><a
                                                                                href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                                                        </div>
                                                                        <?php if ($product['price']) { ?>
                                                                            <div class="price">
                                                                                <?php if (!$product['special']) { ?>
                                                                                    <?php echo $product['price']; ?>
                                                                                <?php } else { ?>
                                                                                    <span
                                                                                        class="price-new"><?php echo $product['special']; ?></span>
                                                                                    <span
                                                                                        class="price-old"><?php echo $product['price']; ?></span>
                                                                                <?php } ?>
                                                                            </div>
                                                                        <?php } ?>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    <?php } ?>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>


                <div class="box with-scroll visible-xs">
                    <!-- Carousel nav -->
                    <a class="next-button" href="#myCarouse_product_latest_xs_315018"
                       id="myCarouse_product_latest_xs_315018_next"><span></span></a>
                    <a class="prev-button" href="#myCarouse_product_latest_xs_315018"
                       id="myCarouse_product_latest_xs_315018_prev"><span></span></a>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            var owl315018 = $(".box #myCarouse_product_latest_xs_315018 .carousel-inner");

                            $("#myCarouse_product_latest_xs_315018_next").click(function () {
                                owl315018.trigger('owl.next');
                                return false;
                            })
                            $("#myCarouse_product_latest_xs_315018_prev").click(function () {
                                owl315018.trigger('owl.prev');
                                return false;
                            });

                            owl315018.owlCarousel({
                                slideSpeed: 500,
                                singleItem: true
                            });
                        });
                    </script>
                </div>
            </div>

            <?php if($informations): ?>
            <div class="col-sm-4" id="column_right">
                <div class="box">
                    <div class="box-heading"><?php echo $text_information; ?></div>
                    <div class="box-content" style="height: 304px;">
                        <div class="box-information">
                            <ul>
                                <?php foreach ($informations as $information) { ?>
                                    <li>
                                    <a href="<?php echo $information['href'] ?>"><?php echo $information['title'] ?></a></li>
                                <?php } ?>
                                <li>
                                    <a href="<?php echo $contact ?>"><?php echo $text_contact ?></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <?php endif; ?>
        </div>
    </div>


</div>