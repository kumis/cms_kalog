<?php
class ColumnsController extends AppController {

	var $name = 'Columns';

	function index() {
		$this->Column->recursive = 0;
		$this->set('columns', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid column', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('column', $this->Column->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Column->create();
			if ($this->Column->save($this->data)) {
				$this->Session->setFlash(__('The column has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The column could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid column', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Column->save($this->data)) {
				$this->Session->setFlash(__('The column has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The column could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Column->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for column', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Column->delete($id)) {
			$this->Session->setFlash(__('Column deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Column was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
