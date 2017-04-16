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

          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <fieldset>
              <legend><?php echo $text_password; ?></legend>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                <div class="col-sm-10">
                  <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                  <?php if ($error_password) { ?>
                    <div class="text-danger"><?php echo $error_password; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                <div class="col-sm-10">
                  <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                  <?php if ($error_confirm) { ?>
                    <div class="text-danger"><?php echo $error_confirm; ?></div>
                  <?php } ?>
                </div>
              </div>
            </fieldset>
            <div class="buttons clearfix">
              <div class="pull-left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
              <div class="pull-right">
                <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
              </div>
            </div>
          </form>

        </div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
  </div>
<?php echo $column_right; ?>
<?php echo $footer; ?>