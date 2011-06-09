<div class="<?=$this->params['controller']?> <?=$html->action?>">
<?php echo $form->create('Province');?>
	<fieldset>
 		<legend><?php __('Add Province');?></legend>
        <table class="input">
            <tr>
                <td class="label-required"><?php echo __('Name', true);?></td>
                <td><?php echo $form->input('name', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Code', true);?></td>
                <td><?php echo $form->input('code', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td colspan="2">
                <?php
                    echo $form->submit('Add', array('div'=>false)) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Back', true), array('action'=>'index'), array('class'=>'back'));
                ?>
                </td>
            </tr>
        </table>
	</fieldset>
</form>	
</div>
