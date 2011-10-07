<?php
class ContactPerson extends AppModel {
	var $name = 'ContactPerson';
	var $displayField = 'first_name';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasMany = array(
		'Customer' => array(
			'className' => 'Customer',
			'foreignKey' => 'contact_person_id',
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