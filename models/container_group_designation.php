<?php
class ContainerGroupDesignation extends AppModel {
	var $name = 'ContainerGroupDesignation';
	var $displayField = 'code';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'ContainerGroup' => array(
			'className' => 'ContainerGroup',
			'foreignKey' => 'container_group_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

	var $hasMany = array(
		'ContainerGroupType' => array(
			'className' => 'ContainerGroupType',
			'foreignKey' => 'container_group_designation_id',
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