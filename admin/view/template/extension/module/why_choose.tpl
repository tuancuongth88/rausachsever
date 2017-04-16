<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-html" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                            class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                       class="btn btn-default"><i class="fa fa-reply"></i></a></div>
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>
                <div class="panel-body">

                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-html"
                          class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="name" value="<?php echo $name; ?>"
                                       placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control"/>
                                <?php if ($error_name) { ?>
                                    <div class="text-danger"><?php echo $error_name; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <select name="status" id="input-status" class="form-control">
                                    <?php if ($status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-banner">Banner</label>
                            <div class="col-sm-10">
                                <select name="banner_id" id="input-banner" class="form-control">
                                    <?php foreach ($banners as $banner) { ?>
                                        <?php if ($banner['banner_id'] == $banner_id) { ?>
                                            <option value="<?php echo $banner['banner_id']; ?>"
                                                    selected="selected"><?php echo $banner['name']; ?></option>
                                        <?php } else { ?>
                                            <option
                                                value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                                        <?php } ?>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-width">Chiều rộng banner</label>
                            <div class="col-sm-10">
                                <input type="text" name="banner_width" value="<?php echo $banner_width; ?>"
                                       placeholder="Chiều rộng banner" id="input-width" class="form-control"/>
                                <?php if ($error_banner_width) { ?>
                                    <div class="text-danger"><?php echo $error_banner_width; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-height">Chiều cao banner</label>
                            <div class="col-sm-10">
                                <input type="text" name="banner_height" value="<?php echo $banner_height; ?>"
                                       placeholder="Chiều cao banner" id="input-height"
                                       class="form-control"/>
                                <?php if ($error_banner_height) { ?>
                                    <div class="text-danger"><?php echo $error_banner_height; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                <ul class="nav nav-tabs tabs-left" id="tabs-vertical">
                                    <?php if($module_description){ ?>
                                        <?php $row = 0; foreach($module_description as $module){ ?>
                                            <li><a href="#tab-module-<?php echo $row; ?>" id="id-module-<?php echo $row; ?>" data-toggle="tab"><?php echo $text_item.$row; ?>
                                                    <i class="fa fa-minus-circle" onclick="$('.tabs-left a:first').trigger('click'); $('#id-module-<?php echo $row; ?>').remove(); $('#tab-module-<?php echo $row; ?>').remove(); return false;"></i>
                                                    </a></li>
                                            <?php $row++; } ?>
                                    <?php } ?>
                                    <li id="module-add"><?php echo $button_add; ?>&nbsp;<i class="fa fa-plus" onclick="addItem();" ></i></li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                                <div class="tab-content" id="tab-description">
                                    <?php $row = 0; foreach($module_description as $module){ ?>
                                        <div class="tab-pane" id="tab-module-<?php echo $row; ?>">
                                            <div class="tab-pane">
                                                <ul class="nav nav-tabs tab-content-description" id="language-<?php echo $row; ?>">
                                                    <?php foreach ($languages as $language) { ?>
                                                        <li>
                                                            <a href="#language-<?php echo $row; ?>-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?>
                                                            </a></li>
                                                    <?php } ?>
                                                </ul>
                                                <div class="tab-content">
                                                    <?php foreach ($languages as $language) { ?>
                                                        <div class="tab-pane" id="language-<?php echo $row; ?>-<?php echo $language['language_id']; ?>">
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="module_description[<?php echo $row; ?>][<?php echo $language['language_id']; ?>][title]" placeholder="<?php echo $entry_title; ?>"  value="<?php echo isset($module_description[$row][$language['language_id']]['title']) ? $module_description[$row][$language['language_id']]['title'] : ''; ?>" class="form-control" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="module_description[<?php echo $row; ?>][icon]" placeholder=""  value="<?php echo isset($module_description[$row]['icon']) ? $module_description[$row]['icon'] : ''; ?>" size="15" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="module_description[<?php echo $row; ?>][sort_order]" placeholder="<?php echo $entry_sort_order; ?>"  value="<?php echo isset($module_description[$row]['sort_order']) ? $module_description[$row]['sort_order'] : ''; ?>" size="15" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                                                <div class="col-sm-10">
                                                    <select name="module_description[<?php echo $row; ?>][status]" class="form-control">
                                                        <?php if($module_description[$row]['status']) { ?>
                                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                            <option value="0"><?php echo $text_disabled; ?></option>
                                                        <?php } else { ?>
                                                            <option value="1"><?php echo $text_enabled; ?></option>
                                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                        <?php } ?>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <?php $row++; } ?>

                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
        <link href="view/javascript/summernote/summernote.css" rel="stylesheet"/>
        <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
        <script type="text/javascript"><!--
            $('#language a:first').tab('show');
            //--></script>
    </div>

    <script type="text/javascript"><!--
        $('#language a:first').tab('show');
        //--></script>
<script>
    $('#tabs-vertical a:first').tab('show');
    <?php $tabs = 0; foreach ($module_description as $module) { ?>
        $('#language-<?php echo $tabs; ?> a:first').tab('show');
    <?php $tabs++; } ?>
</script>
<script type="text/javascript"><!--
    var row = <?php echo $row; ?>;
    function addItem() {
        html = '<div class="tab-pane" id="tab-module-' + row + '">';
        html +='<div class="tab-pane">';
        html +='<ul class="nav nav-tabs" id="language-' + row + '">';
        <?php foreach ($languages as $language) { ?>
        html +='<li>';
        html +='<a href="#language-' + row + '-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?>';
        html +='</a></li>';
        <?php } ?>
        html +='</ul>';
        html +='<div class="tab-content">';
        <?php foreach ($languages as $language) { ?>
        html +='<div class="tab-pane" id="language-' + row + '-<?php echo $language['language_id']; ?>">';
        html +='<div class="form-group">';
        html +='<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>';
        html +='<div class="col-sm-10">';
        html +='<input type="text" name="module_description[' + row + '][<?php echo $language['language_id']; ?>][title]" placeholder="<?php echo $entry_title; ?>"  value="" class="form-control" />';
        html +='</div>';
        html +='</div>';
        html +='</div>';
        <?php } ?>
        html +='</div>';
        html +='</div>';
        html +='<div class="form-group">';
        html +='<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>';
        html +='<div class="col-sm-10">';
        html +='<input type="text" name="module_description[' + row + '][icon]" placeholder=""  value="" size="15" class="form-control" />';
        html +='</div>';
        html +='</div>';
        html +='<div class="form-group">';
        html +='<label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>';
        html +='<div class="col-sm-10">';
        html +='<input type="text" name="module_description[' + row + '][sort_order]" placeholder="<?php echo $entry_sort_order; ?>"  value="0" size="15" class="form-control" />';
        html +='</div>';
        html +='</div>';
        html +='<div class="form-group">';
        html +='<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>';
        html +='<div class="col-sm-10">';
        html +='<select name="module_description[' + row + '][status]" class="form-control">';
        html +='<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
        html +='<option value="0"><?php echo $text_disabled; ?></option>';
        html +='</select>';
        html +='</div>';
        html +='</div>';
        html +='</div>';

        $('#tab-description').append(html);
        $('#language-' + row + ' a:first').tab('show');
        $('#module-add').before('<li><a href="#tab-module-' + row + '" id="id-module-' + row + '" data-toggle="tab"><?php echo $text_item; ?> ' + row + ' <i class="fa fa-minus-circle" onclick="$(\'.tabs-left a:first\').trigger(\'click\'); $(\'#id-module-' + row + '\').remove(); $(\'#tab-module-' + row + '\').remove(); return false;" ></i></a></li>');

        $('#tabs-vertical a#id-module-' + row + '').tab('show');
        $('#id-module-' + row + '').trigger('click');
        row++;
    }
    //--></script>

<?php echo $footer; ?>