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

                        <div>
                            <div class="product-info">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="row" id="quickview_product">
                                            <script>
                                                $(document).ready(function () {
                                                    $('#image').elevateZoom({
                                                        zoomWindowFadeIn: 500,
                                                        zoomWindowFadeOut: 500,
                                                        zoomWindowOffetx: 20,
                                                        zoomWindowOffety: -1,
                                                        cursor: "pointer",
                                                        lensFadeIn: 500,
                                                        lensFadeOut: 500,
                                                    });

                                                    $('.thumbnails a').click(function () {
                                                        var smallImage = $(this).attr('data-image');
                                                        var largeImage = $(this).attr('data-zoom-image');
                                                        var ez = $('#image').data('elevateZoom');
                                                        $('#ex1').attr('href', largeImage);
                                                        ez.swaptheimage(smallImage, largeImage);
                                                        return false;
                                                    });
                                                });
                                            </script>
                                            <?php if ($thumb || $images) { ?>
                                            <div class="col-sm-4 popup-gallery">
                                                <div class="row">
                                                    <?php if ($thumb) { ?>
                                                    <div class="col-sm-12">
                                                        <div class="product-image cloud-zoom">

                                                            <a href="<?php echo $popup; ?>"
                                                               title="<?php echo $heading_title; ?>" id="ex1"><img
                                                                    src="<?php echo $thumb; ?>"
                                                                    title="<?php echo $heading_title; ?>"
                                                                    alt="<?php echo $heading_title; ?>" id="image"
                                                                    itemprop="image"
                                                                    data-zoom-image="<?php echo $popup; ?>"/></a>
                                                        </div>
                                                    </div>
                                                    <?php } ?>
                                                    <?php if ($images) { ?>
                                                    <div class="col-sm-12">
                                                        <div class="thumbnails clearfix">
                                                            <ul>
                                                                <?php foreach ($images as $image) { ?>
                                                                <li><p><a
                                                                            href="<?php echo $image['popup']; ?>"
                                                                            data-image="<?php echo $image['thumb']; ?>"
                                                                            data-zoom-image="<?php echo $image['popup']; ?>"><img
                                                                                src="<?php echo $image['thumb']; ?>"
                                                                                title="<?php echo $heading_title; ?>"
                                                                                alt="<?php echo $heading_title; ?>"/></a></p></li>
                                                                <?php } ?>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                            <?php } ?>

                                            <div class="col-sm-8 product-center clearfix">
                                                <div>
                                                    <div class="description">
                                                        <?php if ($manufacturer) { ?>
                                                        <span><?php echo $text_manufacturer; ?></span> <a
                                                            href="<?php echo $manufacturers; ?>"
                                                            itemprop="brand"><?php echo $manufacturer; ?></a><br/>
                                                        <?php } ?>
                                                        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br/>
                                                        <?php if ($reward) { ?>
                                                        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br/>
                                                        <?php } ?>
                                                        <span><?php echo $text_stock; ?></span> <?php echo $stock; ?>
                                                    </div>
                                                    <?php if ($price) { ?>
                                                    <div class="price">
                                                                <span class="price-new">
                                                                    <?php if (!$special) { ?>
                                                                    <span><?php echo $price; ?></span>
                                                                        <?php } else { ?>
                                                                            <span style="text-decoration: line-through;"><?php echo $price; ?></span>
                                                                        <span><?php echo $special; ?></span>
                                                                        <?php } ?>
                                                                </span>
                                                        <br/>
                                                        <?php if ($tax) { ?>
                                                        <span class="price-tax"><?php echo $text_tax; ?><?php echo $tax; ?></span>
                                                            <br>
                                                        <?php } ?>
                                                        <?php if ($points) { ?>
                                                            <span><?php //echo $text_points; ?><?php //echo $points; ?></span>
                                                        <?php } ?>
                                                        <?php if ($discounts) { ?>
                                                            <?php foreach ($discounts as $discount) { ?>
                                                                <span><?php //echo $discount['quantity']; ?><?php //echo $text_discount; ?><?php //echo $discount['price']; ?></span>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    </div>
                                                    <?php } ?>
                                                </div>

                                                <div class="cart" id="product">
                                                    <?php if ($options) { ?>
                                                        <hr>
                                                        <h3><?php echo $text_option; ?></h3>
                                                        <?php foreach ($options as $option) { ?>
                                                            <?php if ($option['type'] == 'select') { ?>
                                                                <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label"
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                                                    <select name="option[<?php echo $option['product_option_id']; ?>]"
                                                                            id="input-option<?php echo $option['product_option_id']; ?>"
                                                                            class="form-control">
                                                                        <option value=""><?php echo $text_select; ?></option>
                                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                            <option
                                                                                value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                                                <?php if ($option_value['price']) { ?>
                                                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                                <?php } ?>
                                                                            </option>
                                                                        <?php } ?>
                                                                    </select>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'radio') { ?>
                                                                <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label"><?php echo $option['name']; ?></label>
                                                                    <div id="input-option<?php echo $option['product_option_id']; ?>">
                                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                            <div class="radio">
                                                                                <label>
                                                                                    <input type="radio"
                                                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                                    <?php if ($option_value['image']) { ?>
                                                                                        <img src="<?php echo $option_value['image']; ?>"
                                                                                             alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                                                             class="img-thumbnail"/>
                                                                                    <?php } ?>
                                                                                    <?php echo $option_value['name']; ?>
                                                                                    <?php if ($option_value['price']) { ?>
                                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                                    <?php } ?>
                                                                                </label>
                                                                            </div>
                                                                        <?php } ?>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'checkbox') { ?>
                                                                <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label"><?php echo $option['name']; ?></label>
                                                                    <div id="input-option<?php echo $option['product_option_id']; ?>">
                                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                            <div class="checkbox">
                                                                                <label>
                                                                                    <input type="checkbox"
                                                                                           name="option[<?php echo $option['product_option_id']; ?>][]"
                                                                                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                                    <?php if ($option_value['image']) { ?>
                                                                                        <img src="<?php echo $option_value['image']; ?>"
                                                                                             alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                                                             class="img-thumbnail"/>
                                                                                    <?php } ?>
                                                                                    <?php echo $option_value['name']; ?>
                                                                                    <?php if ($option_value['price']) { ?>
                                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                                    <?php } ?>
                                                                                </label>
                                                                            </div>
                                                                        <?php } ?>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'text') { ?>
                                                                <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label"
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                                                           value="<?php echo $option['value']; ?>"
                                                                           placeholder="<?php echo $option['name']; ?>"
                                                                           id="input-option<?php echo $option['product_option_id']; ?>"
                                                                           class="form-control"/>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'textarea') { ?>
                                                                <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label"
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                        <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5"
                                                  placeholder="<?php echo $option['name']; ?>"
                                                  id="input-option<?php echo $option['product_option_id']; ?>"
                                                  class="form-control"><?php echo $option['value']; ?></textarea>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'file') { ?>
                                                                <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label"><?php echo $option['name']; ?></label>
                                                                    <button type="button"
                                                                            id="button-upload<?php echo $option['product_option_id']; ?>"
                                                                            data-loading-text="<?php echo $text_loading; ?>"
                                                                            class="btn btn-default btn-block"><i
                                                                            class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                                                    <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]"
                                                                           value="" id="input-option<?php echo $option['product_option_id']; ?>"/>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'date') { ?>
                                                                <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label"
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                                                    <div class="input-group date">
                                                                        <input type="text"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD"
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                                                               class="form-control"/>
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'datetime') { ?>
                                                                <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label"
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                                                    <div class="input-group datetime">
                                                                        <input type="text"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value="<?php echo $option['value']; ?>"
                                                                               data-date-format="YYYY-MM-DD HH:mm"
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                                                               class="form-control"/>
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'time') { ?>
                                                                <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label"
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                                                    <div class="input-group time">
                                                                        <input type="text"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value="<?php echo $option['value']; ?>" data-date-format="HH:mm"
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                                                               class="form-control"/>
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                                                </div>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    <?php } ?>
                                                    <?php if ($recurrings) { ?>
                                                        <hr>
                                                        <h3><?php echo $text_payment_recurring; ?></h3>
                                                        <div class="form-group required">
                                                            <select name="recurring_id" class="form-control">
                                                                <option value=""><?php echo $text_select; ?></option>
                                                                <?php foreach ($recurrings as $recurring) { ?>
                                                                    <option
                                                                        value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                                                                <?php } ?>
                                                            </select>
                                                            <div class="help-block" id="recurring-description"></div>
                                                        </div>
                                                    <?php } ?>
                                                    <div class="form-group add-to-cart">
                                                        <p><?php echo $entry_qty; ?></p>
                                                        <div class="quantity">
                                                            <input type="text" name="quantity"
                                                                   id="quantity_wanted" size="2" value="<?php echo $minimum; ?>"/>
                                                            <a href="#" id="q_up"><i class="fa fa-plus"></i></a>
                                                            <a href="#" id="q_down"><i
                                                                    class="fa fa-minus"></i></a>
                                                        </div>
                                                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                                                    </div>
                                                    <div class="cart-holder add-to-cart">
                                                        <input type="button" value="<?php echo $button_cart; ?>"
                                                               id="button-cart" rel="<?php echo $product_id; ?>"
                                                               class="button"/>

                                                    </div>

                                                    <div class="compare-holder">
                                                        <a onclick="compare.add('<?php echo $product_id; ?>');"
                                                           title="<?php echo $button_compare; ?>"
                                                           class="fa  fa-external-link product-icon"></a></a>
                                                    </div>

                                                    <div class="wishlist-holder">
                                                        <a onclick="wishlist.add('<?php echo $product_id; ?>');"
                                                           title="<?php echo $button_wishlist; ?>"
                                                           class="fa fa-heart-o product-icon"></a></a>
                                                    </div>
                                                    <div class='clearfix'></div>
                                                    <br>
                                                    <?php if ($minimum > 1) { ?>
                                                        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
                                                        </div>
                                                    <?php } ?>
                                                </div>
                                                <?php if ($review_status) { ?>
                                                <div class="review">
                                                    <div class="rating">
                                                        <p>
                                                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                                <?php if ($rating < $i) { ?>
                                                                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                                                <?php } else { ?>
                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                                                                            class="fa fa-star-o fa-stack-1x"></i></span>
                                                                <?php } ?>
                                                            <?php } ?>
                                                            <a href=""
                                                               onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a>
                                                            / <a href=""
                                                                 onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
                                                        </p>
                                                        <hr>
                                                        <!-- AddThis Button BEGIN -->
                                                        <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a
                                                                class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a
                                                                class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a
                                                                class="addthis_counter addthis_pill_style"></a></div>
                                                        <script type="text/javascript"
                                                                src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                                                        <!-- AddThis Button END -->
                                                    </div>
                                                </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div id="tabs" class="htabs">
                                <a href="#tab-description"><?php echo $tab_description; ?></a>
                                <?php if ($attribute_groups) { ?>
                                    <a href="#tab-specification" ><?php echo $tab_attribute; ?></a>
                                <?php } ?>
                                <?php if ($review_status) { ?>
                                    <a href="#tab-review"><?php echo $tab_review; ?></a>
                                <?php } ?>
                            </div>
                            <div id="tab-description" class="tab-content" itemprop="description">
                                <div style="display: block;" id="tab-description" class="tab-content"
                                     itemprop="description">
                                    <?php echo $description; ?>
                                </div>
                            </div>
                            <?php if ($attribute_groups) { ?>
                            <div class="tab-pane" id="tab-specification">
                                <table class="table table-bordered">
                                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                                        <thead>
                                        <tr>
                                            <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong>
                                            </td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                            <tr>
                                                <td><?php echo $attribute['name']; ?></td>
                                                <td><?php echo $attribute['text']; ?></td>
                                            </tr>
                                        <?php } ?>
                                        </tbody>
                                    <?php } ?>
                                </table>
                            </div>
                            <?php } ?>
                            <?php if ($review_status) { ?>
                            <div class="tab-pane" id="tab-review">
                                <form class="form-horizontal" id="form-review">
                                    <div id="review"></div>
                                    <h2><?php echo $text_write; ?></h2>
                                    <?php if ($review_guest) { ?>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label"
                                                       for="input-name"><?php echo $entry_name; ?></label>
                                                <input type="text" name="name" value="<?php echo $customer_name; ?>"
                                                       id="input-name" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label"
                                                       for="input-review"><?php echo $entry_review; ?></label>
                                                <textarea name="text" rows="5" id="input-review"
                                                          class="form-control"></textarea>
                                                <div class="help-block"><?php echo $text_note; ?></div>
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label"><?php echo $entry_rating; ?></label>
                                                &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                                <input type="radio" name="rating" value="1"/>
                                                &nbsp;
                                                <input type="radio" name="rating" value="2"/>
                                                &nbsp;
                                                <input type="radio" name="rating" value="3"/>
                                                &nbsp;
                                                <input type="radio" name="rating" value="4"/>
                                                &nbsp;
                                                <input type="radio" name="rating" value="5"/>
                                                &nbsp;<?php echo $entry_good; ?></div>
                                        </div>
                                        <?php echo $captcha; ?>
                                        <div class="buttons clearfix">
                                            <div class="pull-right">
                                                <button type="button" id="button-review"
                                                        data-loading-text="<?php echo $text_loading; ?>"
                                                        class="button"><?php echo $button_continue; ?></button>
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <?php echo $text_login; ?>
                                    <?php } ?>
                                </form>
                            </div>
                            <?php } ?>
                            <?php if ($products) { ?>
                            <div class="box">
                                <!-- Carousel nav -->
                                <div class="box-heading2"><?php echo $text_related; ?></div>
                                <div class="box-content products related-products hidden-xs">
                                    <div class="box-product">
                                        <div id="myCarousel4469334" class="carousel slide">
                                            <!-- Carousel items -->
                                            <div class="carousel-inner">
                                                <div class="active item">
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- For Mobiles view -->
                                <div class="box-content products related-products visible-xs">
                                    <div class="box-product">
                                        <div id="myCarousel4469334" class="carousel slide">
                                            <!-- Carousel items -->
                                            <div class="carousel-inner">
                                                <div class="active item">
                                                    <div class="product-grid">
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
                                                                            <?php if ($product['rating']) { ?>
                                                                                <div class="rating">
                                                                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                                                        <?php if ($product['rating'] < $i) { ?>
                                                                                            <span class="fa fa-stack"><i
                                                                                                    class="fa fa-star-o"></i></span>
                                                                                        <?php } else { ?>
                                                                                            <span class="fa fa-stack"><i class="fa fa-star"></i><i
                                                                                                    class="fa fa-star-o"></i></span>
                                                                                        <?php } ?>
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                        </div>

                        <script type="text/javascript">
                            $(document).ready(function () {
                                var owl4469334 = $(".box #myCarousel4469334 .carousel-inner");

                                $("#myCarousel4469334_next").click(function () {
                                    owl4469334.trigger('owl.next');
                                    return false;
                                })
                                $("#myCarousel4469334_prev").click(function () {
                                    owl4469334.trigger('owl.prev');
                                    return false;
                                });

                                owl4469334.owlCarousel({
                                    slideSpeed: 500,
                                    singleItem: true
                                });
                            });
                        </script>
                        <script type="text/javascript"><!--
                            $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
                                $.ajax({
                                    url: 'index.php?route=product/product/getRecurringDescription',
                                    type: 'post',
                                    data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
                                    dataType: 'json',
                                    beforeSend: function () {
                                        $('#recurring-description').html('');
                                    },
                                    success: function (json) {
                                        $('.alert, .text-danger').remove();

                                        if (json['success']) {
                                            $('#recurring-description').html(json['success']);
                                        }
                                    }
                                });
                            });
                            //--></script>
                        <script type="text/javascript"><!--
                            $('#button-cart').on('click', function () {
                                $.ajax({
                                    url: 'index.php?route=checkout/cart/add',
                                    type: 'post',
                                    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
                                    dataType: 'json',
                                    beforeSend: function() {
                                        $('#button-cart').button('loading');
                                    },
                                    complete: function() {
                                        $('#button-cart').button('reset');
                                    },
                                    success: function(json) {
                                        $('.alert, .text-danger').remove();
                                        $('.form-group').removeClass('has-error');

                                        if (json['error']) {
                                            if (json['error']['option']) {
                                                for (i in json['error']['option']) {
                                                    var element = $('#input-option' + i.replace('_', '-'));

                                                    if (element.parent().hasClass('input-group')) {
                                                        element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                                    } else {
                                                        element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                                    }
                                                }
                                            }

                                            if (json['error']['recurring']) {
                                                $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                                            }

                                            // Highlight any found errors
                                            $('.text-danger').parent().addClass('has-error');
                                        }

                                        if (json['success']) {
                                            $("#cart-total").empty();
                                            console.log(json['total']);
                                            $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                                            // $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                                            
                                            $("#cart-total").append(json['total'] );
                                            $('html, body').animate({ scrollTop: 0 }, 'slow');

                                            $('#cart > ul').load('index.php?route=common/cart/info ul li');
                                        }
                                    },
                                    error: function(xhr, ajaxOptions, thrownError) {
                                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                    }
                                });
                            });//--></script>
                        <script type="text/javascript"><!--
                            $('.date').datetimepicker({
                                pickTime: false
                            });

                            $('.datetime').datetimepicker({
                                pickDate: true,
                                pickTime: true
                            });

                            $('.time').datetimepicker({
                                pickDate: false
                            });

                            $('button[id^=\'button-upload\']').on('click', function () {
                                var node = this;

                                $('#form-upload').remove();

                                $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

                                $('#form-upload input[name=\'file\']').trigger('click');

                                $('#form-upload input[name=\'file\']').on('change', function () {
                                    $.ajax({
                                        url: 'index.php?route=tool/upload',
                                        type: 'post',
                                        dataType: 'json',
                                        data: new FormData($(this).parent()[0]),
                                        cache: false,
                                        contentType: false,
                                        processData: false,
                                        beforeSend: function () {
                                            $(node).button('loading');
                                        },
                                        complete: function () {
                                            $(node).button('reset');
                                        },
                                        success: function (json) {
                                            $('.text-danger').remove();

                                            if (json['error']) {
                                                $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                                            }

                                            if (json['success']) {
                                                alert(json['success']);

                                                $(node).parent().find('input').attr('value', json['code']);
                                            }
                                        },
                                        error: function (xhr, ajaxOptions, thrownError) {
                                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                        }
                                    });
                                });
                            });
                            //--></script>
                        <script type="text/javascript">
                            $('#review').delegate('.pagination a', 'click', function (e) {
                                e.preventDefault();

                                $('#review').fadeOut('slow');

                                $('#review').load(this.href);

                                $('#review').fadeIn('slow');
                            });

                            $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

                            $('#button-review').on('click', function () {
                                $.ajax({
                                    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
                                    type: 'post',
                                    dataType: 'json',
                                    data: $("#form-review").serialize(),
                                    beforeSend: function () {
                                        $('#button-review').button('loading');
                                    },
                                    complete: function () {
                                        $('#button-review').button('reset');
                                    },
                                    success: function (json) {
                                        $('.alert-success, .alert-danger').remove();

                                        if (json['error']) {
                                            $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                                        }

                                        if (json['success']) {
                                            $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                                            $('input[name=\'name\']').val('');
                                            $('textarea[name=\'text\']').val('');
                                            $('input[name=\'rating\']:checked').prop('checked', false);
                                        }
                                    }
                                });
                            });
                        </script>

                        <script type="text/javascript"><!--
                            $(document).ready(function () {
                                $('.popup-gallery').magnificPopup({
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
                            //--></script>

                        <script type="text/javascript">
                            $.fn.tabs = function () {
                                var selector = this;

                                this.each(function () {
                                    var obj = $(this);

                                    $(obj.attr('href')).hide();

                                    $(obj).click(function () {
                                        $(selector).removeClass('selected');

                                        $(selector).each(function (i, element) {
                                            $($(element).attr('href')).hide();
                                        });

                                        $(this).addClass('selected');

                                        $($(this).attr('href')).show();

                                        return false;
                                    });
                                });

                                $(this).show();

                                $(this).first().click();
                            };
                        </script>

                        <script type="text/javascript"><!--
                            $('#tabs a').tabs();
                            //--></script>

                        <script type="text/javascript"
                                src="catalog/view/theme/wds/js/jquery.elevateZoom-3.0.3.min.js"></script>

                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </div>
        </div>
    </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
