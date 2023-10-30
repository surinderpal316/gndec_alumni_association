<?php
/* Smarty version 4.3.1, created on 2023-10-11 16:27:00
  from 'C:\wamp\www\admidio\adm_themes\simple\templates\cookie_note.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_65267f7c47f905_49771755',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fa25ff466b498eaa94b9d7d2a837e56e92ee4f6c' => 
    array (
      0 => 'C:\\wamp\\www\\admidio\\adm_themes\\simple\\templates\\cookie_note.tpl',
      1 => 1697020750,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65267f7c47f905_49771755 (Smarty_Internal_Template $_smarty_tpl) {
?><link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/cookieconsent/cookieconsent.min.css" />
<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['urlAdmidio']->value;?>
/adm_program/libs/client/cookieconsent/cookieconsent.min.js"><?php echo '</script'; ?>
>

<?php echo '<script'; ?>
>
    window.addEventListener("load", function() {
        window.cookieconsent.initialise({
            "cookie": {
                "name": "<?php echo $_smarty_tpl->tpl_vars['cookiePrefix']->value;?>
_cookieconsent_status",
                "domain": "<?php echo $_smarty_tpl->tpl_vars['cookieDomain']->value;?>
",
                "path": "<?php echo $_smarty_tpl->tpl_vars['cookiePath']->value;?>
"
            },
            "content": {
                "message": "<?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('SYS_COOKIE_DESC');?>
",
                "dismiss": "<?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('SYS_OK');?>
",
                <?php echo $_smarty_tpl->tpl_vars['cookieDataProtectionUrl']->value;?>

                "link": "<?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('SYS_FURTHER_INFORMATIONS');?>
"
            },
            "position": "bottom",
            "theme": "classic",
            "palette": {
                "popup": {
                    "background": "#252e39"
                },
                "button": {
                    "background": "#409099"
                }
            }
        });
    });
<?php echo '</script'; ?>
>
<?php }
}
