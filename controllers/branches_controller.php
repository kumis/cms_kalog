<?php
class BranchesController extends AppController {

	var $name = 'Branches';

	function index() {
		$this->Branch->recursive = 0;
		$this->set('branches', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid branch', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('branch', $this->Branch->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Branch->create();
			if ($this->Branch->save($this->data)) {
				$this->Session->setFlash(__('The branch has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The branch could not be saved. Please, try again.', true));
			}
		}
		$locations = $this->Branch->Location->find('list');
		$this->set(compact('locations'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid branch', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Branch->save($this->data)) {
				$this->Session->setFlash(__('The branch has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The branch could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Branch->read(null, $id);
		}
		$locations = $this->Branch->Location->find('list');
		$this->set(compact('locations'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for branch', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Branch->delete($id)) {
			$this->Session->setFlash(__('Branch deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Branch was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
