<?php
class ContainerTypesOrdersContainer extends AppModel {
	var $name = 'ContainerTypesOrdersContainer';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'Container' => array(
			'className' => 'Container',
			'foreignKey' => 'container_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'ContainerTypesOrder' => array(
			'className' => 'ContainerTypesOrder',
			'foreignKey' => 'container_types_order_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
?>