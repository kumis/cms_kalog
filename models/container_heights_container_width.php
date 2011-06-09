<?php
class ContainerHeightsContainerWidth extends AppModel {
	var $name = 'ContainerHeightsContainerWidth';
	var $displayField = 'code';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'ContainerHeight' => array(
			'className' => 'ContainerHeight',
			'foreignKey' => 'container_height_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'ContainerWidth' => array(
			'className' => 'ContainerWidth',
			'foreignKey' => 'container_width_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

	var $hasMany = array(
		'ContainerType' => array(
			'className' => 'ContainerType',
			'foreignKey' => 'container_heights_container_widths_id',
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