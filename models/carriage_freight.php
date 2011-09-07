<?php
class CarriageFreight extends AppModel {

	var $name = 'CarriageFreight';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'Carriage' => array(
			'className' => 'Carriage',
			'foreignKey' => 'carriage_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Freight' => array(
			'className' => 'Freight',
			'foreignKey' => 'freight_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

}
?>