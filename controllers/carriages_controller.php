<?php
class CarriagesController extends AppController {

	var $name = 'Carriages';
	var $helpers = array('Html', 'Form');

	function index() {
		$this->Carriage->recursive = 0;
		$this->set('carriages', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->flash(__('Invalid Carriage', true), array('action'=>'index'));
		}
		$this->set('carriage', $this->Carriage->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Carriage->create();
			if ($this->Carriage->save($this->data)) {
				$this->flash(__('Carriage saved.', true), array('action'=>'index'));
			} else {
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->flash(__('Invalid Carriage', true), array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Carriage->save($this->data)) {
				$this->flash(__('The Carriage has been saved.', true), array('action'=>'index'));
			} else {
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Carriage->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->flash(__('Invalid Carriage', true), array('action'=>'index'));
		}
		if ($this->Carriage->del($id)) {
			$this->flash(__('Carriage deleted', true), array('action'=>'index'));
		}
	}

}
?>