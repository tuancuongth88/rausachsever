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
                            <?php if ($description) { ?>
                                <div class="category-info clearfix">
                                    <?php echo $description; ?>
                                </div>
                            <?php } ?>
                            <div id="main">
                                <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12 col-md-6">
                                        <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
                                    </div>
                                    <div class="col-sm-6 col-xs-12 col-md-6">
                                        <select name="category_id" class="form-control">
                                            <option value="0"><?php echo $text_category; ?></option>
                                            <?php foreach ($categories as $category_1) { ?>
                                                <?php if($category_1['category_id'] == $category_id) { ?>
                                                    <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                                                <?php } else { ?>
                                                    <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                                                <?php } ?>
                                                <?php foreach ($category_1['children'] as $category_2) { ?>
                                                    <?php if($category_2['category_id'] == $category_id) { ?>
                                                        <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                                    <?php } else { ?>
                                                        <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                                    <?php } ?>
                                                    <?php foreach ($category_2['children'] as $category_3) { ?>
                                                        <?php if($category_3['category_id'] == $category_id) { ?>
                                                            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                                        <?php } else { ?>
                                                            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                                        <?php } ?>
                                                    <?php } ?>
                                                <?php } ?>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                <p>
                                    <label class="checkbox-inline">
                                        <?php if($sub_category) { ?>
                                            <input type="checkbox" name="sub_category" value="1" checked="checked" />
                                        <?php } else { ?>
                                            <input type="checkbox" name="sub_category" value="1" />
                                        <?php } ?>
                                        <?php echo $text_sub_category; ?>
                                    </label><br>
                                    <label class="checkbox-inline">
                                        <?php if($description) { ?>
                                            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
                                        <?php } else { ?>
                                            <input type="checkbox" name="description" value="1" id="description" />
                                        <?php } ?>
                                        <?php echo $entry_description; ?>
                                    </label>
                                </p>
                                <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" /><br><br>
                                <h3><?php echo $text_search; ?></h3>
                            </div>
                            <?php if ($newss) { ?>
                                <div class="news-categories">
                                    <div class="news-cat-content">
                                        <div class="border-content">
                                            <div class="row">
                                                <?php foreach ($newss as $news) { ?>
                                                    <div class="col-lg-12"
                                                         style="border-bottom: 1px solid #EDEDED;padding-bottom: 5px;">
                                                        <h4 class='title-news-item'><a href="<?php echo $news['href']; ?>"
                                                                                       title="<?php echo $news['name']; ?>"><?php echo $news['name']; ?></a>
                                                        </h4>
                                                        <div class="row">
                                                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                                                <div>
                                                                    <a href="<?php echo $news['href']; ?>"
                                                                       title="<?php echo $news['name']; ?>">
                                                                        <img class="img-responsive" src="<?php echo $news['thumb']; ?>"
                                                                             title="<?php echo $news['name']; ?>"
                                                                             alt="<?php echo $news['name']; ?>">
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                                                <div class='right-news-content'>
                                                                    <div class="post-meta">
                                                                        <ul>
                                                                            <li>
                                                                                <i class="fa fa-calendar"></i> <?php echo $news['date_added']; ?>
                                                                            </li>
                                                                            <li> |</li>
                                                                            <li>
                                                                                <i class="fa fa-eye"></i> <?php echo $text_viewed; ?> <?php echo $news['viewed']; ?>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <p><?php echo $news['description']; ?></p>
                                                                    <a class="btn btn-custom pull-right"
                                                                       href="<?php echo $news['href']; ?>"><?php echo $button_detail; ?></a>
                                                                    <div class="clearfix"></div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class='clearfix'></div>
                                    <div class="row pagination-results">
                                        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                                        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                                    </div>
                                    <div class='clearfix'></div>
                                </div>
                            <?php } else { ?>
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
    <script type="text/javascript">
        $('#button-search').bind('click', function () {

            url = '<?php echo $url_news_search; ?>';

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
</script>
<?php echo $footer; ?>