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

                            <?php if ($categories) { ?>
                                <p><strong><?php echo $text_index; ?></strong>
                                    <?php foreach ($categories as $category) { ?>
                                        &nbsp;&nbsp;&nbsp;<a
                                            href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
                                    <?php } ?>
                                </p>
                                <?php foreach ($categories as $category) { ?>
                                    <div class="manufacturer-list">
                                        <div class="manufacturer-heading"><?php echo $category['name']; ?><a id="<?php echo $category['name']; ?>"></a></div>

                                        <div class="manufacturer-content">
                                        <?php if ($category['manufacturer']) { ?>
                                            <?php foreach ($category['manufacturer'] as $manufacturer) { ?>
                                            <ul>
                                                <li>
                                                    <a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
                                                </li>
                                            </ul>
                                            <?php } ?>
                                        <?php } ?>
                                        </div>
                                    </div>
                                <?php } ?>
                            <?php } else { ?>
                                <p><?php echo $text_empty; ?></p>
                                <div class="buttons clearfix">
                                    <div class="pull-right"><a href="<?php echo $continue; ?>"
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