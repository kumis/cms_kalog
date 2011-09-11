<?php
class LicenseTypesController extends AppController {

	var $name = 'LicenseTypes';

	function index() {
		$this->LicenseType->recursive = 0;
		$this->set('licenseTypes', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid license type', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('licenseType', $this->LicenseType->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->LicenseType->create();
			if ($this->LicenseType->save($this->data)) {
				$this->Session->setFlash(__('The license type has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The license type could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid license type', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->LicenseType->save($this->data)) {
				$this->Session->setFlash(__('The license type has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The license type could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->LicenseType->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for license type', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->LicenseType->delete($id)) {
			$this->Session->setFlash(__('License type deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('License type was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>