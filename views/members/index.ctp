<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array(
            "fields" => array(
                "code" => array(
                    'title' => 'Code',
                    'sortable' => true
                ),
                "name" => array(
                    'title' => 'Name',
                    'sortable' => true
                ),
                "price_id" => array(
                    'title' => 'Price Type',
                    'sortable' => false
                ),
                "stnk_no" => array(
                    'title' => 'Plat No',
                    'sortable' => false
                ),
                /*
                "vehicle_id" => array(
                    'title' => 'Vehicle',
                    'sortable' => false
                ),
                
                "parent_id" => array(
                    'title' => 'Panel Induk',
                    'sortable' => false
                )*/
            ),
            "editable"  => "code",
            /*
            'filter' => array(
                array(
                    'subdistrict_id' => array(
                        'label' => 'Kelurahan',
                        'options' => $subdistricts
                    ),
                    'street_id' => array(
                        'label' => 'Nama jalan',
                        'options' => $streets
                    ),
                    'relay_id' => array(
                        'label' => 'Gardu',
                        'options' => $relays
                    ),
                    'type' => array(
                        'label' => 'Tipe',
                        'options' => $types
                    )
                ),
                'name' => 'Nama panel'
            ),
            'filter_max_col' => 4,
            'filter_title' => 'Pencarian nama panel',*/
            "assoc" => array(
                "price_id" => array(
                    'model' => 'Price',
                    'field' => 'price_desc'
                ),/*
                "relay_id" => array(
                    'model' => 'Relay',
                    'field' => 'name'
                ),
                "parent_id" => array(
                    'model' => 'Parent',
                    'field' => 'name'
                )*/
            ),

        ));
?>
</div>
