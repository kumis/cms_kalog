<?php
class ContainerLength extends AppModel {
	var $name = 'ContainerLength';
	var $displayField = 'code';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasMany = array(
		'ContainerType' => array(
			'className' => 'ContainerType',
			'foreignKey' => 'container_length_id',
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