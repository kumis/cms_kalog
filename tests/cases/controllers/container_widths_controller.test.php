<?php
/* ContainerWidths Test cases generated on: 2011-06-02 17:03:30 : 1307009010*/
App::import('Controller', 'ContainerWidths');

class TestContainerWidthsController extends ContainerWidthsController {
	var $autoRender = false;

	function redirect($url, $status = null, $exit = true) {
		$this->redirectUrl = $url;
	}
}

class ContainerWidthsControllerTestCase extends CakeTestCase {
	var $fixtures = array('app.container_width', 'app.container_heights_container_widths');

	function startTest() {
		$this->ContainerWidths =& new TestContainerWidthsController();
		$this->ContainerWidths->constructClasses();
	}

	function endTest() {
		unset($this->ContainerWidths);
		ClassRegistry::flush();
	}

	function testView() {

	}

}
?>