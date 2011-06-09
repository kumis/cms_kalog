<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array(
            "fields" => array(
                "code" => array(
                    'title' => __('Code', true),
                    'sortable' => true
                ),
                "name" => array(
                    'title' => __('Name', true),
                    'sortable' => false
                ),
                "price_reg_start" => array(
                    'title' => 'Regular First in',
                    'sortable' => false
				),
				"price_reg_hour" => array(
                    'title' => 'Regular Hour',
                    'sortable' => false
				),
				"price_reg_max" => array(
                    'title' => 'Regular Max Price',
                    'sortable' => false
				),
				"price_mbr_start"=> array(
                    'title' => 'Member Start',
                    'sortable' => false
				),
				"price_mbr_hour"=> array(
                    'title' => 'Member Hour',
                    'sortable' => false
				),
				"price_mbr_max"=> array(
                    'title' => 'Member Price Max',
                    'sortable' => false
				),
			),
            "editable"  => "code",
            /*
            "assoc" => array(
                "price_desc" => array(
                    'model' => 'Price',
                    'field' => 'price_desc'
                ),
                "price_in" => array(
                    'model' => 'Price',
                    'field' => 'price_first_hour'
                ),
                "price_hour" => array(
                    'model' => 'Price',
                    'field' => 'price_per_hour'
                ),
                "price_max" => array(
                    'model' => 'Price',
                    'field' => 'price_max'
                ),
            )**/
        ));
?>
</div>
