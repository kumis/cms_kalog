<?php $javascript->link('groups', false);?>
<div class="<?=$this->params['controller']?> <?=$html->action?>">
<?php echo $form->create('Group');?>
	<fieldset>
 		<legend><?php __('Edit Group');?></legend>
        <table class="input">
            <tr>
                <td class="label-required"><?php echo __('Name', true);?></td>
                <td><?php echo $form->input('name', array('div'=>false, 'label'=>false, 'class'=>'required'));?></td>
            </tr>
            <tr>
                <td colspan="2" class="parentLabel">
                <?php echo $form->input('checkall_modules', array('id' => 'checkall_modules', 'div' => false, 'label' => false, 'type'=>'checkbox'));?>
                <?php echo __("Set group permission", true);?> :
                
                </td>
            </tr>
            <!-- group and module actions permission -->
            <tr><td colspan="2"><div class="gpbc" id="modules">
            <?php foreach ($modules as $module): ?>
                <div class="gpb">
                    <div class="gpbm">
                        <?php echo $form->input('checkall', array(
                                'class' => 'checkall', 'div' => false, 'label' => false,
                                'type'=>'checkbox', 'rel' => $module['Module']['controller'],
                                'checked' => isset($module['Module']['checked']) ? $module['Module']['checked'] : ''
                              ));
                        ?>
                        <?php echo $module['Module']['name'];?>
                    </div>
                    <ul class="gpba">
                    <?php foreach ($module['ModuleAction'] as $action): ?>
                        <li>
                        <span class="gpba-label"><?php echo $action['name'];?></span>
                        <span class="gpba-val">
                        <?php echo $form->input('GroupModuleAction.' . $action['id'], array(
                                'div' => false, 'label' => false, 'type' => 'checkbox', 
                                'class'=>'cb ' . $module['Module']['controller'],
                                'checked' => isset($action['checked']) ? $action['checked'] : ''
                            ));
                        ?>
                        </span>
                        </li>
                    <?php endforeach;?>
                    </ul>
                </div>
            <?php endforeach;?>
            <br class="clear" />
            </div></td></tr>
            <tr>
                <td colspan="2" class="parentLabel">
                <?php echo $form->input('checkall_menus', array('id' => 'checkall_menus', 'div' => false, 'label' => false, 'type'=>'checkbox'));?>
                <?php echo __("Set group menu visibility", true);?> :
                
                </td>
            </tr>
            <!-- group and menu permission -->
            <tr><td colspan="2"><div class="gpbc" id="menus">
            <?php foreach ($menus as $menu): ?>
                <div class="gpb">
                    <div class="gpbm">
                        <?php echo $form->input('checkall', array(
                                'class' => 'checkall', 'div' => false, 'label' => false,
                                'type'=>'checkbox', 'rel' => $menu['MenuType']['call_name'],
                                'checked' => isset($menu['MenuType']['checked']) ? $menu['MenuType']['checked'] : ''
                              ));
                        ?>
                        <?php echo $menu['MenuType']['name'];?>
                    </div>
                    <ul class="gpba">
                    <?php foreach ($menu['Menu'] as $m): ?>
                        <li>
                        <span class="gpba-label"><?php echo $m['name'];?></span>
                        <span class="gpba-val">
                        <?php echo $form->input('GroupMenu.' . $m['id'], array(
                                'div' => false, 'label' => false, 'type' => 'checkbox', 
                                'class'=>'cb ' . $menu['MenuType']['call_name'],
                                'checked' => isset($m['checked']) ? $m['checked'] : ''
                            ));
                        ?>
                        </span>
                        </li>
                    <?php endforeach;?>
                    </ul>
                </div>
            <?php endforeach;?>
            <br class="clear" />
            </div></td></tr>
            <tr>
                <td colspan="2">
                <?php
                    echo $form->submit('Update', array('div'=>false)) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Delete', true), array('action'=>'delete', $this->data['Group']['id']), array('class'=>'del'), sprintf(__('Are you sure you want to delete', true) . ' %s?', $this->data['Group']['name'])) . "&nbsp;" . __('or', true) . "&nbsp;";
                    echo $html->link(__('Back', true), array('action'=>'index'), array('class'=>'back'));
                ?>
                </td>
            </tr>
        </table>
	</fieldset>
</form>	
</div>
