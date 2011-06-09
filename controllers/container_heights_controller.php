<?php
class ContainerHeightsController extends AppController {

	var $name = 'ContainerHeights';

	function index() {
		$this->ContainerHeight->recursive = 0;
		$this->set('containerHeights', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container height', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('containerHeight', $this->ContainerHeight->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContainerHeight->create();
			if ($this->ContainerHeight->save($this->data)) {
				$this->Session->setFlash(__('The container height has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container height could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container height', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContainerHeight->save($this->data)) {
				$this->Session->setFlash(__('The container height has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container height could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContainerHeight->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container height', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContainerHeight->delete($id)) {
			$this->Session->setFlash(__('Container height deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container height was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>