<?php
class PacketsController extends AppController{
    var $name = 'Packets';
    var $pageTitle = 'packet';
    var $components = array('Cholesterol.Jqgrid');
	var $helpers = array('Cholesterol.Jqgrid', 'Cholesterol.Autocomplete');

	function index() {
		$this->Packet->recursive = 0;
		$this->set('packets', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid service', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('packet', $this->Packet->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Packet->create();
			if ($this->Packet->save($this->data)) {
				$this->Session->setFlash(__('The service has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The service could not be saved. Please, try again.', true));
			}
		}
		$services = $this->Packet->Service->find('list');
		$this->set(compact('services'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid service', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Packet->save($this->data)) {
				$this->Session->setFlash(__('The packet has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The service could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Packet->read(null, $id);
		}
		$services = $this->Packet->Service->find('list');
		$this->set(compact('services'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for service', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Packet->delete($id)) {
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
		$this->Packet->Behaviors->attach('Containable');
		$this->Jqgrid->find('Packet', array(
			'contain' => array(
			),
            'fields' => array(
				"Packet.id",
				"Packet.name",
			),
            'order' => array(
                "Packet.id"
            ),
			'recursive' => 0,
		));
	}

    function jqgrid_edit() {        
        switch ($this->params['form']['oper']) {
            case 'edit' :
                $this->Packet->saveAll($this->data);
                //$this->Driver->save($this->data);
                break;
            case 'add' :
                $this->Packet->save($this->data);
                break;
        }
    }
//==============================================================================
// End of JqGrid functions
//==============================================================================
  
}
