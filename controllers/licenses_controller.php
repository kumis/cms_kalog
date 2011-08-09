<?php
class LicensesController extends AppController {

	var $name = 'Licenses';

	function index() {
		$this->License->recursive = 0;
		$this->set('licenses', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid license', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('license', $this->License->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->License->create();
			if ($this->License->save($this->data)) {
				$this->Session->setFlash(__('The license has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The license could not be saved. Please, try again.', true));
			}
		}
		$licenseTypes = $this->License->LicenseType->find('list');
		$this->set(compact('licenseTypes'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid license', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->License->save($this->data)) {
				$this->Session->setFlash(__('The license has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The license could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->License->read(null, $id);
		}
		$licenseTypes = $this->License->LicenseType->find('list');
		$this->set(compact('licenseTypes'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for license', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->License->delete($id)) {
			$this->Session->setFlash(__('License deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('License was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>