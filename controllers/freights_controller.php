<?php
class FreightsController extends AppController {

	var $name = 'Freights';
	var $helpers = array('Html', 'Form');

	function index() {
		$this->Freight->recursive = 0;
		$this->set('freights', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid Freight.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->set('freight', $this->Freight->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Freight->create();
			if ($this->Freight->save($this->data)) {
				$this->Session->setFlash(__('The Freight has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Freight could not be saved. Please, try again.', true));
			}
		}
		$schedules = $this->Freight->Schedule->find('list');
		$locomotives = $this->Freight->Locomotive->find('list');
		$this->set(compact('schedules', 'locomotives'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid Freight', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Freight->save($this->data)) {
				$this->Session->setFlash(__('The Freight has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Freight could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Freight->read(null, $id);
		}
		$schedules = $this->Freight->Schedule->find('list');
		$locomotives = $this->Freight->Locomotive->find('list');
		$this->set(compact('schedules','locomotives'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for Freight', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Freight->del($id)) {
			$this->Session->setFlash(__('Freight deleted', true));
			$this->redirect(array('action'=>'index'));
		}
	}

}
?>