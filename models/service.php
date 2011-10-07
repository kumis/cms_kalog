<?php
class Service extends AppModel {
	var $name = 'Service';
	var $displayField = 'name';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasMany = array(
		'ServiceCharge' => array(
			'className' => 'ServiceCharge',
			'foreignKey' => 'service_id',
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


	var $hasAndBelongsToMany = array(
		'Packet' => array(
			'className' => 'Packet',
			'joinTable' => 'packets_services',
			'foreignKey' => 'service_id',
			'associationForeignKey' => 'packet_id',
			'unique' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
		),
		'Document' => array(
			'className' => 'Document',
			'joinTable' => 'document_services',
			'foreignKey' => 'service_id',
			'associationForeignKey' => 'document_id',
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
