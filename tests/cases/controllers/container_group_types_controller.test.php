<?php
/* ContainerGroupTypes Test cases generated on: 2011-06-02 17:03:04 : 1307008984*/
App::import('Controller', 'ContainerGroupTypes');

class TestContainerGroupTypesController extends ContainerGroupTypesController {
	var $autoRender = false;

	function redirect($url, $status = null, $exit = true) {
		$this->redirectUrl = $url;
	}
}

class ContainerGroupTypesControllerTestCase extends CakeTestCase {
	var $fixtures = array('app.container_group_type', 'app.container_group_designation', 'app.container_group', 'app.container_type', 'app.container_length', 'app.container_heights_container_widths');

	function startTest() {
		$this->ContainerGroupTypes =& new TestContainerGroupTypesController();
		$this->ContainerGroupTypes->constructClasses();
	}

	function endTest() {
		unset($this->ContainerGroupTypes);
		ClassRegistry::flush();
	}

	function testView() {

	}

}
?>