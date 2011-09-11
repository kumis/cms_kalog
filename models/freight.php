<?php
class Freight extends AppModel {

	var $name = 'Freight';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'Schedule' => array(
			'className' => 'Schedule',
			'foreignKey' => 'schedule_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Locomotive' => array(
			'className' => 'Locomotive',
			'foreignKey' => 'locomotive_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

}
?>