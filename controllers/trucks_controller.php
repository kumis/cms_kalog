<?php
class TrucksController extends AppController {
	// add Jqgrid component and helpers in your class variables.
	var $components = array('Cholesterol.Jqgrid');
	var $helpers = array('Cholesterol.Jqgrid');
	
	var $name = 'Trucks';

	function index() {
		//$this->Truck->recursive = 0;
		//$this->set('trucks', $this->paginate());
	}
	
	function truck_list() {
		$this->Jqgrid->find('Truck', array('fields' => array()));
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid truck', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('truck', $this->Truck->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Truck->create();
			if ($this->Truck->save($this->data)) {
				$this->Session->setFlash(__('The truck has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The truck could not be saved. Please, try again.', true));
			}
		}
		$drivers = $this->Truck->Driver->find('list');
		$truckingCompanies = $this->Truck->TruckingCompany->find('list');
		$this->set(compact('drivers', 'truckingCompanies'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid truck', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Truck->save($this->data)) {
				$this->Session->setFlash(__('The truck has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The truck could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Truck->read(null, $id);
		}
		$drivers = $this->Truck->Driver->find('list');
		$truckingCompanies = $this->Truck->TruckingCompany->find('list');
		$this->set(compact('drivers', 'truckingCompanies'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for truck', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Truck->delete($id)) {
			$this->Session->setFlash(__('Truck deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Truck was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>