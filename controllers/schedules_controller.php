<?php
class SchedulesController extends AppController {

	var $name = 'Schedules';
	var $helpers = array('Html', 'Form');

	function index() {
		$this->Schedule->recursive = 0;
		$this->set('schedules', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid Schedule.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->set('schedule', $this->Schedule->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Schedule->create();
			if ($this->Schedule->save($this->data)) {
				$this->Session->setFlash(__('The Schedule has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Schedule could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid Schedule', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Schedule->save($this->data)) {
				$this->Session->setFlash(__('The Schedule has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Schedule could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Schedule->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for Schedule', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Schedule->del($id)) {
			$this->Session->setFlash(__('Schedule deleted', true));
			$this->redirect(array('action'=>'index'));
		}
	}

}
?>