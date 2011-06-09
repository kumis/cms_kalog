<div class="<?=$this->params['controller']?> <?=$html->action?>">
<?php echo $form->create('Menu', array('action' => 'edit'));?>
	<fieldset>
 		<legend><?php __('Add Menu');?></legend>
        <table class="input">
            <tr>
                <td class="label-required"><?php echo __('Name', true);?></td>
                <td><?php echo $form->input('name', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Parent Menu', true);?></td>
                <td><?php echo $this->element('menu.select', array('cache' => '+1 day', $this->data['Menu']['id'] => $this->data['Menu']['parent_id']) );?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Menu Type', true);?></td>
                <td><?php echo $this->element('menu.select.type', array('cache' => '+1 day', $this->data['MenuType']['id'] => $this->data['MenuType']['id']) );?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('URL', true);?></td>
                <td><?php echo $form->input('url', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Element Id', true);?></td>
                <td><?php
                    echo $form->input('element_id', array(
                        'div'=>false, 'label'=>false, 'class'=>'required', 'type' => 'text'
                    ));
                ?>
                </td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Enable', true);?></td>
                <td><?php echo $form->input('enable', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td colspan="2">
                <?php
                    echo $form->submit('Update', array('div'=>false)) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Delete', true), array('action'=>'delete', $this->data['Menu']['id']), array('class'=>'del'), sprintf(__('Are you sure you want to delete', true) . '%s?', $this->data['Menu']['name'])) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Back', true), array('action'=>'index'), array('class'=>'back'));
                ?>
                </td>
            </tr>
        </table>
	</fieldset>
</form>	
</div>
