<?php
$gridId = 'trucks';
$url = Router::url(array(
	'controller' => 'trucks',
	'action' => 'truck_list',
	'ext' => 'json',
	)
);
$editUrl = Router::url(array(
	'controller' => 'trucks',
	'action' => 'jqgrid_edit',
	'ext' => 'json',
	)
);

echo $jqgrid->grid($gridId,array(
	'modelName'     => 'Trucks', 
	'exportToExcel' => true, 
	'filterToolbar' => true,
	'filterMode'    => 'like',
	'exportOptions' => array(
		'type'          => 'csv',
		'filename'      => 'trucks.csv',
		)
	)
);

echo $jqgrid->script($gridId, array(
	'width'     => 600,
	'url'       => $url,
    'editurl'   =>$editUrl,
	'colModel'  => array(
			array(
				'width'         => 50,
				'index'         => 'Truck.id',
				'name'          => 'data[Truck][id]',
				'label'         => 'Id',
			),
			array(
				'width'         => 50,
				'index'         => 'Truck.id',
				'name'          => 'data[Truck][id]',
				'label'         => 'Id',
                'hidden'        => true,
                'editable'      => true,                
			),
			array(
				'index'         => 'Truck.plate_number',
				'name'          => 'data[Truck][plate_number]',
				'label'         => 'Plate Number',
                'editable'      => true,
                'editoptions'   => array(
                        'size'          => 10
                    )
			),
			array(
				'index'         => 'Driver.id',
				'name'          => 'data[Driver][id]',
				'label'         => 'Driver',
                'hidden'        => true,
                'editable'      => true,
                'editoptions'   => array(
                        'size'          => 10
                    )
			),
			array(
				'index'         => 'Driver.first_name',
				'name'          => 'data[Driver][first_name]',
				'label'         => 'Driver',
                'editable'      => true,
                'editoptions'   => array(
                        'size'          => 10
                    )
			),
			array(
				'index'         => 'TruckingCompany.id',
				'name'          => 'data[TruckingCompany][id]',
                'hidden'        => true,
				'label'         => 'Trucking Company',
                'editable'      => true,
                'editoptions'   => array(
                        'size'          => 10
                    )
			),
			array(
				'index'         => 'TruckingCompany.name',
				'name'          => 'data[TruckingCompany][name]',
				'label'         => 'Trucking Company',
                'editable'      => true,
                'editoptions'   => array(
                        'size'          => 10
                    )
			),
		),
	),
    array (
        'o' => array(
				'add'       => true,
				'edit'      => true,
				'del'       => true,
				'search'    => true,
				),
			'pEdit'     => true,
			'pAdd'      => true,
			'pDel'      => true,
			'pSearch'   => array(
				'multipleSearch'    => true,
				),
			'pView'     => null
    )
);

?>