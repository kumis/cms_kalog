<?php
class Order extends AppModel {
	var $name = 'Order';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'Debtor' => array(
			'className' => 'Customer',
			'foreignKey' => 'debtor',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Creditor' => array(
			'className' => 'Customer',
			'foreignKey' => 'creditor',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
    );

	var $hasAndBelongsToMany = array(
		'Packet' => array(
			'className' => 'Packet',
			'joinTable' => 'orders_packets',
			'foreignKey' => 'order_id',
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
		)
	);

}
?>
