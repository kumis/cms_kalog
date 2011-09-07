<?php
class ContainerWidth extends AppModel {
	var $name = 'ContainerWidth';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasMany = array(
		'ContainerHeightsContainerWidths' => array(
			'className' => 'ContainerHeightsContainerWidths',
			'foreignKey' => 'container_width_id',
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