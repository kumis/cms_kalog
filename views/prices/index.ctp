<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array(
            "fields" => array(
                "price_desc" => array(
                    'title' => 'Description',
                    'sortable' => true
                ),
                "price_first_hour" => array(
                    'title' => 'In',
                    'sortable' => true
                ),
                "price_per_hour" => array(
                    'title' => 'Every Hour',
                    'sortable' => false
                ),
                "price_max" => array(
                    'title' => 'Maximal',
                    'sortable' => false
                ),
               
                /*
                "parent_id" => array(
                    'title' => 'Panel Induk',
                    'sortable' => false
                )*/
            ),
            "editable"  => "price_desc",
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
            /*
            "assoc" => array(
                "vehicle_id" => array(
                    'model' => 'VehicleCategory',
                    'field' => 'name'
                ),
                "relay_id" => array(
                    'model' => 'Relay',
                    'field' => 'name'
                ),
                "parent_id" => array(
                    'model' => 'Parent',
                    'field' => 'name'
                )
            ),*/

        ));
?>
</div>
