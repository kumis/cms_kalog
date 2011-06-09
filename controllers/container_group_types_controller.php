<?php
class ContainerGroupTypesController extends AppController {

	var $name = 'ContainerGroupTypes';

	function index() {
		$this->ContainerGroupType->recursive = 0;
		$this->set('containerGroupTypes', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container group type', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('containerGroupType', $this->ContainerGroupType->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContainerGroupType->create();
			if ($this->ContainerGroupType->save($this->data)) {
				$this->Session->setFlash(__('The container group type has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container group type could not be saved. Please, try again.', true));
			}
		}
		$containerGroupDesignations = $this->ContainerGroupType->ContainerGroupDesignation->find('list');
		$this->set(compact('containerGroupDesignations'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container group type', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContainerGroupType->save($this->data)) {
				$this->Session->setFlash(__('The container group type has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container group type could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContainerGroupType->read(null, $id);
		}
		$containerGroupDesignations = $this->ContainerGroupType->ContainerGroupDesignation->find('list');
		$this->set(compact('containerGroupDesignations'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container group type', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContainerGroupType->delete($id)) {
			$this->Session->setFlash(__('Container group type deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container group type was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>