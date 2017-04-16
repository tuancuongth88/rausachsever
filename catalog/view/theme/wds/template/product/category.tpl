<?php echo $header; ?>

<!-- BREADCRUMB ================================================== -->
<div class="breadcrumb">
    <div class="container">
        <div class="clearfix">
            <ul>
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>
<!-- MAIN CONTENT ================================================== -->
<div class="main-content full-width home">
    <div class="container">
        <div class="row">
            <div class="col-sm-3" id="column_left">
                <?php echo $column_left; ?>
            </div>
            <div class="col-sm-9">
                <?php echo $content_top; ?>
                <div class="row">
                    <div class="col-sm-12 center-column">
                        <h2 id="title-page"><?php echo $heading_title; ?></h2>
                        <?php if ($thumb || $description) { ?>
                        <div class="category-info clearfix">
                            <?php if ($thumb) { ?>
                            <div class="image"><img
                                    src="<?php echo $thumb; ?>"
                                    alt="<?php echo $heading_title; ?>"/></div>
                            <?php } ?>
                            <?php if ($description) { ?>
                                <p><?php echo $description; ?></p>
                            <?php } ?>
                        </div>
                        <?php } ?>

                        <?php if ($categories) { ?>
                        <h2 class="refine_search"><?php echo $text_refine; ?></h2>
                        <div class="category-list">
                            <div class="row">
                                <?php foreach ($categories as $category) { ?>
                                <div class="col-sm-3 hidden-xs">
                                    <a href="<?php echo $category['href']; ?>"><img
                                            src="<?php echo $category['image']; ?>"
                                            alt="<?php echo $category['name']; ?>"/></a>
                                    <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                                </div>

                                <div class="col-xs-6 visible-xs">
                                    <a href="<?php echo $category['href']; ?>"><img
                                            src="<?php echo $category['image']; ?>"
                                            alt="<?php echo $category['name']; ?>"/></a>
                                    <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>

                        <?php if ($products) { ?>
                        <!-- Filter -->
                        <div class="product-filter clearfix">
                            <div class="options">
                                <div class="product-compare"><a href="<?php echo $compare; ?>"
                                                                id="compare-total"><?php echo $text_compare; ?></a></div>

                                <div class="button-group display" data-toggle="buttons-radio">
                                    <button id="list" rel="tooltip" title="<?php echo $button_list; ?>" onclick="display('list');"><i
                                            class="fa fa-th-list"></i></button>
                                    <button id="grid" class="active" rel="tooltip" title="<?php echo $button_grid; ?>"
                                            onclick="display('grid');"><i class="fa fa-th"></i></button>

                                </div>
                            </div>

                            <div class="list-options">
                                <div class="sort">
                                    <?php echo $text_sort; ?> <select onchange="location = this.value;">
                                        <?php foreach ($sorts as $sorts) { ?>
                                            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                                <option value="<?php echo $sorts['href']; ?>"
                                                        selected="selected"><?php echo $sorts['text']; ?></option>
                                            <?php } else { ?>
                                                <option
                                                    value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>

                                <div class="limit">
                                    <?php echo $text_limit; ?> <select onchange="location = this.value;">
                                        <?php foreach ($limits as $limits) { ?>
                                            <?php if ($limits['value'] == $limit) { ?>
                                                <option value="<?php echo $limits['href']; ?>"
                                                        selected="selected"><?php echo $limits['text']; ?></option>
                                            <?php } else { ?>
                                                <option
                                                    value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <!-- Products list -->
                        <div class="product-list" style="display:none;">

                            <?php foreach ($products as $product) { ?>
                            <!-- Product -->
                            <div>
                                <div class="row">
                                    <div class="image col-sm-3"><a href="<?php echo $product['href']; ?>"><img
                                                src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"
                                                title="<?php echo $product['name']; ?>" class="img-responsive"/></a>
                                    </div>
                                    <div class="name-desc col-sm-6">
                                        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        </div>
                                        <div class="description">
                                            <?php echo $product['description']; ?>
                                        </div>

                                        <div class="rating-reviews clearfix">
                                            <div class="rating">
                                                <?php if ($product['rating']) { ?>
                                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                        <?php if ($product['rating'] < $i) { ?>
                                                            <i class="fa fa-star-o"></i>
                                                        <?php } else { ?>
                                                            <i class="fa fa-star"></i>
                                                        <?php } ?>
                                                    <?php } ?>
                                                <?php }else{ ?>
                                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                        <i class="fa fa-star"></i>
                                                    <?php } ?>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="actions col-sm-3">
                                        <div>
                                                <?php if ($product['price']) { ?>
                                                    <div class="price">
                                                        <?php if (!$product['special']) { ?>
                                                            <?php echo $product['price']; ?>
                                                        <?php } else { ?>
                                                            <span class="price-new"><?php echo $product['special']; ?></span>
                                                            <span class="price-old"><?php echo $product['price']; ?></span>
                                                        <?php } ?>
                                                        <?php if ($product['tax']) { ?>
                                                            <span
                                                                class="price-tax"><?php echo $text_tax; ?><?php echo $product['tax']; ?></span>
                                                        <?php } ?>
                                                    </div>
                                                <?php } ?>
                                            <div class="flybar">
                                                <div class="compare">
                                                    <a onclick="compare.add('<?php echo $product['product_id']; ?>');" title="<?php echo $button_compare; ?>"
                                                       class="fa  fa-external-link product-icon"></a></a>
                                                </div>

                                                <div class="wishlist">
                                                    <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" title="<?php echo $button_wishlist; ?>"
                                                       class="fa fa-heart-o product-icon"></a></a>
                                                </div>

                                            </div>
                                            <div class="add-to-cart"><a onclick="cart.add('<?php echo $product['product_id']; ?>','<?php echo $product['minimum']; ?>');"
                                                                        class="button"><span><?php echo $button_cart; ?></span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                        </div>
                        <!-- Products grid -->
                        <!-- For Desktops view -->
                        <div class="hidden-xs">
                            <div class="product-grid">
                                <div class="row">
                                    <?php foreach ($products as $product) { ?>
                                    <div class="col-sm-3">
                                        <!-- Product -->
                                        <div class="product clearfix">
                                            <div class="left">
                                                <div class="image">
                                                   
                                                    <a href="<?php echo $product['href']; ?>">
                                                        <img src="<?php echo $product['thumb']; ?>"
                                                             alt="<?php echo $product['name']; ?>"/>
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
                                                        <?php if ($product['tax']) { ?>
                                                            <span
                                                                class="price-tax"><?php echo $text_tax; ?><?php echo $product['tax']; ?></span>
                                                        <?php } ?>
                                                    </div>
                                                <?php } ?>
                                                <div class="rating">
                                                    <?php if ($product['rating']) { ?>
                                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                            <?php if ($product['rating'] < $i) { ?>
                                                                <i class="fa fa-star-o"></i>
                                                            <?php } else { ?>
                                                                <i class="fa fa-star"></i>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    <?php }else{ ?>
                                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                            <i class="fa fa-star"></i>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <!-- For Mobiles view -->
                        <div class="visible-xs">
                            <div class="product-grid ">
                                <div class="row">
                                    <?php foreach ($products as $product) { ?>
                                    <div class="col-xs-6">
                                        <!-- Product -->
                                        <div class="product clearfix">
                                            <div class="left">
                                                <div class="image">
                                                    
                                                    <a href="<?php echo $product['href']; ?>">
                                                        <img src="<?php echo $product['thumb']; ?>"
                                                             alt="<?php echo $product['name']; ?>"/>
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
                                                        <?php if ($product['tax']) { ?>
                                                            <span
                                                                class="price-tax"><?php echo $text_tax; ?><?php echo $product['tax']; ?></span>
                                                        <?php } ?>
                                                    </div>
                                                <?php } ?>
                                                <div class="rating">
                                                    <?php if ($product['rating']) { ?>
                                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                            <?php if ($product['rating'] < $i) { ?>
                                                                <i class="fa fa-star-o"></i>
                                                            <?php } else { ?>
                                                                <i class="fa fa-star"></i>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    <?php }else{ ?>
                                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                            <i class="fa fa-star"></i>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="row pagination-results">
                            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                        </div>
                        <script type="text/javascript"><!--
                            function display(view) {

                                if (view == 'list') {
                                    $('.product-grid').css("display", "none");
                                    $('.product-list').css("display", "block");

                                    $('.display').html('<button class="active" id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="fa fa-th-list"></i></button> <button id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="fa fa-th"></i></button> ');

                                    $.cookie('display', 'list');
                                } else {

                                    $('.product-grid').css("display", "block");
                                    $('.product-list').css("display", "none");

                                    $('.display').html('<button id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="fa fa-th-list"></i></button> <button class="active" id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="fa fa-th"></i></button>');

                                    $.cookie('display', 'grid');
                                }
                            }

                            view = $.cookie('display');

                            if (view) {
                                display(view);
                            }
                            //--></script>
                        <?php } ?>
                        <?php if (!$categories && !$products) { ?>
                            <div class="content"><?php echo $text_empty; ?></div>
                            <div class="buttons">
                                <div class="right"><a href="<?php echo $continue; ?>"
                                                           class="button"><?php echo $button_continue; ?></a></div>
                            </div>
                        <?php } ?>

                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
        </div>
    </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>