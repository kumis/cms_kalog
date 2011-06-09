<?php
/* ContainerHeight Test cases generated on: 2011-05-31 23:24:01 : 1306859041*/
App::import('Model', 'ContainerHeight');

class ContainerHeightTestCase extends CakeTestCase {
	var $fixtures = array('app.container_height', 'app.container_heights_container_widths');

	function startTest() {
		$this->ContainerHeight =& ClassRegistry::init('ContainerHeight');
	}

	function endTest() {
		unset($this->ContainerHeight);
		ClassRegistry::flush();
	}

}
?>