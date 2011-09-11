<?php
class DriversController extends AppController {

	var $name = 'Drivers';

	function index() {
		$this->Driver->recursive = 0;
		$this->set('drivers', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid driver', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('driver', $this->Driver->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Driver->create();
			if ($this->Driver->save($this->data)) {
				$this->Session->setFlash(__('The driver has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The driver could not be saved. Please, try again.', true));
			}
		}
		$licenses = $this->Driver->License->find('list');
		$this->set(compact('licenses'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid driver', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Driver->save($this->data)) {
				$this->Session->setFlash(__('The driver has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The driver could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Driver->read(null, $id);
		}
		$licenses = $this->Driver->License->find('list');
		$this->set(compact('licenses'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for driver', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Driver->delete($id)) {
			$this->Session->setFlash(__('Driver deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Driver was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>