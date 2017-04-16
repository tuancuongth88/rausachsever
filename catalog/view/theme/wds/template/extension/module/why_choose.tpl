<div class="row">
    <div class="col-sm-12">
        <?php if ($banners) { ?>
            <div style="margin-bottom: 20px;">
                <?php foreach ($banners as $key => $banner) {
                    if ($key == 0) {
                        if ($banner['link']) {
                            echo "<a href='" . $banner['link'] . "'><img alt=\"" . $banner['title'] . "\" src=\"" . $banner['image'] . "\" class=\"hidden-xs\"></a>";
                        } else {
                            echo "<img alt=\"" . $banner['title'] . "\" src=\"" . $banner['image'] . "\" class=\"hidden-xs\">";
                        }
                    }
                } ?>
            </div>
        <?php } ?>
        <?php if($descriptions): ?>
        <div style="background:#f8f8f8;overflow: auto; padding: 30px;">
            <?php foreach ($descriptions as $description) { ?>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"
                     style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
                    <?php if($description['icon']){ ?><i class="fa fa-<?php echo $description['icon'] ?>"
                        style="font-size: 30px;margin-right: 20px;color:#000000; vertical-align: middle;"></i><?php } ?><span
                        style="color:#000000; font-family: Roboto Condensed,sans-serif; font-weight: normal;text-transform:uppercase;"><?php echo $description['title'] ?></span>
                </div>
            <?php } ?>
        </div>
        <?php endif; ?>
    </div>
</div>