<?php
class Packet extends AppModel {
	var $name = 'Packet';
	var $displayField = 'name';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasAndBelongsToMany = array(
		'Service' => array(
			'className' => 'Service',
			'joinTable' => 'packets_services',
			'foreignKey' => 'packet_id',
			'associationForeignKey' => 'service_id',
			'unique' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
		)
	);

}
