<?php
class TiersController extends AppController {

	var $name = 'Tiers';

	function index() {
		$this->Tier->recursive = 0;
		$this->set('tiers', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid tier', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('tier', $this->Tier->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Tier->create();
			if ($this->Tier->save($this->data)) {
				$this->Session->setFlash(__('The tier has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The tier could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid tier', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Tier->save($this->data)) {
				$this->Session->setFlash(__('The tier has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The tier could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Tier->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for tier', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Tier->delete($id)) {
			$this->Session->setFlash(__('Tier deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Tier was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
