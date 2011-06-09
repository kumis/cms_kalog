<div class="<?=$this->params['controller']?> <?=$html->action?>">
<?php echo $form->create('Price');?>
	<fieldset>
 		<legend><?php __('Edit Price');?></legend>
        <table class="input">
            <tr>
                <td class="label-required"><?php echo __('Price Description', true);?></td>
                <td><?php echo $form->input('price_desc', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Price First In', true);?></td>
                <td><?php echo $form->input('price_first_hour', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Price Every Hour', true);?></td>
                <td><?php echo $form->input('price_per_hour', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Price Maximal', true);?></td>
                <td><?php echo $form->input('price_max', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>                  

            <tr>
                <td colspan="2">
                <?php
                    echo $form->submit('Update', array('div'=>false)) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Back', true), array('action'=>'index'), array('class'=>'back'));
                ?>
                </td>
            </tr>
        </table>
	</fieldset>
</form>	
</div>
