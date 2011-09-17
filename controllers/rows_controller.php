<?php
class RowsController extends AppController {

	var $name = 'Rows';

	function index() {
		$this->Row->recursive = 0;
		$this->set('rows', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid row', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('row', $this->Row->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Row->create();
			if ($this->Row->save($this->data)) {
				$this->Session->setFlash(__('The row has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The row could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid row', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Row->save($this->data)) {
				$this->Session->setFlash(__('The row has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The row could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Row->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for row', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Row->delete($id)) {
			$this->Session->setFlash(__('Row deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Row was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
