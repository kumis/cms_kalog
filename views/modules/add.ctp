<div class="<?=$this->params['controller']?> <?=$html->action?>">
<?php echo $form->create('Module');?>
	<fieldset>
 		<legend><?php __('Add Module');?></legend>
        <table class="input">
            <tr>
                <td class="label-required"><?php echo __('Name', true);?></td>
                <td><?php echo $form->input('name', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Controller', true);?></td>
                <td><?php echo $form->input('controller', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Actions', true);?></td>
                <td>
                    <?php 
                        echo $form->input('actions', array('div'=>false, 'label'=>false, 'class'=>'required'));
                    ?><br />
                    <span class="label"><?php echo __('seperate actions with space', true);?></span>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span class="label">
                        <?php echo __('Show records created by every user', true);?>
                    </span>
                    <?php echo $form->input('show_all', array('div'=>false, 'checked' => true, 'label'=>false, 'class'=>'required'));?>
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