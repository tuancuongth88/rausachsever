<?php if($categories): ?>
<div class="box box-categories box-with-categories">
    <div class="box-heading"><?php echo $text_wds_category; ?></div>
    <div class="strip-line"></div>
    <div class="box-content box-information" style="min-height: 421px;">
        <div class="box-information">
            <ul class="accordion" id="accordion-category">
                <?php foreach ($categories as $category) { ?>
                    <li>
                        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>
<?php endif; ?>
