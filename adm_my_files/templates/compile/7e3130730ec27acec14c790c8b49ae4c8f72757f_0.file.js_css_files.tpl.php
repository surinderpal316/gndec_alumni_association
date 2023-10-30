<?php
/* Smarty version 4.3.1, created on 2023-10-11 12:42:24
  from 'C:\wamp\www\admidio\adm_program\installation\templates\js_css_files.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_65267c10a38686_46606028',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7e3130730ec27acec14c790c8b49ae4c8f72757f' => 
    array (
      0 => 'C:\\wamp\\www\\admidio\\adm_program\\installation\\templates\\js_css_files.tpl',
      1 => 1697020750,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65267c10a38686_46606028 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['debug']->value) {?>
  <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/jquery/jquery.js"><?php echo '</script'; ?>
>
  <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/bootstrap/js/bootstrap.bundle.js"><?php echo '</script'; ?>
>

  <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/bootstrap/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/fontawesome/css/fontawesome.css" />
  <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/fontawesome/css/solid.css" />
  <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/fontawesome/css/brands.css" />
<?php } else { ?>
  <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/jquery/jquery.min.js"><?php echo '</script'; ?>
>
  <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/bootstrap/js/bootstrap.bundle.min.js"><?php echo '</script'; ?>
>

  <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/bootstrap/css/bootstrap.min.css" />
  <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/fontawesome/css/fontawesome.min.css" />
  <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/fontawesome/css/solid.min.css" />
  <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/fontawesome/css/brands.min.css" />
<?php }?>

<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/system/js/common_functions.js"><?php echo '</script'; ?>
>
<?php }
}
