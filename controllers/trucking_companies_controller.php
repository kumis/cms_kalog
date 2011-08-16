<?php
class TruckingCompaniesController extends AppController {

	var $name = 'TruckingCompanies';

	function index() {
		$this->TruckingCompany->recursive = 0;
		$this->set('truckingCompanies', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid trucking company', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('truckingCompany', $this->TruckingCompany->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->TruckingCompany->create();
			if ($this->TruckingCompany->save($this->data)) {
				$this->Session->setFlash(__('The trucking company has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The trucking company could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid trucking company', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->TruckingCompany->save($this->data)) {
				$this->Session->setFlash(__('The trucking company has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The trucking company could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->TruckingCompany->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for trucking company', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->TruckingCompany->delete($id)) {
			$this->Session->setFlash(__('Trucking company deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Trucking company was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>