<?php echo $header; ?>
    <div class="main-content full-width home">
        <div class="container">
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-sm-3" id="header_left">
                    <?php echo $column_left; ?>
                </div>
                <div class="col-sm-9">
                    <div class="row">
                        <div class="col-sm-8 tg-padding">
                            <?php echo $content_top; ?>
                        </div>
                        <div class="col-sm-4" id="header_right">
                            <?php echo $column_right; ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
    </div>
<?php echo $footer; ?>