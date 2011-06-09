<?php
/* ContainerGroupType Test cases generated on: 2011-06-02 09:37:06 : 1306982226*/
App::import('Model', 'ContainerGroupType');

class ContainerGroupTypeTestCase extends CakeTestCase {
	var $fixtures = array('app.container_group_type', 'app.container_group_designation', 'app.container_group', 'app.container_type', 'app.container_length', 'app.container_heights_container_widths');

	function startTest() {
		$this->ContainerGroupType =& ClassRegistry::init('ContainerGroupType');
	}

	function endTest() {
		unset($this->ContainerGroupType);
		ClassRegistry::flush();
	}

}
?>