<?php
class ContainerHeightsContainerWidthsController extends AppController {

	var $name = 'ContainerHeightsContainerWidths';

	function index() {
		$this->ContainerHeightsContainerWidth->recursive = 0;
		$this->set('containerHeightsContainerWidths', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container heights container width', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('containerHeightsContainerWidth', $this->ContainerHeightsContainerWidth->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContainerHeightsContainerWidth->create();
			if ($this->ContainerHeightsContainerWidth->save($this->data)) {
				$this->Session->setFlash(__('The container heights container width has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container heights container width could not be saved. Please, try again.', true));
			}
		}
		$containerHeights = $this->ContainerHeightsContainerWidth->ContainerHeight->find('list');
		$containerWidths = $this->ContainerHeightsContainerWidth->ContainerWidth->find('list');
		$this->set(compact('containerHeights', 'containerWidths'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container heights container width', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContainerHeightsContainerWidth->save($this->data)) {
				$this->Session->setFlash(__('The container heights container width has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container heights container width could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContainerHeightsContainerWidth->read(null, $id);
		}
		$containerHeights = $this->ContainerHeightsContainerWidth->ContainerHeight->find('list');
		$containerWidths = $this->ContainerHeightsContainerWidth->ContainerWidth->find('list');
		$this->set(compact('containerHeights', 'containerWidths'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container heights container width', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContainerHeightsContainerWidth->delete($id)) {
			$this->Session->setFlash(__('Container heights container width deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container heights container width was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>