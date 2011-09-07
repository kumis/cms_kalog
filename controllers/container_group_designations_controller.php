<?php
class ContainerGroupDesignationsController extends AppController {

	var $name = 'ContainerGroupDesignations';

	function index() {
		$this->ContainerGroupDesignation->recursive = 0;
		$this->set('containerGroupDesignations', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container group designation', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('containerGroupDesignation', $this->ContainerGroupDesignation->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContainerGroupDesignation->create();
			if ($this->ContainerGroupDesignation->save($this->data)) {
				$this->Session->setFlash(__('The container group designation has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container group designation could not be saved. Please, try again.', true));
			}
		}
		$containerGroups = $this->ContainerGroupDesignation->ContainerGroup->find('list');
		$this->set(compact('containerGroups'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container group designation', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContainerGroupDesignation->save($this->data)) {
				$this->Session->setFlash(__('The container group designation has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container group designation could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContainerGroupDesignation->read(null, $id);
		}
		$containerGroups = $this->ContainerGroupDesignation->ContainerGroup->find('list');
		$this->set(compact('containerGroups'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container group designation', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContainerGroupDesignation->delete($id)) {
			$this->Session->setFlash(__('Container group designation deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container group designation was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>