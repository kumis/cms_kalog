<?php echo $javascript->codeBlock($ajaxURL);?>
<div class="<?=$this->params['controller']?> <?=$html->action?>">
<?php echo $form->create('User');?>
	<fieldset>
 		<legend><?php __('Edit User');?></legend>
        <table class="input">
            <tr>
                <td class="label-required"><?php echo __('Name', true);?></td>
                <td><?php echo $form->input('name', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('User Name', true);?></td>
                <td><?php echo $form->input('username', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Unit', true);?></td>
                <td>
                    <?php
                    echo $form->select('unit_code_id', $unit_codes, null, null, true);
                    echo ($form->isFieldError('unit_code_id')) ? $form->error('unit_code_id') : '';
                    ?>
                </td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Group', true);?></td>
                <td>
                    <?php
                    echo $form->select('group_id', $groups, null, null, false);
                    echo ($form->isFieldError('group_id')) ? $form->error('group_id') : '';
                    ?>
                </td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Password', true);?></td>
                <td><?php echo $form->input('password_real', array('div'=>false, 'label'=>false, 'class'=>'required', 'type' => 'text'));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Retype password here', true);?></td>
                <td><?php echo $form->input('password_confirm', array('div'=>false, 'label'=>false, 'class'=>'required', 'type' => 'text', 'value' => $this->data['User']['password_real']));?></td>
            </tr>
            <tr>
                <td class="label-required"><?php echo __('Email', true);?></td>
                <td><?php echo $form->input('email', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td><?php echo __('Gender', true);?></span>
                <td>
                    <?php
                        $option_gender = array(
                            "" => "- Select one -",
                            "P" => __("Female", true), 
                            "L" => __("Male", true)
                        );
                        echo $form->select("sex", $option_gender, null, array("class" => "inputText"), false);
                        echo ($form->isFieldError('sex')) ? $form->error('sex') : '';
                    ?>
                </td>
            </tr>
            <tr>
                <td><?php echo __("Place Of Birth", true);?></span>
                <td>
                    <?php
                        echo $form->input('pob', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                    ?>
                </td>
            </tr>
            <tr>
                <td><?php echo __("Date Of Birth", true);?></td>
                <td>
                    <?php
                        echo $form->input('dob', array(
                            'div'=>false, 'label'=>false, 'class'=>'inputText',
                            'minYear' => '1960', 'maxYear' => date('Y')-10
                            )
                        );
                    ?>
                </td>
            </tr>
            <tr>
                <td><?php echo __("Home Address", true);?></td>
                <td>
                    <?php
                        echo $form->input('address1', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));		
                    ?>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <?php
                        echo $form->input('address2', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));		
                    ?>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <?php
                        echo $form->input('address3', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));		
                    ?>
                </td>
            </tr>
            <tr>
                <td><?php echo __("Zip Code", true);?></span>
                <td>
                    <?php
                        echo $form->input('zipcode', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                    ?>
                </td>
            </tr>
            
            <tr>
                <td><?php echo __("Province", true);?></td>
                <td>
                <?php
                    $option_provinces[''] = '- Select One -';
                    foreach($provinces as $province){
                        $option_provinces[$province['Province']['id']] = $province['Province']['name'];
                    }

                    echo $form->select('province_id', $option_provinces, null, array(
                        'class' => 'inputText ajax_select', 
                        'rel' => '#UserCityId', 'ref' => 'province_id'
                    ), false);
                    echo ($form->isFieldError('province_id')) ? $form->error('province_id') : '';
                ?>
                </td>
            </tr>
            <tr>
                <td><?php echo __("City", true);?></td>
                <td>
                <?php
                    $option_city[''] = __('Select Province first', true);
                    echo $form->select('city_id', $option_city, null, array(
                        'class' => 'inputText',
                        'model' => 'City', 'field' => 'name'
                    ), false);
                    echo ($form->isFieldError('city_id')) ? $form->error('city_id') : '';
                ?>
                </td>
            </tr>
            
            <tr>
                <td><?php echo __("Handphone", true);?></td>
                <td>
                <?php
                    echo $form->input('handphone', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
                </td>
            </tr>
            <tr>
                <td><?php echo __("Homephone", true);?></td>
                <td>
                    <?php
                        echo $form->input('homephone', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                    ?>
                </td>
            </tr>
            <tr>
                <td><?php echo __("Active", true);?></td>
                <td>
                    <?php
                        echo $form->input('active', array('div'=>false, 'label'=>false));		
                    ?>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                <?php
                    echo $form->submit('Update', array('div'=>false)) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Delete', true), array('action'=>'delete', $this->data['User']['id']), array('class'=>'del'), sprintf(__('Are you sure you want to delete', true) . ' %s?', $this->data['User']['name'])) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Back', true), array('action'=>'index'), array('class'=>'back'));
                ?>
                </td>
            </tr>
        </table>
	</fieldset>
</form>	
</div>