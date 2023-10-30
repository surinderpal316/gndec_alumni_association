<?php
/* Smarty version 4.3.1, created on 2023-10-11 16:48:14
  from 'C:\wamp\www\admidio\adm_themes\simple\templates\message.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_65268476e68ac9_36518781',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f1e981f19519d3e84f2cddec494653c5cdc72a68' => 
    array (
      0 => 'C:\\wamp\\www\\admidio\\adm_themes\\simple\\templates\\message.tpl',
      1 => 1697020750,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65268476e68ac9_36518781 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div class="message">
    <p class="lead"><?php echo $_smarty_tpl->tpl_vars['message']->value;?>
</p>

    <?php if ($_smarty_tpl->tpl_vars['forwardUrl']->value != '') {?>
        <?php if ($_smarty_tpl->tpl_vars['showYesNoButtons']->value) {?>
            <button id="admButtonYes" class="btn btn-primary" type="button" onclick="self.location.href='<?php echo $_smarty_tpl->tpl_vars['forwardUrl']->value;?>
'">
                <i class="fas fa-check-circle"></i>
                &nbsp;&nbsp;<?php echo $_smarty_tpl->tpl_vars['l10n']->value->get("SYS_YES");?>
&nbsp;&nbsp;&nbsp;
            </button>
            <button id="admButtonNo" class="btn btn-secondary" type="button" onclick="history.back()">
                <i class="fas fa-minus-circle"></i>
                &nbsp;<?php echo $_smarty_tpl->tpl_vars['l10n']->value->get("SYS_NO");?>

            </button>
        <?php } else { ?>
                        <button class="btn btn-primary admidio-margin-bottom" onclick="self.location.href='<?php echo $_smarty_tpl->tpl_vars['forwardUrl']->value;?>
'"><?php echo $_smarty_tpl->tpl_vars['l10n']->value->get("SYS_NEXT");?>

                <i class="fas fa-arrow-circle-right"></i>
            </button>
        <?php }?>
    <?php } else { ?>
                <button class="btn btn-primary admidio-margin-bottom" onclick="history.back()">
            <i class="fas fa-arrow-circle-left"></i>
            <?php echo $_smarty_tpl->tpl_vars['l10n']->value->get("SYS_BACK");?>

        </button>
    <?php }?>
</div>
<?php }
}
