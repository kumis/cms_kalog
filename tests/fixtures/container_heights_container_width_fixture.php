<?php
/* ContainerHeightsContainerWidth Fixture generated on: 2011-05-31 23:27:09 : 1306859229 */
class ContainerHeightsContainerWidthFixture extends CakeTestFixture {
	var $name = 'ContainerHeightsContainerWidth';

	var $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'code' => array('type' => 'string', 'null' => true, 'length' => 1),
		'container_height_id' => array('type' => 'integer', 'null' => true),
		'container_width_id' => array('type' => 'integer', 'null' => true),
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
			'container_height_id' => 1,
			'container_width_id' => 1,
			'created' => '2011-05-31 23:27:09',
			'created_by' => 1,
			'modified' => '2011-05-31 23:27:09',
			'modified_by' => 1
		),
	);
}
?>