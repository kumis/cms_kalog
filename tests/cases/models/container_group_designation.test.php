<?php
/* ContainerGroupDesignation Test cases generated on: 2011-05-31 23:16:49 : 1306858609*/
App::import('Model', 'ContainerGroupDesignation');

class ContainerGroupDesignationTestCase extends CakeTestCase {
	var $fixtures = array('app.container_group_designation', 'app.container_group', 'app.container_group_type');

	function startTest() {
		$this->ContainerGroupDesignation =& ClassRegistry::init('ContainerGroupDesignation');
	}

	function endTest() {
		unset($this->ContainerGroupDesignation);
		ClassRegistry::flush();
	}

}
?>