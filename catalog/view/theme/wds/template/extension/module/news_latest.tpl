<?php if ($newss) { ?>
    <div class="box with-scroll" style="margin-top: 30px;">
        <div class="box-heading2"><?php echo $heading_title; ?></div>
        <div class="box-content news">
            <div class="box-news">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <?php foreach ($newss as $key => $news) { ?>
                            <?php if ($key == 0) { ?>
                                <div class="news-item-first">
                                    <div class="image">
                                        <a href="<?php echo $news['href']; ?>"><img class="img-responsive" src="<?php echo $news['thumb']; ?>" alt="<?php echo $news['name']; ?>"></a>
                                    </div>
                                    <div class="description">
                                        <div class="name"><a href="<?php echo $news['href']; ?>"><?php echo $news['name']; ?></a></div>
                                        <div class="name"><i class="fa fa-calendar"></i> <?php echo $news['date_added']; ?></div>
                                    </div>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <ul>
                        <?php foreach ($newss as $key2 => $news2) { ?>
                            <?php if ($key2 > 0) { ?>
                                <li style='margin-bottom:4px;'>
									<div style='margin-right: 1%;width: 16%' class="pull-left">
                                        <a href="<?php echo $news2['href']; ?>"><img style='width: 80px;' class="img-responsive" src="<?php echo $news2['thumb']; ?>" alt="<?php echo $news2['name']; ?>"></a>
                                    </div>
                                    <div class="pull-left" style="width: 83%">
                                        <div class="name"><a style="line-height: 20px;" href="<?php echo $news2['href']; ?>"><?php echo $news2['name']; ?></a></div>
                                        <div class="name" style="color: #999"><i class="fa fa-calendar"></i> <?php echo $news2['date_added']; ?></div>
                                    </div>
									<div class='clearfix'></div>
							</li>
                            <?php } ?>
                        <?php } ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php } ?>