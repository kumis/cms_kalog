<?php
class Order extends AppModel {
	var $name = 'Order';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'Packets' => array(
			'className' => 'Packet',
			'foreignKey' => 'packet_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
        'Customer' => array(
			'className' => 'Customer',
			'foreignKey' => 'customer_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
	);

	var $hasAndBelongsToMany = array(
		'ContainerType' => array(
			'className' => 'ContainerType',
			'joinTable' => 'container_types_orders',
			'foreignKey' => 'order_id',
			'associationForeignKey' => 'container_type_id',
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
?>
