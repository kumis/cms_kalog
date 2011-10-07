<?php
class ServicesController extends AppController {

	var $name = 'Services';
    var $pageTitle = 'service';
    var $components = array('Cholesterol.Jqgrid');
	var $helpers = array('Cholesterol.Jqgrid', 'Cholesterol.Autocomplete');

	function index() {
		$this->Service->recursive = 0;
		$this->set('services', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid service', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('service', $this->Service->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Service->create();
			if ($this->Service->save($this->data)) {
				$this->Session->setFlash(__('The service has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The service could not be saved. Please, try again.', true));
			}
		}
		$packets = $this->Service->Packet->find('list');
		$documents = $this->Service->Document->find('list');
		$this->set(compact('packets', 'documents'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid service', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Service->save($this->data)) {
				$this->Session->setFlash(__('The service has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The service could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Service->read(null, $id);
		}
		$packets = $this->Service->Packet->find('list');
		$documents = $this->Service->Document->find('list');
		$this->set(compact('packets', 'documents'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for service', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Service->delete($id)) {
			$this->Session->setFlash(__('Service deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Service was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
	
	//==============================================================================
// Start of JqGrid functions
//==============================================================================
	function jqgrid_list() {
		$this->Service->Behaviors->attach('Containable');
		$this->Jqgrid->find('Service', array(
			'contain' => array(
				//'Service.id',
                //'Service.name'
			),
            'fields' => array(
				"Service.id",
				"Service.name",
			),
            'order' => array(
                "Service.id"
            ),
			'recursive' => 0,
		));
	}

    function jqgrid_edit() {        
        switch ($this->params['form']['oper']) {
            case 'edit' :
                $this->Service->saveAll($this->data);
                break;
            case 'add' :
                $this->Service->save($this->data);
                break;
        }
    }
//==============================================================================
// End of JqGrid functions
//==============================================================================
}
