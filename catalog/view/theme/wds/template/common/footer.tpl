<div class="main-content full-width home" style="
    background-color: #188596;
    color: #fff;
">
    <div class="footer full-width">
        <div class="container">
            <div class="row">
                <?php if ($informations) { ?>
                <div class="col-sm-6 col-xs-12 col-md-3 footer-column">
                    <h4><?php echo $text_information; ?></h4>
                    <ul>
                        <?php foreach ($informations as $information) { ?>
                            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
                <?php } ?>
                <div class="col-sm-6 col-xs-12 col-md-3 footer-column">
                    <h4><?php echo $text_service; ?></h4>
                    <ul>
                        <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                        <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                    </ul>
                </div>
                <div class="col-sm-6 col-xs-12 col-md-3 footer-column">
                    <h4><?php echo $text_extra; ?></h4>
                    <ul>
                        <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                        <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                        <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                        <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                    </ul>
                </div>
                <div class="col-sm-6 col-xs-12 col-md-3 footer-column">
                    <h4><?php echo $text_account; ?></h4>
                    <ul>
                        <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <div class="container pattern">
            <p class="copyright-left"><?php echo $powered; ?></p>
            <ul class="copyright-right">
                <li><a href="http://paypal.com/" target="_blank"><img src="catalog/view/theme/wds/image/paypal.png" alt=""></a>
                </li>
                <li><a href="http://visa.com/" target="_blank"><img src="catalog/view/theme/wds/image/visa.png" alt=""></a></li>
                <li><a href="http://mastercard.com/" target="_blank"><img src="catalog/view/theme/wds/image/mastercard.png"  alt=""></a></li>
            </ul>
        </div>
    </div>
    <script type="text/javascript" src="catalog/view/theme/wds/js/megamenu.js"></script>
</div>
<a href="#" class="scrollup"><i class="fa fa-caret-up"></i></a>
</div>
</body>
</html>