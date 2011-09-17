<?php
class Row extends AppModel {
	var $name = 'Row';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasMany = array(
		'Coordinate' => array(
			'className' => 'Coordinate',
			'foreignKey' => 'row_id',
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
