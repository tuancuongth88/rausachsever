<?php echo $header; ?>
<div class="container">
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">               
				<div class="content-page">
				    <div class="row">
				        <!-- BEGIN LEFT SIDEBAR -->
				        <div class="col-md-12 col-sm-12 blog-posts">
				        <?php foreach($newss as $news)  { ?>
				            <div class="row">
				                <div class="col-md-3 col-sm-3">
				                    <img class="img-responsive" alt="" src="<?php echo $news['thumb']?>" style="width:100%">
				                </div>
				                <div class="col-md-9 col-sm-9">
				                    <h2><a href="<?php echo $news['href']; ?>"><?php echo $news['name']; ?></a></h2>
				                    <ul class="blog-info">
				                        <li><i class="fa fa-calendar"></i> <?php echo $news['date_added']; ?></li>
				                    </ul>
				                    <p> <?php echo $news['description']; ?></p>
				                    <a href="<?php echo $news['href']; ?>" class="more">Read more <i class="icon-angle-right"></i></a>
				                </div>
				            </div>
				            <hr class="blog-post-sep">
				            <?php } ?>
				        </div>
				    </div>
				</div>
            </div>
        </div>
    </div>
<?php echo $footer; ?>
</div>