<?php
class ContainerGroupsController extends AppController {

	var $name = 'ContainerGroups';

	function index() {
		$this->ContainerGroup->recursive = 0;
		$this->set('containerGroups', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container group', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('containerGroup', $this->ContainerGroup->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContainerGroup->create();
			if ($this->ContainerGroup->save($this->data)) {
				$this->Session->setFlash(__('The container group has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container group could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container group', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContainerGroup->save($this->data)) {
				$this->Session->setFlash(__('The container group has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container group could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContainerGroup->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container group', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContainerGroup->delete($id)) {
			$this->Session->setFlash(__('Container group deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container group was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>