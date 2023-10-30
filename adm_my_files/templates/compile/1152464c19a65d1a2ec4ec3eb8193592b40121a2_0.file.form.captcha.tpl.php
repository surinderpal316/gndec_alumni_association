<?php
/* Smarty version 4.3.1, created on 2023-10-17 16:38:38
  from 'C:\wamp\www\admidio\adm_themes\simple\templates\sys-template-parts\form.captcha.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_652e6b36021347_45081433',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1152464c19a65d1a2ec4ec3eb8193592b40121a2' => 
    array (
      0 => 'C:\\wamp\\www\\admidio\\adm_themes\\simple\\templates\\sys-template-parts\\form.captcha.tpl',
      1 => 1697020750,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_652e6b36021347_45081433 (Smarty_Internal_Template $_smarty_tpl) {
?><div id="captcha_puzzle_group" class="form-group captcha row">
    <div class="offset-sm-3 col-sm-9">
        <img id="captcha"
            src="<?php echo $_smarty_tpl->tpl_vars['ADMIDIO_URL']->value;
echo $_smarty_tpl->tpl_vars['FOLDER_LIBS_SERVER']->value;?>
/dapphp/securimage/securimage_show.php"
            alt="CAPTCHA Image" />
        <a class="admidio-icon-link" href="javascript:void(0)"
            onclick="document.getElementById('captcha').src='<?php echo $_smarty_tpl->tpl_vars['ADMIDIO_URL']->value;
echo $_smarty_tpl->tpl_vars['FOLDER_LIBS_SERVER']->value;?>
/dapphp/securimage/securimage_show.php?'
            + Math.random(); return false;">
            <i class="fas fa-sync-alt fa-lg" data-toggle="tooltip"
                title="<?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('SYS_RELOAD');?>
"></i>
        </a>
    </div>
</div><?php }
}
