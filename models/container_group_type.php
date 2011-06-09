<?php
class ContainerGroupType extends AppModel {
	var $name = 'ContainerGroupType';
	var $displayField = 'code';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'ContainerGroupDesignation' => array(
			'className' => 'ContainerGroupDesignation',
			'foreignKey' => 'container_group_designation_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

	var $hasMany = array(
		'ContainerType' => array(
			'className' => 'ContainerType',
			'foreignKey' => 'container_group_type_id',
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