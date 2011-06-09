<?php
/* ContainerTypes Test cases generated on: 2011-06-02 17:06:25 : 1307009185*/
App::import('Controller', 'ContainerTypes');

class TestContainerTypesController extends ContainerTypesController {
	var $autoRender = false;

	function redirect($url, $status = null, $exit = true) {
		$this->redirectUrl = $url;
	}
}

class ContainerTypesControllerTestCase extends CakeTestCase {
	var $fixtures = array('app.container_type', 'app.container_length', 'app.container_heights_container_widths', 'app.container_group_type', 'app.container_group_designation', 'app.container_group');

	function startTest() {
		$this->ContainerTypes =& new TestContainerTypesController();
		$this->ContainerTypes->constructClasses();
	}

	function endTest() {
		unset($this->ContainerTypes);
		ClassRegistry::flush();
	}

	function testView() {

	}

}
?>