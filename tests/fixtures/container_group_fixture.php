<?php
/* ContainerGroup Fixture generated on: 2011-05-31 23:06:29 : 1306857989 */
class ContainerGroupFixture extends CakeTestFixture {
	var $name = 'ContainerGroup';

	var $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'code' => array('type' => 'string', 'null' => true, 'length' => 2),
		'description' => array('type' => 'string', 'null' => true, 'length' => 60),
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
			'created' => '2011-05-31 23:06:29',
			'created_by' => 1,
			'modified' => '2011-05-31 23:06:29',
			'modified_by' => 1
		),
	);
}
?>