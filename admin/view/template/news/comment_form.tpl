<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a onclick="$('#form').attr('action', '<?php echo $action; ?>&redirect=add').submit()" class="btn btn-primary"><i class="fa fa-check"></i> <?php echo $button_save_add; ?></a>
                <a onclick="$('#form').attr('action', '<?php echo $action; ?>&redirect=edit').submit()" class="btn btn-primary"><i class="fa fa-check"></i> <?php echo $button_save_edit; ?></a>
                <a onclick="$('#form').attr('action', '<?php echo $action; ?>&redirect=exit').submit()" class="btn btn-primary"><i class="fa fa-check"></i> <?php echo $button_save_exit; ?></a>
                <a href="<?php echo $cancel; ?>" class="btn btn-primary"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <?php if($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-author"><?php echo $entry_author; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="author" value="<?php echo $author; ?>" placeholder="<?php echo $entry_author; ?>" id="input-author" class="form-control" />
                            <?php if($error_author) { ?>
                                <div class="text-danger"><?php echo $error_author; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-news"><span data-toggle="tooltip" title="<?php echo $help_news; ?>"><?php echo $entry_news; ?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="news" value="<?php echo $news; ?>" placeholder="<?php echo $entry_news; ?>" id="input-news" class="form-control" />
                            <input type="hidden" name="news_id" value="<?php echo $news_id; ?>" />
                            <?php if($error_news) { ?>
                                <div class="text-danger"><?php echo $error_news; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-text"><?php echo $entry_content; ?></label>
                        <div class="col-sm-10">
                            <textarea name="content" cols="60" rows="8" placeholder="<?php echo $entry_content; ?>" id="input-text" class="form-control"><?php echo $content; ?></textarea>
                            <?php if($error_content) { ?>
                                <div class="text-danger"><?php echo $error_content; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                            <?php if($error_email) { ?>
                                <div class="text-danger"><?php echo $error_email; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="status" id="input-status" class="form-control">
                                <?php if($status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript"><!--
        $('input[name=\'news\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url     : 'index.php?route=news/news/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success : function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['news_id']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'news\']').val(item['label']);
                $('input[name=\'news_id\']').val(item['value']);
            }
        });
        //--></script>
</div>
<?php echo $footer; ?>
