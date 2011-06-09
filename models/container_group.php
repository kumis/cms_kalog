<?php
class ContainerGroup extends AppModel {
	var $name = 'ContainerGroup';
	var $displayField = 'code';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasMany = array(
		'ContainerGroupDesignation' => array(
			'className' => 'ContainerGroupDesignation',
			'foreignKey' => 'container_group_id',
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
