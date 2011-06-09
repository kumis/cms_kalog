<?php
/* ContainerGroup Test cases generated on: 2011-05-31 23:06:29 : 1306857989*/
App::import('Model', 'ContainerGroup');

class ContainerGroupTestCase extends CakeTestCase {
	var $fixtures = array('app.container_group', 'app.container_group_designation');

	function startTest() {
		$this->ContainerGroup =& ClassRegistry::init('ContainerGroup');
	}

	function endTest() {
		unset($this->ContainerGroup);
		ClassRegistry::flush();
	}

}
?>