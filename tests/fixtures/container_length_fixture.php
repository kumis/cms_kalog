<?php
/* ContainerLength Fixture generated on: 2011-05-31 23:27:58 : 1306859278 */
class ContainerLengthFixture extends CakeTestFixture {
	var $name = 'ContainerLength';

	var $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'code' => array('type' => 'string', 'null' => true, 'length' => 1),
		'millimeter' => array('type' => 'integer', 'null' => true),
		'feet' => array('type' => 'integer', 'null' => true),
		'inch' => array('type' => 'integer', 'null' => true),
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
			'code' => 'Lorem ipsum dolor sit ame',
			'millimeter' => 1,
			'feet' => 1,
			'inch' => 1,
			'created' => '2011-05-31 23:27:58',
			'created_by' => 1,
			'modified' => '2011-05-31 23:27:58',
			'modified_by' => 1
		),
	);
}
?>