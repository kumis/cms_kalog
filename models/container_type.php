<?php
class ContainerType extends AppModel {
	var $name = 'ContainerType';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'ContainerLength' => array(
			'className' => 'ContainerLength',
			'foreignKey' => 'container_length_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'ContainerHeightsContainerWidths' => array(
			'className' => 'ContainerHeightsContainerWidths',
			'foreignKey' => 'container_heights_container_widths_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'ContainerGroupType' => array(
			'className' => 'ContainerGroupType',
			'foreignKey' => 'container_group_type_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
?>