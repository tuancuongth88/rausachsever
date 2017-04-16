<?php foreach ($banners as $banner) { ?>
<div class='effect-apollo' style="margin-bottom: 16px;">
    <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>"
                                                      alt="<?php echo $banner['title']; ?>"
                                                      class="img-responsive hidden-xs"/></a>
    <?php } else { ?>
        <a><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"
             class="img-responsive hidden-xs"/></a>
    <?php } ?>
</div>
<?php } ?>