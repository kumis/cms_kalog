<div class="<?=$this->params['controller']?> <?=$html->action?>">
<?php echo $form->create('City');?>
	<fieldset>
 		<legend><?php __('Edit City');?></legend>
        <table class="input">
            <tr>
                <td class="label-required"><?php echo __('Province', true);?></td>
                <td><?php echo $form->select('province_id', $provinces, null, array('div'=>false, 'label'=>false, 'class'=>'required'), false);?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Name', true);?></td>
                <td><?php echo $form->input('name', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Other Name', true);?></td>
                <td><?php echo $form->input('other_name', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td colspan="2">
                <?php
                    echo $form->submit(__('Update', true), array('div'=>false)) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Delete', true), array('action'=>'delete', $this->data['City']['id']), array('class'=>'del'), sprintf(__('Are you sure you want to delete', true) . ' %s?', $this->data['City']['name'])) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Back', true), array('action'=>'index'), array('class'=>'back'));
                ?>
                </td>
            </tr>
        </table>
	</fieldset>
</form>
</div>
