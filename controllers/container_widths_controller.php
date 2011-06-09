<?php
class ContainerWidthsController extends AppController {

	var $name = 'ContainerWidths';

	function index() {
		$this->ContainerWidth->recursive = 0;
		$this->set('containerWidths', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container width', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('containerWidth', $this->ContainerWidth->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContainerWidth->create();
			if ($this->ContainerWidth->save($this->data)) {
				$this->Session->setFlash(__('The container width has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container width could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container width', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContainerWidth->save($this->data)) {
				$this->Session->setFlash(__('The container width has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container width could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContainerWidth->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container width', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContainerWidth->delete($id)) {
			$this->Session->setFlash(__('Container width deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container width was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>