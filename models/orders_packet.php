<?php
class OrdersPacket extends AppModel {
	var $name = 'OrdersPacket';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'Order' => array(
			'className' => 'Order',
			'foreignKey' => 'order_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Packet' => array(
			'className' => 'Packet',
			'foreignKey' => 'packet_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
?>