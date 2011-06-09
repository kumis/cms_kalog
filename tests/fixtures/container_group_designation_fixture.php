<?php
/* ContainerGroupDesignation Fixture generated on: 2011-05-31 23:16:49 : 1306858609 */
class ContainerGroupDesignationFixture extends CakeTestFixture {
	var $name = 'ContainerGroupDesignation';

	var $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'code' => array('type' => 'string', 'null' => true, 'length' => 2),
		'description' => array('type' => 'string', 'null' => true, 'length' => 60),
		'container_group_id' => array('type' => 'integer', 'null' => true),
		'created' => array('type' => 'datetime', 'null' => true),
		'created_by' => array('type' => 'integer', 'null' => true),
		'modified' => array('type' => 'datetime', 'null' => true),
		'modified_by' => array('type' => 'integer', 'null' => true),
		'indexes' => array('PRIMARY' => array('unique' => true, 'column' => 'id')),
		'tableParameters' => array()
	);

	var $records = array(
		array(
			'id' => 1,
			'code' => '',
			'description' => 'Lorem ipsum dolor sit amet',
			'container_group_id' => 1,
			'created' => '2011-05-31 23:16:49',
			'created_by' => 1,
			'modified' => '2011-05-31 23:16:49',
			'modified_by' => 1
		),
	);
}
?>