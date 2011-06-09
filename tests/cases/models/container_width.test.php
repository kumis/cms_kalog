<?php
/* ContainerWidth Test cases generated on: 2011-05-31 23:22:30 : 1306858950*/
App::import('Model', 'ContainerWidth');

class ContainerWidthTestCase extends CakeTestCase {
	var $fixtures = array('app.container_width', 'app.container_heights_container_widths');

	function startTest() {
		$this->ContainerWidth =& ClassRegistry::init('ContainerWidth');
	}

	function endTest() {
		unset($this->ContainerWidth);
		ClassRegistry::flush();
	}

}
?>