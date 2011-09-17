<?php
class BlocksController extends AppController {

	var $name = 'Blocks';

	function index() {
		$this->Block->recursive = 0;
		$this->set('blocks', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid block', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('block', $this->Block->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Block->create();
			if ($this->Block->save($this->data)) {
				$this->Session->setFlash(__('The block has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The block could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid block', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Block->save($this->data)) {
				$this->Session->setFlash(__('The block has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The block could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Block->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for block', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Block->delete($id)) {
			$this->Session->setFlash(__('Block deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Block was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
