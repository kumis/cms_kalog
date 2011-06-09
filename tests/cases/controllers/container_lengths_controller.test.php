<?php
/* ContainerLengths Test cases generated on: 2011-06-02 17:04:26 : 1307009066*/
App::import('Controller', 'ContainerLengths');

class TestContainerLengthsController extends ContainerLengthsController {
	var $autoRender = false;

	function redirect($url, $status = null, $exit = true) {
		$this->redirectUrl = $url;
	}
}

class ContainerLengthsControllerTestCase extends CakeTestCase {
	var $fixtures = array('app.container_length', 'app.container_type', 'app.container_heights_container_widths', 'app.container_group_type', 'app.container_group_designation', 'app.container_group');

	function startTest() {
		$this->ContainerLengths =& new TestContainerLengthsController();
		$this->ContainerLengths->constructClasses();
	}

	function endTest() {
		unset($this->ContainerLengths);
		ClassRegistry::flush();
	}

	function testView() {

	}

}
?>