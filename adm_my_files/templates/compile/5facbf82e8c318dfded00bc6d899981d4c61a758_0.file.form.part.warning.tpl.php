<?php
/* Smarty version 4.3.1, created on 2023-10-11 12:42:27
  from 'C:\wamp\www\admidio\adm_program\installation\templates\sys-template-parts\parts\form.part.warning.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_65267c134eafc2_67962810',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5facbf82e8c318dfded00bc6d899981d4c61a758' => 
    array (
      0 => 'C:\\wamp\\www\\admidio\\adm_program\\installation\\templates\\sys-template-parts\\parts\\form.part.warning.tpl',
      1 => 1697020751,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65267c134eafc2_67962810 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['alertWarning']->value) {?>
    <div class="alert alert-warning mt-3" role="alert">
        <i class="fas fa-exclamation-triangle"></i><?php echo $_smarty_tpl->tpl_vars['alertWarning']->value;?>

    </div>
<?php }
}
}
