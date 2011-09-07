<?php
class LicenseType extends AppModel {
	var $name = 'LicenseType';
	var $displayField = 'name';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $hasMany = array(
		'License' => array(
			'className' => 'License',
			'foreignKey' => 'license_type_id',
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