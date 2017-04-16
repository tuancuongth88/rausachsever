<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>"
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
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured"
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
                        <label class="col-sm-2 control-label" for="input-product"><?php echo $text_wds_category; ?></label>
                        <div class="col-sm-10">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <td><?php echo $text_wds_category; ?></td>
                                        <td><?php echo $text_wds_action; ?></td>
                                    </tr>
                                </thead>
                                <?php
                                $row = 0;
                                foreach($combo_categories as $combo_category){ ?>
                                <tbody>
                                    <tr>
                                        <td>
                                            <select name="combo_categories[<?php echo $row ?>]" class="form-control">
                                                <?php foreach ($categories as $category) { ?>
                                                    <option  <?php if($category['category_id'] == $combo_category){
                                                        echo 'selected="selected"';
                                                    } ?> value="<?php echo $category['category_id'] ?>"><?php echo $category['name'] ?></option>
                                                <?php } ?>
                                            </select>
                                        </td>
                                        <td>
                                            <button type="button" onclick="$(this).parent().parent().parent().remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-sm"><i class="fa fa fa-minus-circle"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                                <?php $row++; } ?>
                                <tfoot id="tf-add-category">
                                <tr>
                                    <td colspan="2">
                                        <button type="button" onclick="addCategory();" data-toggle="tooltip" title="<?php echo $button_add_category; ?>" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i></button>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="limit" value="<?php echo $limit; ?>"
                                   placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="width" value="<?php echo $width; ?>"
                                   placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control"/>
                            <?php if ($error_width) { ?>
                                <div class="text-danger"><?php echo $error_width; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="height" value="<?php echo $height; ?>"
                                   placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control"/>
                            <?php if ($error_height) { ?>
                                <div class="text-danger"><?php echo $error_height; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
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
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript"><!--
        $('input[name=\'product_name\']').autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['product_id']
                            }
                        }));
                    }
                });
            },
            select: function (item) {
                $('input[name=\'product_name\']').val('');

                $('#featured-product' + item['value']).remove();

                $('#featured-product').append('<div id="featured-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product[]" value="' + item['value'] + '" /></div>');
            }
        });

        $('#featured-product').delegate('.fa-minus-circle', 'click', function () {
            $(this).parent().remove();
        });
        //--></script>
    <script type="text/javascript"><!--
        var row = <?php echo $row; ?>;
        function addCategory() {
            html = '<tbody>';
            html += '<tr>';
            html += '<td>';
            html += '<select name="combo_categories['+ row +']" class="form-control">';
                <?php foreach ($categories as $category) { ?>
            html += '<option value="<?php echo $category['category_id'] ?>"><?php echo $category['name'] ?></option>';
                <?php } ?>
            html += '</select>';
            html += '</td>';
            html += '<td>';
            html += '<button type="button" onclick="$(this).parent().parent().parent().remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-sm"><i class="fa fa fa-minus-circle"></i></button>';
            html += '</td>';
            html += '</tr>';
            html += '</tbody>';
            $('#tf-add-category').before(html);
            row++;
        }
        //--></script>
</div>
<?php echo $footer; ?>