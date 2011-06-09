<div class="<?php echo $this->params['controller']; ?> index">
<?php 
    echo $this->element('tablegrid', array(
            "fields" => array(
                "name" => array(
                    'title' => __('Name', true),
                    'sortable' => true
                ),
                "username" => array(
                    'title' => __('User Name', true),
                    'sortable' => true
                ),
                "unit_code_id" => array(
                    'title' => __('Unit', true),
                    'sortable' => true
                ),
                "group_id" => array(
                    'title' => __('Group', true),
                    'sortable' => true
                ),
                "active" => array(
                    'title' => __('Active', true),
                    'sortable' => false
                ), 
                "created" => array(
                    'title' => __('Created On', true),
                    'sortable' => false
                ),
                "created_by" => array(
                    'title' => __('Created By', true),
                    'sortable' => false
                )
            ),
            "assoc" => array(
                'unit_code_id' => array(
                    'model' => 'UnitCode',
                    'field' => 'name'
                ),
                'group_id' => array(
                    'model' => 'Group',
                    'field' => 'name'
                ),
                'created_by' => array(
                    'model' => 'CreatedBy',
                    'field' => 'name'
                )
            ),
            "disaplayedAs" => array(
                'created' => 'datetime'
            ),
            "replacement" => array(
                'active' => array(
                    0 => array(
                        'replaced' => '<strong class="red">' . __('No', true) . '</strong>'
                    ),
                    1 => array(
                        'replaced' => '<strong class="green">' . __('Yes', true) . '</strong>'
                    )
                ),
                'created_by' => array(
                    '-' => array(
                        'replaced' => '<strong class="red">' . __('System', true) . '</strong>'
                    )
                )
            ),
            "editable"  => 'name'
    ));
?>
</div>
