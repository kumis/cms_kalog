<?php
class CarriageFreightsController extends AppController {

	var $name = 'CarriageFreights';
	var $helpers = array('Html', 'Form');

	function index() {
		$this->CarriageFreight->recursive = 0;
		$this->set('carriageFreights', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid CarriageFreight.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->set('carriageFreight', $this->CarriageFreight->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->CarriageFreight->create();
			if ($this->CarriageFreight->save($this->data)) {
				$this->Session->setFlash(__('The CarriageFreight has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The CarriageFreight could not be saved. Please, try again.', true));
			}
		}
		$carriages = $this->CarriageFreight->Carriage->find('list');
		$freights = $this->CarriageFreight->Freight->find('list');
		$this->set(compact('carriages', 'freights'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid CarriageFreight', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->CarriageFreight->save($this->data)) {
				$this->Session->setFlash(__('The CarriageFreight has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The CarriageFreight could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->CarriageFreight->read(null, $id);
		}
		$carriages = $this->CarriageFreight->Carriage->find('list');
		$freights = $this->CarriageFreight->Freight->find('list');
		$this->set(compact('carriages','freights'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for CarriageFreight', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->CarriageFreight->del($id)) {
			$this->Session->setFlash(__('CarriageFreight deleted', true));
			$this->redirect(array('action'=>'index'));
		}
	}

}
?>