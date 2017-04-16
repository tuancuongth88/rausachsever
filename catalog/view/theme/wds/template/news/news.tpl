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

                            <div class="news-description">
                                <div class="news-categories">
                                    <div class="news-cat-content">
                                        <div class="border-content">
                                            <div class="row">
                                                <ul class="col-lg-12">

                                                    <div class="post-meta">
                                                        <ul>
                                                            <li><i class="fa fa-calendar"></i> <?php echo $date_added; ?></li>
                                                            <li> | </li>
                                                            <li><i class="fa fa-eye"></i> <?php echo $text_viewed; ?> <?php echo $viewed; ?></li>
                                                        </ul>
                                                        <div class='clearfix'></div>
                                                    </div>

                                                    <div class="content-news-detail">
                                                        <?php echo $description; ?>
                                                        <div class="addthis_sharing_toolbox">
                                                            <!-- AddThis Button BEGIN -->
                                                            <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>">
                                                                <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
                                                                <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a>
                                                                <a class="addthis_counter addthis_pill_style"></a></div>
                                                            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-57dfb410d4f31845"></script>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>

                                                    <?php if($tags) { ?>
                                                        <div class="widget_tags">
                                                            <span>Tags:</span>
                                                            <?php foreach ($tags as $tag) { ?>
                                                                <a href="<?php echo $tag['href']; ?>" title="<?php echo $tag['tag']; ?>"><?php echo $tag['tag']; ?></a>
                                                            <?php } ?>
                                                        </div>
                                                    <?php } ?>

                                                    <?php if($comment_status){ ?>
                                                        <hr>
                                                        <div class="clearfix"></div>
                                                        <div id="comment"></div>
                                                        <div id="comments">
                                                            <div class="article_comments__form">
                                                                <div id="form-comment" class="comment-form" >
                                                                    <h3><?php echo $text_comment; ?></h3>
                                                                    <div class="form-group">
                                                                        <div class="row">
                                                                            <div class="col-lg-6 col-md-6 col-xs-12">
                                                                                <label for="comment-author"><?php echo $entry_name; ?></label>
                                                                                <input class="form-control" type="text" name="author" placeholder="" id="comment-author" value="" />
                                                                            </div>
                                                                            <div class="col-lg-6 col-md-6 col-xs-12">
                                                                                <label for="comment-email"><?php echo $entry_email; ?></label>
                                                                                <input class="form-control" type="email" name="email" placeholder="" id="comment-email" value="" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="comment-body"><?php echo $entry_content; ?></label>
                                                                        <textarea class="form-control" name="content" id="comment-body"></textarea>
                                                                    </div>
                                                                    <label for="comment-author"><?php echo $entry_captcha; ?></label>
                                                                    <?php echo $captcha; ?>
                                                                    <button id="button-comment" type="submit" class="btn btn-primary"><?php echo $button_send; ?></button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <?php } ?>
                                                    <div class="clearfix"></div>

                                                    <?php if($newss){ ?>
                                                        <h2 class="hr-border-title center"><span><?php echo $text_related; ?></span></h2>
                                                        <ul class="news-related">
                                                            <?php foreach ($newss as $news) { ?>
                                                                <li><a href="<?php echo $news['href']; ?>" title="<?php echo $news['name']; ?>"><i class="fa fa-caret-right"></i> <?php echo $news['name']; ?></a></li>
                                                            <?php } ?>
                                                        </ul>
                                                    <?php } ?>
                                                    <div class="clearfix"></div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <?php echo $content_bottom; ?>
                </div>
            </div>
        </div>
    </div>
<?php echo $column_right; ?>

<?php if($comment_status){ ?>
    <script type="text/javascript"><!--
        $('#comment').delegate('.pagination a', 'click', function (e) {
            e.preventDefault();

            $('#comment').fadeOut('slow');

            $('#comment').load(this.href);

            $('#comment').fadeIn('slow');
        });

        $('#comment').load('index.php?route=news/news/comment&news_id=<?php echo $news_id; ?>');

        $('#button-comment').on('click', function () {
            $.ajax({
                url       : 'index.php?route=news/news/write&news_id=<?php echo $news_id; ?>',
                type      : 'post',
                dataType  : 'json',
                data      : {
                    author: $('input[name=\'author\']').val(),
                    email: $('input[name=\'email\']').val(),
                    content: $('textarea[name=\'content\']').val(),
                    captcha: $('input[name=\'captcha\']').val()
                },
                beforeSend: function () {
                    $('#button-comment').button('loading');
                },
                complete  : function () {
                    $('#button-comment').button('reset');
                },
                success   : function (json) {
                    $('.alert-success, .alert-danger').remove();

                    if (json['error']) {
                        $('#form-comment h3').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    }

                    if (json['success']) {
                        $('#form-comment h3').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
                        $('input[name=\'author\']').val('');
                        $('input[name=\'email\']').val('');
                        $('textarea[name=\'content\']').val('');
                        $('input[name=\'captcha\']').val('');
                    }
                }
            });
        });
        //--></script>
    <?php } ?>
<?php echo $footer; ?>