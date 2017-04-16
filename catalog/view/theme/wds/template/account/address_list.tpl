<?php echo $header; ?>
<?php if ($success) { ?>
  <div class="container">
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div></div>
<?php } ?>
<?php if ($error_warning) { ?>
  <div class="container">
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div></div>
<?php } ?>
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

          <?php if ($addresses) { ?>
            <div class="table-responsive">
              <table class="table table-bordered table-hover">
                <?php foreach ($addresses as $result) { ?>
                  <tr>
                    <td class="text-left"><?php echo $result['address']; ?></td>
                    <td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?></a></td>
                  </tr>
                <?php } ?>
              </table>
            </div>
          <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
          <?php } ?>
          <div class="buttons clearfix">
            <div class="pull-left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
            <div class="pull-right"><a href="<?php echo $add; ?>" class="button"><?php echo $button_new_address; ?></a></div>
          </div>

        </div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
  </div>
<?php echo $column_right; ?>
<?php echo $footer; ?>