<div class="fullwidth">
    <div class="fullwidthbanner-container slider-container-1">
        <div class="fullwidthbanner slider-1-<?php echo $module; ?>">
            <ul>
                <?php foreach ($banners as $banner) { ?>
                    <li data-transition="random" data-slotamount="10"
                        data-masterspeed="300">
                        <img data-fullwidthcentering="on" src="<?php echo $banner['image']; ?>"
                             alt="<?php echo $banner['title']; ?>"
                             class="img-responsive"/>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>
<style type="text/css">
    .slider-container-1 {
        max-height: 516px !important;
    }
</style>

<!--
##############################
- ACTIVATE THE BANNER HERE -
##############################
-->
<script type="text/javascript">

    var api;
    jQuery(document).ready(function () {
        api = jQuery('.slider-1-<?php echo $module; ?>').revolution(
            {
                delay: 9000,
                startheight: 516,
                startwidth: 620,
                onHoverStop: "on",						// Stop Banner Timet at Hover on Slide on/off

                thumbWidth: 100,							// Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
                thumbHeight: 50,
                thumbAmount: 3,

                hideThumbs: 1,
                navigationType: "bullet",					//bullet, thumb, none, both	 (No Shadow in Fullwidth Version !)
                navigationArrows: "verticalcentered",		//nexttobullets, verticalcentered, none
                navigationStyle: "round",				//round,square,navbar

                touchenabled: "on",						// Enable Swipe Function : on/off

                navOffsetHorizontal: 0,
                navOffsetVertical: 20,

                stopAtSlide: -1,							// Stop Timer if Slide "x" has been Reached. If stopAfterLoops set to 0, then it stops already in the first Loop at slide X which defined. -1 means do not stop at any slide. stopAfterLoops has no sinn in this case.
                stopAfterLoops: -1,						// Stop Timer if All slides has been played "x" times. IT will stop at THe slide which is defined via stopAtSlide:x, if set to -1 slide never stop automatic

                hideCaptionAtLimit: 0,					// It Defines if a caption should be shown under a Screen Resolution ( Basod on The Width of Browser)
                hideAllCaptionAtLilmit: 0,				// Hide all The Captions if Width of Browser is less then this value
                hideSliderAtLimit: 0,					// Hide the whole slider, and stop also functions if Width of Browser is less than this value
                
                fullWidth: "on",

                shadow: 0								//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows -  (No Shadow in Fullwidth Version !)
            });
    });

</script>