<?php
class PacketsService extends AppModel {
	var $name = 'PacketsService';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'Packet' => array(
			'className' => 'Packet',
			'foreignKey' => 'packet_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Service' => array(
			'className' => 'Service',
			'foreignKey' => 'service_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
