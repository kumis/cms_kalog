<?php
class TruckingCompany extends AppModel {
	var $name = 'TruckingCompany';
	var $displayField = 'name';
    var $order = array("TruckingCompany.id" => "ASC");
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasMany = array(
		'Truck' => array(
			'className' => 'Truck',
			'foreignKey' => 'trucking_company_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);

}
?>