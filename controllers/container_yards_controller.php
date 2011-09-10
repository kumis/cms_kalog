<?php
class ContainerYardsController extends AppController {

	var $name = 'ContainerYards';

	function index() {
		$this->ContainerYard->recursive = 0;
		$this->set('containerYards', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container yard', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('containerYard', $this->ContainerYard->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContainerYard->create();
			if ($this->ContainerYard->save($this->data)) {
				$this->Session->setFlash(__('The container yard has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container yard could not be saved. Please, try again.', true));
			}
		}
		$branches = $this->ContainerYard->Branch->find('list');
		$this->set(compact('branches'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container yard', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContainerYard->save($this->data)) {
				$this->Session->setFlash(__('The container yard has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container yard could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContainerYard->read(null, $id);
		}
		$branches = $this->ContainerYard->Branch->find('list');
		$this->set(compact('branches'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container yard', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContainerYard->delete($id)) {
			$this->Session->setFlash(__('Container yard deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container yard was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
