<?php
/* ContainerType Fixture generated on: 2011-05-31 23:28:47 : 1306859327 */
class ContainerTypeFixture extends CakeTestFixture {
	var $name = 'ContainerType';

	var $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'container_length_id' => array('type' => 'integer', 'null' => true),
		'container_heights_container_widths_id' => array('type' => 'integer', 'null' => true),
		'container_group_type_id' => array('type' => 'integer', 'null' => true),
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
			'container_length_id' => 1,
			'container_heights_container_widths_id' => 1,
			'container_group_type_id' => 1,
			'created' => '2011-05-31 23:28:47',
			'created_by' => 1,
			'modified' => '2011-05-31 23:28:47',
			'modified_by' => 1
		),
	);
}
?>