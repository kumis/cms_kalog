<?php
class LocomotivesController extends AppController {

	var $name = 'Locomotives';
	var $helpers = array('Html', 'Form');

	function index() {
		$this->Locomotive->recursive = 0;
		$this->set('locomotives', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid Locomotive.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->set('locomotive', $this->Locomotive->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Locomotive->create();
			if ($this->Locomotive->save($this->data)) {
				$this->Session->setFlash(__('The Locomotive has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Locomotive could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid Locomotive', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Locomotive->save($this->data)) {
				$this->Session->setFlash(__('The Locomotive has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Locomotive could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Locomotive->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for Locomotive', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Locomotive->del($id)) {
			$this->Session->setFlash(__('Locomotive deleted', true));
			$this->redirect(array('action'=>'index'));
		}
	}

}
?>