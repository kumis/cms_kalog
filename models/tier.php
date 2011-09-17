<?php
class Tier extends AppModel {
	var $name = 'Tier';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasMany = array(
		'Coordinate' => array(
			'className' => 'Coordinate',
			'foreignKey' => 'tier_id',
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
