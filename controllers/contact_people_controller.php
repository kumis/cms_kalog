<?php
class ContactPeopleController extends AppController {

	var $name = 'ContactPeople';

	function index() {
		$this->ContactPerson->recursive = 0;
		$this->set('contactPeople', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid contact person', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('contactPerson', $this->ContactPerson->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContactPerson->create();
			if ($this->ContactPerson->save($this->data)) {
				$this->Session->setFlash(__('The contact person has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The contact person could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid contact person', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContactPerson->save($this->data)) {
				$this->Session->setFlash(__('The contact person has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The contact person could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContactPerson->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for contact person', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContactPerson->delete($id)) {
			$this->Session->setFlash(__('Contact person deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Contact person was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>