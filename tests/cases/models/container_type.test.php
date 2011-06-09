<?php
/* ContainerType Test cases generated on: 2011-05-31 23:28:47 : 1306859327*/
App::import('Model', 'ContainerType');

class ContainerTypeTestCase extends CakeTestCase {
	var $fixtures = array('app.container_type', 'app.container_length', 'app.container_heights_container_widths', 'app.container_group_type');

	function startTest() {
		$this->ContainerType =& ClassRegistry::init('ContainerType');
	}

	function endTest() {
		unset($this->ContainerType);
		ClassRegistry::flush();
	}

}
?>