<?php
$gridId = 'trucks';
$url = Router::url(array(
	'controller' => 'trucks',
	'action' => 'truck_list',
	'ext' => 'json',
	)
);

echo $jqgrid->grid($gridId,array(
	'modelName' => 'Trucks', 
	'exportToExcel' => true, 
	'filterToolbar' => true,
	'filterMode' => 'like',
	'exportOptions' => array(
		'type' => 'csv',
		'filename' => 'trucks.csv',
		)
	)
);

echo $jqgrid->script($gridId, array(
	'width' => 600,
	'url' => $url,
	'colModel' => array(
			array(
				'width' => 50,
				'index' => 'Truck.id',
				'name' => 'Truck.id',
				'label' => 'Id',
			),
			array(
				'index' => 'Truck.plate_number',
				'name' => 'Truck.plate_number',
				'label' => 'Plate Number',
			),
			array(
				'index' => 'Driver.first_name',
				'name' => 'Driver.first_name',
				'label' => 'Driver',
			),
			array(
				'index' => 'TruckingCompany.name',
				'name' => 'TruckingCompany.name',
				'label' => 'Trucking Company',
			),
		),
	)
);

?>