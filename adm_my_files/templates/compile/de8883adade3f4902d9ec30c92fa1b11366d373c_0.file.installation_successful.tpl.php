<?php
/* Smarty version 4.3.1, created on 2023-10-11 16:26:53
  from 'C:\wamp\www\admidio\adm_program\installation\templates\installation_successful.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_65267f759cb081_95618647',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'de8883adade3f4902d9ec30c92fa1b11366d373c' => 
    array (
      0 => 'C:\\wamp\\www\\admidio\\adm_program\\installation\\templates\\installation_successful.tpl',
      1 => 1697020750,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65267f759cb081_95618647 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div id="installation-message">
    <h3><?php echo $_smarty_tpl->tpl_vars['l10n']->value->get("SYS_INSTALLATION_SUCCESSFUL");?>
</h3>

    <div class="alert alert-success form-alert">
        <i class="fas fa-check"></i>
        <strong><?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('SYS_INSTALLATION_SUCCESSFUL_SHORT_DESC');?>
</strong>
    </div>

    <p>
        <?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('SYS_INSTALLATION_SUCCESSFUL_DESC');?>
<br /><br />
        <?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('INS_SUPPORT_FURTHER_DEVELOPMENT');?>

    </p>

    <p><?php echo $_smarty_tpl->tpl_vars['content']->value;?>
</p>
</div>
<?php }
}
