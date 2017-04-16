<?php if (count($languages) > 1) { ?>
    <div class="dropdown  language language-header">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
            <div class="btn-group">
                <ul >
                    <?php foreach ($languages as $language) { ?>
                        <li>
                            <button class="btn btn-link btn-block language-select" type="button"
                                    name="<?php echo $language['code']; ?>"><img
                                    src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"
                                    alt="<?php echo $language['name']; ?>"
                                    title="<?php echo $language['name']; ?>"/></button>
                        </li>
                    <?php } ?>
                </ul>
            </div>
            <input type="hidden" name="code" value=""/>
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>"/>
        </form>
    </div>
<?php } ?>
