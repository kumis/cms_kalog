<?php
class ContainerTypesOrder extends AppModel {
	var $name = 'ContainerTypesOrder';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'ContainerType' => array(
			'className' => 'ContainerType',
			'foreignKey' => 'container_type_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Order' => array(
			'className' => 'Order',
			'foreignKey' => 'order_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

	var $hasAndBelongsToMany = array(
		'Container' => array(
			'className' => 'Container',
			'joinTable' => 'container_types_orders_containers',
			'foreignKey' => 'container_types_order_id',
			'associationForeignKey' => 'container_id',
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