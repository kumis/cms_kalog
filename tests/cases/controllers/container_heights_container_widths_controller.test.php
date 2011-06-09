<?php
/* ContainerHeightsContainerWidths Test cases generated on: 2011-06-02 17:04:10 : 1307009050*/
App::import('Controller', 'ContainerHeightsContainerWidths');

class TestContainerHeightsContainerWidthsController extends ContainerHeightsContainerWidthsController {
	var $autoRender = false;

	function redirect($url, $status = null, $exit = true) {
		$this->redirectUrl = $url;
	}
}

class ContainerHeightsContainerWidthsControllerTestCase extends CakeTestCase {
	var $fixtures = array('app.container_heights_container_width', 'app.container_height', 'app.container_heights_container_widths', 'app.container_width', 'app.container_type', 'app.container_length', 'app.container_group_type', 'app.container_group_designation', 'app.container_group');

	function startTest() {
		$this->ContainerHeightsContainerWidths =& new TestContainerHeightsContainerWidthsController();
		$this->ContainerHeightsContainerWidths->constructClasses();
	}

	function endTest() {
		unset($this->ContainerHeightsContainerWidths);
		ClassRegistry::flush();
	}

	function testView() {

	}

}
?>