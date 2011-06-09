<?php
/* ContainerGroups Test cases generated on: 2011-06-02 09:33:01 : 1306981981*/
App::import('Controller', 'ContainerGroups');

class TestContainerGroupsController extends ContainerGroupsController {
	var $autoRender = false;

	function redirect($url, $status = null, $exit = true) {
		$this->redirectUrl = $url;
	}
}

class ContainerGroupsControllerTestCase extends CakeTestCase {
	var $fixtures = array('app.container_group', 'app.container_group_designation', 'app.container_group_type');

	function startTest() {
		$this->ContainerGroups =& new TestContainerGroupsController();
		$this->ContainerGroups->constructClasses();
	}

	function endTest() {
		unset($this->ContainerGroups);
		ClassRegistry::flush();
	}

	function testView() {

	}

}
?>