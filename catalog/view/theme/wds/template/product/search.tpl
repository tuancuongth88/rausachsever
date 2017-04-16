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
                            <h2><?php echo $heading_title; ?></h2>
                            <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
                            <div class="row">
                                <div class="col-sm-4">
                                    <input type="text" name="search" value="<?php echo $search; ?>"
                                           placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control"/>
                                </div>
                                <div class="col-sm-3">
                                    <select name="category_id" class="form-control">
                                        <option value="0"><?php echo $text_category; ?></option>
                                        <?php foreach ($categories as $category_1) { ?>
                                            <?php if ($category_1['category_id'] == $category_id) { ?>
                                                <option value="<?php echo $category_1['category_id']; ?>"
                                                        selected="selected"><?php echo $category_1['name']; ?></option>
                                            <?php } else { ?>
                                                <option
                                                    value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                                            <?php } ?>
                                            <?php foreach ($category_1['children'] as $category_2) { ?>
                                                <?php if ($category_2['category_id'] == $category_id) { ?>
                                                    <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                                <?php } else { ?>
                                                    <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                                <?php } ?>
                                                <?php foreach ($category_2['children'] as $category_3) { ?>
                                                    <?php if ($category_3['category_id'] == $category_id) { ?>
                                                        <option value="<?php echo $category_3['category_id']; ?>" selected="selected">
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                                    <?php } else { ?>
                                                        <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                                    <?php } ?>
                                                <?php } ?>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <label class="checkbox-inline">
                                        <?php if ($sub_category) { ?>
                                            <input type="checkbox" name="sub_category" value="1" checked="checked"/>
                                        <?php } else { ?>
                                            <input type="checkbox" name="sub_category" value="1"/>
                                        <?php } ?>
                                        <?php echo $text_sub_category; ?></label>
                                </div>
                            </div>
                            <p>
                                <label class="checkbox-inline">
                                    <?php if ($description) { ?>
                                        <input type="checkbox" name="description" value="1" id="description" checked="checked"/>
                                    <?php } else { ?>
                                        <input type="checkbox" name="description" value="1" id="description"/>
                                    <?php } ?>
                                    <?php echo $entry_description; ?></label>
                            </p>
                            <input style="margin-bottom: 20px;" type="button" value="<?php echo $button_search; ?>" id="button-search" class="button"/>
                            <br>
                            <h2><?php echo $text_search; ?></h2>
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
                            <?php } else { ?>
                                <div class="content"><?php echo $text_empty; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <?php echo $content_bottom; ?>
                </div>
            </div>
        </div>
    </div>
<?php echo $column_right; ?>
<script type="text/javascript"><!--
    $('#button-search').bind('click', function () {
        url = 'index.php?route=product/search';

        var search = $('.main-content input[name=\'search\']').prop('value');

        if (search) {
            url += '&search=' + encodeURIComponent(search);
        }

        var category_id = $('.main-content select[name=\'category_id\']').prop('value');

        if (category_id > 0) {
            url += '&category_id=' + encodeURIComponent(category_id);
        }

        var sub_category = $('.main-content input[name=\'sub_category\']:checked').prop('value');

        if (sub_category) {
            url += '&sub_category=true';
        }

        var filter_description = $('.main-content input[name=\'description\']:checked').prop('value');

        if (filter_description) {
            url += '&description=true';
        }

        location = url;
    });

    $('.main-content input[name=\'search\']').bind('keydown', function (e) {
        if (e.keyCode == 13) {
            $('#button-search').trigger('click');
        }
    });

    $('select[name=\'category_id\']').on('change', function () {
        if (this.value == '0') {
            $('input[name=\'sub_category\']').prop('disabled', true);
        } else {
            $('input[name=\'sub_category\']').prop('disabled', false);
        }
    });

    $('select[name=\'category_id\']').trigger('change');
    --></script>
<?php echo $footer; ?>