<div class="<?=$this->params['controller']?> <?=$html->action?>">
<?php echo $form->create('Member');?>
	<fieldset>
 		<legend><?php __('Add Member');?></legend>
        <table class="input">
            <tr>
                <td class="label-required"><?php echo __('code', true);?></td>
                <td><?php echo $form->input('code', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Name', true);?></td>
                <td><?php echo $form->input('name', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Plat NO', true);?></td>
                <td><?php echo $form->input('stnk_no', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>                  
            <tr>
                <td class="label-required"><?php echo __('Price Type', true);?></td>
                <td>
                <?php 
                    echo $form->select('price_id', $prices, null, array(
                        'div'=>false, 'label'=>false, 'class'=>'required'
                        ));
                    echo ($form->isFieldError('price_id')) ? $form->error('price_id') : '';
                ?>
                </td>
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
