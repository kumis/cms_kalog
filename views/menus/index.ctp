<div class="<?php echo $this->params['controller']; ?> index">
<?php 
    echo $this->element('tablegrid', array(
            "fields" => array(
                "name" => array(
                    'title' => __('Name', true),
                    'sortable' => true
                ),
                "url" => array(
                    'title' => __('Url', true),
                    'sortable' => false
                ), 
                "parent_id" => array(
                    'title' => __('Parent Menu', true),
                    'sortable' => false
                ),
                "element_id" => array(
                    'title' => __('Element Id', true),
                    'sortable' => false
                ),
                "order" => array(
                    'title' => __('Order', true),
                    'sortable' => false
                ),
                "enable" => array(
                    'title' => __('Enable', true),
                    'sortable' => false
                ),
                "menu_type_id" => array(
                    'title' => __('Menu Type', true),
                    'sortable' => false
                )
            ),
            "assoc" => array(
                'parent_id' => array(
                    'model' => 'Menu',
                    'field' => 'name'
                ),
                'menu_type_id' => array(
                    'model' => 'MenuType',
                    'field' => 'name'
                )
            ),
            "replacement" => array(
                'enable' => array(
                    0 => array(
                        'replaced' => '<strong class="red">' . __('No', true) . '</strong>'
                    ),
                    1 => array(
                        'replaced' => '<strong class="green">' . __('Yes', true) . '</strong>'
                    )
                )
            ),
            "if" => array(
                'parent_id' => array(
                    'operator' => 'equalToField',
                    'to' => 'name',
                    'replaced' => '/'
                )
            ),
            "editable"  => 'name'
    ));
?>
</div>
