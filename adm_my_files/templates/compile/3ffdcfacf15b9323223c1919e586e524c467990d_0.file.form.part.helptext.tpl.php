<?php
/* Smarty version 4.3.1, created on 2023-10-11 12:42:27
  from 'C:\wamp\www\admidio\adm_program\installation\templates\sys-template-parts\parts\form.part.helptext.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_65267c134cdb03_28240486',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3ffdcfacf15b9323223c1919e586e524c467990d' => 
    array (
      0 => 'C:\\wamp\\www\\admidio\\adm_program\\installation\\templates\\sys-template-parts\\parts\\form.part.helptext.tpl',
      1 => 1697020751,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65267c134cdb03_28240486 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['helpTextIdInline']->value) {?>
    <?php if (is_array($_smarty_tpl->tpl_vars['helpTextIdInline']->value)) {?>
        <?php $_smarty_tpl->_assignInScope('helpTextIdInline', $_smarty_tpl->tpl_vars['l10n']->value->get($_smarty_tpl->tpl_vars['helpTextIdInline']->value[0],$_smarty_tpl->tpl_vars['helpTextIdInline']->value[1]));?>
    <?php } else { ?>
        <?php if (Language::isTranslationStringId($_smarty_tpl->tpl_vars['helpTextIdInline']->value)) {?>
            <?php $_smarty_tpl->_assignInScope('helpTextIdInline', $_smarty_tpl->tpl_vars['l10n']->value->get($_smarty_tpl->tpl_vars['helpTextIdInline']->value));?>
        <?php }?>
    <?php }?>
    <div class="help-block"><?php echo $_smarty_tpl->tpl_vars['helpTextIdInline']->value;?>
</div>
<?php }
}
}
