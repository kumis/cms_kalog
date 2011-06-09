<?php
/* ContainerHeights Test cases generated on: 2011-06-02 17:03:49 : 1307009029*/
App::import('Controller', 'ContainerHeights');

class TestContainerHeightsController extends ContainerHeightsController {
	var $autoRender = false;

	function redirect($url, $status = null, $exit = true) {
		$this->redirectUrl = $url;
	}
}

class ContainerHeightsControllerTestCase extends CakeTestCase {
	var $fixtures = array('app.container_height', 'app.container_heights_container_widths');

	function startTest() {
		$this->ContainerHeights =& new TestContainerHeightsController();
		$this->ContainerHeights->constructClasses();
	}

	function endTest() {
		unset($this->ContainerHeights);
		ClassRegistry::flush();
	}

	function testView() {

	}

}
?>