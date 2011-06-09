<div class="<?=$this->params['controller']?> <?=$html->action?>">
<?php echo $form->create('VehicleCategory');?>
	<fieldset>
 		<legend><?php __('Add Vehicle Category');?></legend>
        <table class="input">
            <tr>
                <td class="label-required"><?php echo __('Code', true);?></td>
                <td><?php echo $form->input('code', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Name', true);?></td>
                <td><?php echo $form->input('name', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
           <tr>
                <td class="label-required"><?php echo __('Tarif Masuk Reguler', true);?></td>
                <td><?php echo $form->input('price_reg_start', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Tarif Per Jam Reguler', true);?></td>
                <td><?php echo $form->input('price_reg_hour', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Tarif Max Reguler', true);?></td>
                <td><?php echo $form->input('price_reg_max', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Tarif Masuk Member', true);?></td>
                <td><?php echo $form->input('price_mbr_start', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Tarif Per Jam Memberer', true);?></td>
                <td><?php echo $form->input('price_mbr_hour', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Tarif Max Member', true);?></td>
                <td><?php echo $form->input('price_mbr_max', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
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
