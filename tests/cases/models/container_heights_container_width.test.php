<?php
/* ContainerHeightsContainerWidth Test cases generated on: 2011-05-31 23:27:09 : 1306859229*/
App::import('Model', 'ContainerHeightsContainerWidth');

class ContainerHeightsContainerWidthTestCase extends CakeTestCase {
	var $fixtures = array('app.container_heights_container_width', 'app.container_height', 'app.container_heights_container_widths', 'app.container_width', 'app.container_type');

	function startTest() {
		$this->ContainerHeightsContainerWidth =& ClassRegistry::init('ContainerHeightsContainerWidth');
	}

	function endTest() {
		unset($this->ContainerHeightsContainerWidth);
		ClassRegistry::flush();
	}

}
?>