<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array(
            "fields" => array(
                "name" => array(
                    'title' => __('Name', true),
                    'sortable' => true
                ),
                "call_name" => array(
                    'title' => __('Call Name', true),
                    'sortable' => false
                )
            ),
            "editable"  => "name"
        ));
?>
</div>
