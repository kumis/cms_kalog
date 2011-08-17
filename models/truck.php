<?php
class Truck extends AppModel {
	var $name = 'Truck';
	var $displayField = 'plate_number';
    var $actsAs = array('Containable');
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'Driver' => array(
			'className' => 'Driver',
			'foreignKey' => 'driver_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'TruckingCompany' => array(
			'className' => 'TruckingCompany',
			'foreignKey' => 'trucking_company_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
?>