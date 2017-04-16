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

          <h2><?php echo $text_my_account; ?></h2>
          <ul class="list-unstyled">
            <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
            <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
            <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
          </ul>
          <h2><?php echo $text_my_tracking; ?></h2>
          <ul class="list-unstyled">
            <li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
          </ul>
          <h2><?php echo $text_my_transactions; ?></h2>
          <ul class="list-unstyled">
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
          </ul>

        </div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
  </div>
<?php echo $column_right; ?>
<?php echo $footer; ?>