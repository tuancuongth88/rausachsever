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
                                                    <div class='left-news-img pull-left'>
                                                        <a href="<?php echo $news['href']; ?>"
                                                           title="<?php echo $news['name']; ?>">
                                                            <img class="img-responsive" src="<?php echo $news['thumb']; ?>"
                                                                 title="<?php echo $news['name']; ?>"
                                                                 alt="<?php echo $news['name']; ?>">
                                                        </a>
                                                    </div>
                                                    <div class='right-news-content pull-left'>
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
                        <?php } ?>

                        <?php if (!$newss) { ?>
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