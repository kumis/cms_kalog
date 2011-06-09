<?php
/* ContainerHeight Fixture generated on: 2011-05-31 23:24:01 : 1306859041 */
class ContainerHeightFixture extends CakeTestFixture {
	var $name = 'ContainerHeight';

	var $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'min_millimeter' => array('type' => 'integer', 'null' => true),
		'max_millimeter' => array('type' => 'integer', 'null' => true),
		'min_feet' => array('type' => 'integer', 'null' => true),
		'max_feet' => array('type' => 'integer', 'null' => true),
		'min_inch' => array('type' => 'integer', 'null' => true),
		'max_inch' => array('type' => 'integer', 'null' => true),
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
			'min_millimeter' => 1,
			'max_millimeter' => 1,
			'min_feet' => 1,
			'max_feet' => 1,
			'min_inch' => 1,
			'max_inch' => 1,
			'created' => '2011-05-31 23:24:01',
			'created_by' => 1,
			'modified' => '2011-05-31 23:24:01',
			'modified_by' => 1
		),
	);
}
?>