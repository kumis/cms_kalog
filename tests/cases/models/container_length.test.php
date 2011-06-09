<?php
/* ContainerLength Test cases generated on: 2011-05-31 23:27:58 : 1306859278*/
App::import('Model', 'ContainerLength');

class ContainerLengthTestCase extends CakeTestCase {
	var $fixtures = array('app.container_length', 'app.container_type');

	function startTest() {
		$this->ContainerLength =& ClassRegistry::init('ContainerLength');
	}

	function endTest() {
		unset($this->ContainerLength);
		ClassRegistry::flush();
	}

}
?>