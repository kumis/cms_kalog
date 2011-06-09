<?php
class ContainerLengthsController extends AppController {

	var $name = 'ContainerLengths';

	function index() {
		$this->ContainerLength->recursive = 0;
		$this->set('containerLengths', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container length', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('containerLength', $this->ContainerLength->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContainerLength->create();
			if ($this->ContainerLength->save($this->data)) {
				$this->Session->setFlash(__('The container length has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container length could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container length', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContainerLength->save($this->data)) {
				$this->Session->setFlash(__('The container length has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container length could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContainerLength->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container length', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContainerLength->delete($id)) {
			$this->Session->setFlash(__('Container length deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container length was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>