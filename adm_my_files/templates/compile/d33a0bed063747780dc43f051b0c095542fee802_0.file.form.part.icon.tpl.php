<?php
/* Smarty version 4.3.1, created on 2023-10-11 16:27:00
  from 'C:\wamp\www\admidio\adm_themes\simple\templates\sys-template-parts\parts\form.part.icon.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_65267f7c83c988_33645715',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd33a0bed063747780dc43f051b0c095542fee802' => 
    array (
      0 => 'C:\\wamp\\www\\admidio\\adm_themes\\simple\\templates\\sys-template-parts\\parts\\form.part.icon.tpl',
      1 => 1697020750,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65267f7c83c988_33645715 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['icon']->value) {?>
    <?php if (Image::isFontAwesomeIcon($_smarty_tpl->tpl_vars['icon']->value)) {?>
        <i class="<?php echo $_smarty_tpl->tpl_vars['icon']->value;?>
 fas" <?php if ((isset($_smarty_tpl->tpl_vars['label']->value))) {?>data-toggle="tooltip" title="<?php echo $_smarty_tpl->tpl_vars['label']->value;?>
"<?php }?>></i>
    <?php } else { ?>
        <img src="<?php echo $_smarty_tpl->tpl_vars['icon']->value;?>
" <?php if ((isset($_smarty_tpl->tpl_vars['label']->value))) {?>alt="<?php echo $_smarty_tpl->tpl_vars['label']->value;?>
"<?php }?> />
    <?php }
}
}
}
