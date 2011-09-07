<?php
class UserPreferencesController extends AppController {

	var $name = 'UserPreferences';
	var $helpers = array('Html', 'Form');

	function index() {
		$this->UserPreference->recursive = 0;
		$this->set('userPreferences', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->flash(__('Invalid UserPreference', true), array('action'=>'index'));
		}
		$this->set('userPreference', $this->UserPreference->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->UserPreference->create();
			if ($this->UserPreference->save($this->data)) {
				$this->flash(__('UserPreference saved.', true), array('action'=>'index'));
			} else {
			}
		}
		$users = $this->UserPreference->User->find('list');
		$this->set(compact('users'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->flash(__('Invalid UserPreference', true), array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->UserPreference->save($this->data)) {
				$this->flash(__('The UserPreference has been saved.', true), array('action'=>'index'));
			} else {
			}
		}
		if (empty($this->data)) {
			$this->data = $this->UserPreference->read(null, $id);
		}
		$users = $this->UserPreference->User->find('list');
		$this->set(compact('users'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->flash(__('Invalid UserPreference', true), array('action'=>'index'));
		}
		if ($this->UserPreference->del($id)) {
			$this->flash(__('UserPreference deleted', true), array('action'=>'index'));
		}
	}

}
?>