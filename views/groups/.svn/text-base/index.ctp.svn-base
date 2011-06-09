<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array(
            "fields" => array(
                "name" => array(
                    'title' => __('Name', true),
                    'sortable' => true
                ),
                "users" => array(
                    'title' => __('Users', true),
                    'sortable' => false
                ),
                "permissions" => array(
                    'title' => __('Permission', true),
                    'sortable' => false
                )
            ),
            "editable"  => "name",
            "replacement" => array(
                "permissions" => array(
                    '' => array(
                        'parse' => '<span class="permissions" rel="%s">Loading...</span>',
                        'model' => 'Group',
                        'field' => 'id'
                    )
                )
            ),
            "if" => array(
                'users' => array(
                    'operator' => 'hasManyImplode',
                    'model' => 'User',
                    'field' => 'name',
                    'separator' => ', ',
                    'link' => array(
                        'controller' => 'users',
                        'action' => 'edit',
                        'params' => array(
                            'field' => 'id'
                        )
                    )
                )
            )
        ));
?>
</div>
