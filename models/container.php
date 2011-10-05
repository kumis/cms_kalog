<?php
class Container extends AppModel {
	var $name = 'Container';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'ContainerType' => array(
			'className' => 'ContainerType',
			'foreignKey' => 'container_type_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

	var $hasMany = array(
		'Coordinate' => array(
			'className' => 'Coordinate',
			'foreignKey' => 'container_id',
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
