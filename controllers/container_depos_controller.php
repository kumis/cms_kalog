<?php
class ContainerDeposController extends AppController {

	var $name = 'ContainerDepos';

	function index() {
		$this->ContainerDepo->recursive = 0;
		$this->set('containerDepos', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container depo', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('containerDepo', $this->ContainerDepo->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContainerDepo->create();
			if ($this->ContainerDepo->save($this->data)) {
				$this->Session->setFlash(__('The container depo has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container depo could not be saved. Please, try again.', true));
			}
		}
		$branches = $this->ContainerDepo->Branch->find('list');
		$this->set(compact('branches'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container depo', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContainerDepo->save($this->data)) {
				$this->Session->setFlash(__('The container depo has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container depo could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContainerDepo->read(null, $id);
		}
		$branches = $this->ContainerDepo->Branch->find('list');
		$this->set(compact('branches'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container depo', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContainerDepo->delete($id)) {
			$this->Session->setFlash(__('Container depo deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container depo was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
