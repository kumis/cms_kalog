<?php
/* ContainerGroupDesignations Test cases generated on: 2011-06-02 09:33:37 : 1306982017*/
App::import('Controller', 'ContainerGroupDesignations');

class TestContainerGroupDesignationsController extends ContainerGroupDesignationsController {
	var $autoRender = false;

	function redirect($url, $status = null, $exit = true) {
		$this->redirectUrl = $url;
	}
}

class ContainerGroupDesignationsControllerTestCase extends CakeTestCase {
	var $fixtures = array('app.container_group_designation', 'app.container_group', 'app.container_group_type');

	function startTest() {
		$this->ContainerGroupDesignations =& new TestContainerGroupDesignationsController();
		$this->ContainerGroupDesignations->constructClasses();
	}

	function endTest() {
		unset($this->ContainerGroupDesignations);
		ClassRegistry::flush();
	}

	function testView() {

	}

}
?>