<div class="<?=$this->params['controller']?> <?=$html->action?>">
<?php echo $form->create('Menu');?>
	<fieldset>
 		<legend><?php __('Add Menu');?></legend>
        <table class="input">
            <tr>
                <td class="label-required"><?php echo __('Name', true);?></td>
                <td><?php echo $form->input('name', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Parent Menu', true);?></td>
                <td><?php echo $this->element('menu.select');?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Menu Type', true);?></td>
                <td><?php echo $this->element('menu.select.type');?></td>
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
                    echo $form->submit('Add', array('div'=>false)) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Back', true), array('action'=>'index'), array('class'=>'back'));
                ?>
                </td>
            </tr>
        </table>
	</fieldset>
</form>	
</div>
