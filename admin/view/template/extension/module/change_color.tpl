<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <style>
        span.color-default:hover {
            cursor: pointer;
        }
    </style>
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
                            <input type="text" name="change_color_name" value="<?php echo $name; ?>"
                                   placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control"/>
                            <?php if ($error_name) { ?>
                            <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-width">Màu nền menu</label>
                        <div class="col-sm-10">
                            <input style="width: 100px; display: inline-block" type="text" name="change_color_bg_menu"
                                   value="<?php echo $change_color_bg_menu; ?>"
                                   class="form-control change_color_bg_menu"/>
                            <span class="cp-alt-target-change_color_bg_menu"
                                  style="display: inline; border: thin solid black; padding: 8px 27px;border-radius: 4px; "></span>
                            <span class="color-default"
                                  style="display: inline; border: thin solid black;margin-left: 5px; padding: 8px 27px;border-radius: 4px; ">Mặc định</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-width">Copyright chân trang</label>
                        <div class="col-sm-10">
                            <input style="width: 100px; display: inline-block" type="text"
                                   name="change_color_bg_copyright" value="<?php echo $change_color_bg_copyright; ?>"
                                   class="form-control change_color_bg_copyright"/>
                            <span class="cp-alt-target-change_color_bg_copyright"
                                  style="display: inline; border: thin solid black; padding: 8px 27px;border-radius: 4px; "></span>
                            <span class="color-default"
                                  style="display: inline; border: thin solid black;margin-left: 5px; padding: 8px 27px;border-radius: 4px; ">Mặc định</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-width">Màu nền body</label>
                        <div class="col-sm-10">
                            <input style="width: 100px; display: inline-block" type="text" name="change_color_bg_body"
                                   value="<?php echo $change_color_bg_body; ?>"
                                   class="form-control change_color_bg_body"/>
                            <span class="cp-alt-target-change_color_bg_body"
                                  style="display: inline; border: thin solid black; padding: 8px 27px;border-radius: 4px; "></span>
                            <span class="color-default"
                                  style="display: inline; border: thin solid black;margin-left: 5px; padding: 8px 27px;border-radius: 4px; ">Mặc định</span>
                            <hr>
                        </div>
                        <label class="col-sm-2 control-label" for="input-width">Hình nền body</label>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-sm-2">
                                    <div>
                                        <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img
                                                    src="<?php echo $thumb; ?>" alt="" title=""
                                                    data-placeholder="<?php echo $placeholder; ?>"/></a>
                                        <input type="hidden" name="change_color_bg_body_background_image"
                                               value="<?php echo $change_color_bg_body_background_image; ?>"
                                               id="input-image"/>
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div style="width: 100%">
                                        <label class="col-sm-7 control-label" for="input-width">Background repeat</label>
                                        <select name="change_color_bg_body_image_background_repeat">
                                            <option value=""></option>
                                            <?php if($change_color_bg_body_image_background_repeat == 'no-repeat'){ ?>
                                            <option value="no-repeat" selected="selected">no-repeat</option>
                                            <?php }else{ ?>
                                            <option value="no-repeat" >no-repeat</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_repeat == 'repeat-x'){ ?>
                                            <option value="repeat-x" selected="selected">repeat-x</option>
                                            <?php }else{ ?>
                                            <option value="repeat-x" >repeat-x</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_repeat == 'repeat-y'){ ?>
                                            <option value="repeat-y" selected="selected">repeat-y</option>
                                            <?php }else{ ?>
                                            <option value="repeat-y" >repeat-y</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_repeat == 'repeat'){ ?>
                                            <option value="repeat" selected="selected">repeat</option>
                                            <?php }else{ ?>
                                            <option value="repeat" >repeat</option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class='clearfix'></div>
                                    <div style="width: 100%">
                                        <label class="col-sm-7 control-label" for="input-width">Background size</label>
                                        <select name="change_color_bg_body_image_background_size">
                                            <option value=""></option>
                                            <?php if($change_color_bg_body_image_background_size == 'auto'){ ?>
                                            <option value="auto" selected="selected">auto</option>
                                            <?php }else{ ?>
                                            <option value="auto" >auto</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_size == 'cover'){ ?>
                                            <option value="cover" selected="selected">cover</option>
                                            <?php }else{ ?>
                                            <option value="cover" >cover</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_size == 'contain'){ ?>
                                            <option value="contain" selected="selected">contain</option>
                                            <?php }else{ ?>
                                            <option value="contain" >contain</option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class='clearfix'></div>
                                </div>
                                <div class="col-sm-5">
                                    <div style="width: 100%">
                                        <label class="col-sm-7 control-label" for="input-width">Background
                                            attachment</label>
                                        <select name="change_color_bg_body_image_background_attachment">
                                            <option value=""></option>
                                            <?php if($change_color_bg_body_image_background_attachment == 'scroll'){ ?>
                                            <option value="scroll" selected="selected">scroll</option>
                                            <?php }else{ ?>
                                            <option value="scroll" >scroll</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_attachment == 'fixed'){ ?>
                                            <option value="fixed" selected="selected">fixed</option>
                                            <?php }else{ ?>
                                            <option value="fixed" >fixed</option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class='clearfix'></div>
                                    <div style="width: 100%">
                                        <label class="col-sm-7 control-label" for="input-width">Background
                                            position</label>
                                        <select name="change_color_bg_body_image_background_position">
                                            <option value=""></option>
                                            <?php if($change_color_bg_body_image_background_position == 'left top'){ ?>
                                            <option value="left top" selected="selected">left top</option>
                                            <?php }else{ ?>
                                            <option value="left top" >left top</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_position == 'left center'){ ?>
                                            <option value="left center" selected="selected">left center</option>
                                            <?php }else{ ?>
                                            <option value="left center" >left center</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_position == 'left bottom'){ ?>
                                            <option value="left bottom" selected="selected">left bottom</option>
                                            <?php }else{ ?>
                                            <option value="left bottom" >left bottom</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_position == 'right top'){ ?>
                                            <option value="right top" selected="selected">right top</option>
                                            <?php }else{ ?>
                                            <option value="right top" >right top</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_position == 'right center'){ ?>
                                            <option value="right center" selected="selected">right center</option>
                                            <?php }else{ ?>
                                            <option value="right center" >right center</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_position == 'right bottom'){ ?>
                                            <option value="right bottom" selected="selected">right bottom</option>
                                            <?php }else{ ?>
                                            <option value="right bottom" >right bottom</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_position == 'center top'){ ?>
                                            <option value="center top" selected="selected">center top</option>
                                            <?php }else{ ?>
                                            <option value="center top" >center top</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_position == 'center center'){ ?>
                                            <option value="center center" selected="selected">center center</option>
                                            <?php }else{ ?>
                                            <option value="center center" >center center</option>
                                            <?php } ?>
                                            <?php if($change_color_bg_body_image_background_position == 'center bottom'){ ?>
                                            <option value="center bottom" selected="selected">center bottom</option>
                                            <?php }else{ ?>
                                            <option value="center bottom" >center bottom</option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class='clearfix'></div>
                                </div>
                            </div>
                            <small>(Chỉ sử dụng được hoặc hình nền, hoặc chọn màu sắc hoặc mặc định)</small>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-width">Màu link hover</label>
                        <div class="col-sm-10">
                            <input style="width: 100px; display: inline-block" type="text"
                                   name="change_color_link_hover" value="<?php echo $change_color_link_hover; ?>"
                                   class="form-control change_color_link_hover"/>
                            <span class="cp-alt-target-change_color_link_hover"
                                  style="display: inline; border: thin solid black; padding: 8px 27px;border-radius: 4px; "></span>
                            <span class="color-default"
                                  style="display: inline; border: thin solid black;margin-left: 5px; padding: 8px 27px;border-radius: 4px; ">Mặc định</span>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script>

    $(function () {
        $('.change_color_bg_menu').colorpicker({
            altField: '.cp-alt-target-change_color_bg_menu',
            altProperties: 'background-color',
            position: {
                my: 'center',
                at: 'center',
                of: window
            },
            modal: true
        });
        $('.change_color_bg_copyright').colorpicker({
            altField: '.cp-alt-target-change_color_bg_copyright',
            altProperties: 'background-color',
            position: {
                my: 'center',
                at: 'center',
                of: window
            },
            modal: true
        });
        $('.change_color_bg_body').colorpicker({
            altField: '.cp-alt-target-change_color_bg_body',
            altProperties: 'background-color',
            position: {
                my: 'center',
                at: 'center',
                of: window
            },
            modal: true
        });
        $('.change_color_link_hover').colorpicker({
            altField: '.cp-alt-target-change_color_link_hover',
            altProperties: 'background-color',
            position: {
                my: 'center',
                at: 'center',
                of: window
            },
            modal: true
        });

        $('.color-default').bind('click', function () {
            $(this).parent().find('input').val('');
            $(this).parent().find('span').css({
                'background-color': '#fff'
            });
        })
    });

</script>
<?php echo $footer; ?>