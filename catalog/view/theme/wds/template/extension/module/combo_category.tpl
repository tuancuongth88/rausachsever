<?php if($categories){ ?>

    <div class="row" style="margin-bottom: 10px;">
        <div class="col-sm-12">
            <?php if(count($categories) > 1){ ?>
            <div class="filter-product hidden-xs">
                <div class="filter-tabs">
                    <div class="bg-filter-tabs">
                        <div class="bg-filter-tabs2 clearfix">
                            <ul id="tab-md-<?php echo $module; ?>">
                                <?php foreach($categories as $key => $category){ ?>
                                <li <?php if($key == 0){ ?>class="active"<?php } ?>><a href="#category-md-<?php echo $module; ?>-<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></a></li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="tab-content">
                    <?php foreach($categories as $key => $category){ ?>
                        <div class="tab-pane <?php if($key == 0){ ?>active<?php } ?>" id="category-md-<?php echo $module; ?>-<?php echo $category['category_id']; ?>">
                            <!-- Carousel nav -->
                            <a class="next-button" href="#myCarouse-<?php echo $module; ?>-<?php echo $category['category_id']; ?>"
                               id="myCarouse-<?php echo $module; ?>-<?php echo $category['category_id']; ?>_next"><span></span></a>
                            <a class="prev-button" href="#myCarouse-<?php echo $module; ?>-<?php echo $category['category_id']; ?>"
                               id="myCarouse-<?php echo $module; ?>-<?php echo $category['category_id']; ?>_prev"><span></span></a>

                            <script type="text/javascript">
                                $(document).ready(function () {
                                    var owl11038032_<?php echo $module; ?>_<?php echo $category['category_id']; ?> = $(".filter-product #myCarouse-<?php echo $module; ?>-<?php echo $category['category_id']; ?> .carousel-inner");

                                    $("#myCarouse-<?php echo $module; ?>-<?php echo $category['category_id']; ?>_next").click(function () {
                                        owl11038032_<?php echo $module; ?>_<?php echo $category['category_id']; ?>.trigger('owl.next');
                                        return false;
                                    })
                                    $("#myCarouse-<?php echo $module; ?>-<?php echo $category['category_id']; ?>_prev").click(function () {
                                        owl11038032_<?php echo $module; ?>_<?php echo $category['category_id']; ?>.trigger('owl.prev');
                                        return false;
                                    });

                                    owl11038032_<?php echo $module; ?>_<?php echo $category['category_id']; ?>.owlCarousel({
                                        slideSpeed: 500,
                                        singleItem: true
                                    });
                                });
                            </script>

                            <div class="box-product">
                                <div id="myCarouse-<?php echo $module; ?>-<?php echo $category['category_id']; ?>" class="carousel slide">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner">
                                        <?php if($category['products']){ ?>
                                        <?php foreach(array_chunk($category['products'],6) as $key2 => $products){ ?>
                                        <div class="<?php if($key2 == 0){ ?>active<?php } ?> item">
                                            <div class="product-grid">
                                                <div class="row">
                                                    <?php foreach($products as $product){ ?>
                                                    <div class="col-sm-2 col-xs-6">
                                                        <!-- Product -->
                                                        <div class="product clearfix">
                                                            <div class="left">
                                                                <div class="image">
                                                                    
                                                                    <a href="<?php echo $product['href']; ?>">
                                                                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="right">
                                                                <div class="name"><a
                                                                        href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                                                                <?php if ($product['price']) { ?>
                                                                    <div class="price">
                                                                        <?php if (!$product['special']) { ?>
                                                                            <?php echo $product['price']; ?>
                                                                        <?php } else { ?>
                                                                            <span class="price-new"><?php echo $product['special']; ?></span>
                                                                            <span class="price-old"><?php echo $product['price']; ?></span>
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
                    <?php } ?>
                </div>
            </div>
            <script type="text/javascript">
                $('#tab-md-<?php echo $module; ?> a').click(function (e) {
                    e.preventDefault();
                    $(this).tab('show');
                })
            </script>

            <div class="filter-product visible-xs">
                <div class="filter-tabs">
                    <div class="bg-filter-tabs">
                        <div class="bg-filter-tabs2 clearfix">
                            <ul id="tab-xs-<?php echo $module; ?>">
                                <?php foreach($categories as $key => $category){ ?>
                                <li <?php if($key == 0){ ?>class="active"<?php } ?>><a href="#category-xs-<?php echo $module; ?>-<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></a></li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="tab-content">
                    <?php foreach($categories as $key => $category){ ?>
                    <div class="tab-pane <?php if($key == 0){ ?>active<?php } ?>" id="category-xs-<?php echo $module; ?>-<?php echo $category['category_id']; ?>">
                        <!-- Carousel nav -->
                        <a class="next-button" href="#myCarousel-xs-category-xs-<?php echo $module; ?>-<?php echo $category['category_id']; ?>"
                           id="myCarousel-xs-category-xs-<?php echo $module; ?>-<?php echo $category['category_id']; ?>_next"><span></span></a>
                        <a class="prev-button" href="#myCarousel-xs-category-xs-<?php echo $module; ?>-<?php echo $category['category_id']; ?>"
                           id="myCarousel-xs-category-xs-<?php echo $module; ?>-<?php echo $category['category_id']; ?>_prev"><span></span></a>

                        <script type="text/javascript">
                            $(document).ready(function () {
                                var owl2505789_xs_<?php echo $module; ?>_<?php echo $category['category_id']; ?> = $(".filter-product #myCarousel-xs-category-xs-<?php echo $module; ?>-<?php echo $category['category_id']; ?> .carousel-inner");

                                $("#myCarousel-xs-category-xs-<?php echo $module; ?>-<?php echo $category['category_id']; ?>_next").click(function () {
                                    owl2505789_xs_<?php echo $module; ?>_<?php echo $category['category_id']; ?>.trigger('owl.next');
                                    return false;
                                })
                                $("#myCarousel-xs-category-xs-<?php echo $module; ?>-<?php echo $category['category_id']; ?>_prev").click(function () {
                                    owl2505789_xs_<?php echo $module; ?>_<?php echo $category['category_id']; ?>.trigger('owl.prev');
                                    return false;
                                });

                                owl2505789_xs_<?php echo $module; ?>_<?php echo $category['category_id']; ?>.owlCarousel({
                                    slideSpeed: 500,
                                    singleItem: true
                                });
                            });
                        </script>

                        <div class="box-product">
                            <div id="myCarousel-xs-category-xs-<?php echo $module; ?>-<?php echo $category['category_id']; ?>" class="carousel slide">
                                <!-- Carousel items -->
                                <div class="carousel-inner">
                                    <?php if($category['products']){ ?>
                                    <?php foreach(array_chunk($category['products'],2) as $key2 => $products){ ?>
                                    <div class="<?php if($key2 == 0){ ?>active<?php } ?> item">
                                        <div class="product-grid">
                                            <div class="row">
                                                <?php if($category['products']){ ?>
                                                    <?php foreach($category['products'] as $product){ ?>
                                                        <div class="col-sm-3 col-xs-6">
                                                            <!-- Product -->
                                                            <div class="product clearfix">
                                                                <div class="left">
                                                                    <div class="image">
                                                                        
                                                                        <a href="<?php echo $product['href']; ?>">
                                                                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="right">
                                                                    <div class="name"><a
                                                                            href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                                                                    <?php if ($product['price']) { ?>
                                                                        <div class="price">
                                                                            <?php if (!$product['special']) { ?>
                                                                                <?php echo $product['price']; ?>
                                                                            <?php } else { ?>
                                                                                <span class="price-new"><?php echo $product['special']; ?></span>
                                                                                <span class="price-old"><?php echo $product['price']; ?></span>
                                                                            <?php } ?>
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
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
            <script type="text/javascript">
                $('#tab-xs-<?php echo $module; ?> a').click(function (e) {
                    e.preventDefault();
                    $(this).tab('show');
                })
            </script>
            <?php }elseif(count($categories) == 1){ ?>
            <div class="box with-scroll hidden-xs">
                <?php foreach($categories as $key => $category){ ?>
                <!-- Carousel nav -->
                <a class="next-button" href="#myCarousel10308416_<?php echo $module; ?>_<?php echo $category['category_id']; ?>" id="myCarousel10308416_<?php echo $module; ?>_<?php echo $category['category_id']; ?>_next"><span></span></a>
                <a class="prev-button" href="#myCarousel10308416_<?php echo $module; ?>_<?php echo $category['category_id']; ?>" id="myCarousel10308416_<?php echo $module; ?>_<?php echo $category['category_id']; ?>_prev"><span></span></a>
                <script type="text/javascript">
                    $(document).ready(function () {
                        var owl10308416 = $(".box #myCarousel10308416_<?php echo $module; ?>_<?php echo $category['category_id']; ?> .carousel-inner");

                        $("#myCarousel10308416_<?php echo $module; ?>_<?php echo $category['category_id']; ?>_next").click(function () {
                            owl10308416.trigger('owl.next');
                            return false;
                        })
                        $("#myCarousel10308416_<?php echo $module; ?>_<?php echo $category['category_id']; ?>_prev").click(function () {
                            owl10308416.trigger('owl.prev');
                            return false;
                        });

                        owl10308416.owlCarousel({
                            slideSpeed: 500,
                            singleItem: true
                        });
                    });
                </script>

                <div class="box-heading2"><?php echo $category['name']; ?></div>
                <div class="box-content products ">
                    <div class="box-product">
                        <div id="myCarousel10308416_<?php echo $module; ?>_<?php echo $category['category_id']; ?>" class="carousel slide">
                            <!-- Carousel items -->
                            <div class="carousel-inner">
                                <?php if($category['products']){ ?>
                                    <?php foreach(array_chunk($category['products'],6) as $key2 => $products){ ?>
                                        <div class="<?php if($key2 == 0){ ?>active<?php } ?> item">
                                            <div class="product-grid">
                                                <div class="row">
                                                    <?php foreach($products as $product){ ?>
                                                        <div class="col-sm-2 col-xs-6">
                                                            <!-- Product -->
                                                            <div class="product clearfix">
                                                                <div class="left">
                                                                    <div class="image">
                                                                        <a href="<?php echo $product['href']; ?>">
                                                                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="right">
                                                                    <div class="name"><a
                                                                            href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                                                                    <?php if ($product['price']) { ?>
                                                                        <div class="price">
                                                                            <?php if (!$product['special']) { ?>
                                                                                <?php echo $product['price']; ?>
                                                                            <?php } else { ?>
                                                                                <span class="price-new"><?php echo $product['special']; ?></span>
                                                                                <span class="price-old"><?php echo $product['price']; ?></span>
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
            <?php } ?>
            <?php foreach($categories as $key => $category){ ?>
            <div class="box with-scroll visible-xs">
                <!-- Carousel nav -->
                <a class="next-button" href="#myCarousel1260220_<?php echo $module; ?>_<?php echo $category['category_id']; ?>"
                   id="myCarousel1260220_<?php echo $module; ?>_<?php echo $category['category_id']; ?>_next"><span></span></a>
                <a class="prev-button" href="#myCarousel1260220_<?php echo $module; ?>_<?php echo $category['category_id']; ?>"
                   id="myCarousel1260220_<?php echo $module; ?>_<?php echo $category['category_id']; ?>_prev"><span></span></a>
                <script type="text/javascript">
                    $(document).ready(function () {
                        var owl1260220 = $(".box #myCarousel1260220_<?php echo $module; ?>_<?php echo $category['category_id']; ?> .carousel-inner");

                        $("#myCarousel1260220_<?php echo $module; ?>_<?php echo $category['category_id']; ?>_next").click(function () {
                            owl1260220.trigger('owl.next');
                            return false;
                        })
                        $("#myCarousel1260220_<?php echo $module; ?>_<?php echo $category['category_id']; ?>_prev").click(function () {
                            owl1260220.trigger('owl.prev');
                            return false;
                        });

                        owl1260220.owlCarousel({
                            slideSpeed: 500,
                            singleItem: true
                        });
                    });
                </script>


                <div class="box-heading2"><?php echo $category['name'] ?></div>
                <div class="box-content products ">
                    <div class="box-product">
                        <div id="myCarousel1260220_<?php echo $module; ?>_<?php echo $category['category_id']; ?>" class="carousel slide">
                            <!-- Carousel items -->
                            <div class="carousel-inner">
                                <?php if($category['products']){ ?>
                                    <?php foreach(array_chunk($category['products'],2) as $key2 => $products){ ?>
                                        <div class="<?php if($key2 == 0){ ?>active<?php } ?> item">
                                            <div class="product-grid">
                                                <div class="row">
                                                    <?php if($category['products']){ ?>
                                                        <?php foreach($category['products'] as $product){ ?>
                                                            <div class="col-sm-3 col-xs-6">
                                                                <!-- Product -->
                                                                <div class="product clearfix">
                                                                    <div class="left">
                                                                        <div class="image">
                                                                            
                                                                            <a href="<?php echo $product['href']; ?>">
                                                                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="right">
                                                                        <div class="name"><a
                                                                                href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                                                                        <?php if ($product['price']) { ?>
                                                                            <div class="price">
                                                                                <?php if (!$product['special']) { ?>
                                                                                    <?php echo $product['price']; ?>
                                                                                <?php } else { ?>
                                                                                    <span class="price-new"><?php echo $product['special']; ?></span>
                                                                                    <span class="price-old"><?php echo $product['price']; ?></span>
                                                                                <?php } ?>
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
                                    <?php } ?>
                                <?php } ?>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <?php } ?>
            <?php } ?>
        </div>
    </div>
<?php } ?>
