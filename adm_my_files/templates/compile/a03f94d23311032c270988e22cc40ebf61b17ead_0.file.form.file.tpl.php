<?php
/* Smarty version 4.3.1, created on 2023-10-20 15:14:20
  from 'C:\wamp\www\admidio\adm_themes\simple\templates\sys-template-parts\form.file.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_65324bf49a13c6_38806326',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a03f94d23311032c270988e22cc40ebf61b17ead' => 
    array (
      0 => 'C:\\wamp\\www\\admidio\\adm_themes\\simple\\templates\\sys-template-parts\\form.file.tpl',
      1 => 1697554591,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:sys-template-parts/parts/form.part.icon.tpl' => 2,
    'file:sys-template-parts/parts/form.part.iconhelp.tpl' => 1,
    'file:sys-template-parts/parts/form.part.helptext.tpl' => 1,
    'file:sys-template-parts/parts/form.part.warning.tpl' => 1,
  ),
),false)) {
function content_65324bf49a13c6_38806326 (Smarty_Internal_Template $_smarty_tpl) {
?><div
    id="<?php echo $_smarty_tpl->tpl_vars['id']->value;?>
_group"
    class="form-group form-upload row <?php if ($_smarty_tpl->tpl_vars['property']->value == 1) {?>admidio-form-group-required<?php }?>">
    <label for="<?php echo $_smarty_tpl->tpl_vars['id']->value;?>
" class="col-sm-3 control-label">
        <?php $_smarty_tpl->_subTemplateRender('file:sys-template-parts/parts/form.part.icon.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
        <?php echo $_smarty_tpl->tpl_vars['label']->value;?>

        <?php $_smarty_tpl->_subTemplateRender('file:sys-template-parts/parts/form.part.iconhelp.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    </label>
  <div class="col-sm-9">
    <?php if ($_smarty_tpl->tpl_vars['maxUploadSize']->value) {?>
    <input
      type="hidden"
      name="MAX_FILE_SIZE"
      id="MAX_FILE_SIZE"
      value="<?php echo $_smarty_tpl->tpl_vars['maxUploadSize']->value;?>
"
    />
    <?php }?>
    <?php if ($_smarty_tpl->tpl_vars['hideUploadField']->value != true || !$_smarty_tpl->tpl_vars['enableMultiUploads']->value) {?>
        <input type="file" name="userfile[]"
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['data']->value['attributes'], 'itemvar');
$_smarty_tpl->tpl_vars['itemvar']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['itemvar']->key => $_smarty_tpl->tpl_vars['itemvar']->value) {
$_smarty_tpl->tpl_vars['itemvar']->do_else = false;
$__foreach_itemvar_0_saved = $_smarty_tpl->tpl_vars['itemvar'];
?>
                <?php echo $_smarty_tpl->tpl_vars['itemvar']->key;?>
="<?php echo $_smarty_tpl->tpl_vars['itemvar']->value;?>
"
            <?php
$_smarty_tpl->tpl_vars['itemvar'] = $__foreach_itemvar_0_saved;
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
        />
    <?php }?>

    <?php if ($_smarty_tpl->tpl_vars['enableMultiUploads']->value) {?>
    <button
      type="button"
      id="btn_add_attachment_<?php echo $_smarty_tpl->tpl_vars['id']->value;?>
"
      class="btn btn-secondary"
    >
        <?php $_smarty_tpl->_subTemplateRender('file:sys-template-parts/parts/form.part.icon.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?> <?php echo $_smarty_tpl->tpl_vars['multiUploadLabel']->value;?>

    </button>
    <?php }?>
    <?php $_smarty_tpl->_subTemplateRender('file:sys-template-parts/parts/form.part.helptext.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <?php $_smarty_tpl->_subTemplateRender('file:sys-template-parts/parts/form.part.warning.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
  </div>
</div>
<?php }
}
