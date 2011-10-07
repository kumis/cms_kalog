<?php
class ContainersController extends AppController {

	var $name = 'Containers';
	var $components = array('Cholesterol.Jqgrid');
    var $helpers = array('Cholesterol.Jqgrid', 'Cholesterol.Autocomplete');

	function index() {
		$this->Container->recursive = 0;
		$this->set('containers', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('container', $this->Container->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Container->create();
			if ($this->Container->save($this->data)) {
				$this->Session->setFlash(__('The container has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container could not be saved. Please, try again.', true));
			}
		}
		$containerTypes = $this->Container->ContainerType->find('list');
		$this->set(compact('containerTypes'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Container->save($this->data)) {
				$this->Session->setFlash(__('The container has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Container->read(null, $id);
		}
		$containerTypes = $this->Container->ContainerType->find('list');
		$this->set(compact('containerTypes'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Container->delete($id)) {
			$this->Session->setFlash(__('Container deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
    
    function jqgrid_list(){
        $this->Container->Behaviors->attach('Containable');
		$this->Jqgrid->find('Container', array(
			'contain' => array(
                'ContainerType'=> array(
                    'ContainerGroupType'
                    
                )
			),
           'fields' => array(
				"Container.id",
				"Container.container_no",
                "ContainerType.id"//,
                //"CountainerGroupType.code"
			),
            'order' => array(
                "Container.id"
            ),
			'recursive' => 2,
		));
        
    }
    
}
