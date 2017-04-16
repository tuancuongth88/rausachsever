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
            <?php echo $content_top; ?>
            <div class="row">
                <div class="col-sm-12 center-column">
                    <h2 id="title-page"><?php echo $heading_title; ?></h2>

                    <p><?php echo $text_message; ?></p>
                    <div class="buttons clearfix">
                        <div><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
                    </div>

                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
    </div>
<?php echo $column_right; ?>
<?php echo $footer; ?>