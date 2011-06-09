<?php
class ContainerHeight extends AppModel {
	var $name = 'ContainerHeight';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasMany = array(
		'ContainerHeightsContainerWidths' => array(
			'className' => 'ContainerHeightsContainerWidths',
			'foreignKey' => 'container_height_id',
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