<?php
class License extends AppModel {
	var $name = 'License';
	var $displayField = 'code';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'LicenseType' => array(
			'className' => 'LicenseType',
			'foreignKey' => 'license_type_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
?>