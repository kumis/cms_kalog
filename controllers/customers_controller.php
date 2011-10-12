<?php
class CustomersController extends AppController {
	var $components = array('Cholesterol.Jqgrid');
	var $helpers = array('Cholesterol.Jqgrid', 'Cholesterol.Autocomplete');
	var $name = 'Customers';

	
//==============================================================================
// Start of JqGrid functions
//==============================================================================
	function jqgrid_list() {
		$this->Customer->Behaviors->attach('Containable');
		$this->Jqgrid->find('Customer', array(
			'contain' => array(
				'ContactPerson.id',
				'ContactPerson.first_name',
			),
            'fields' => array(
				"Customer.id",
                "ContactPerson.id",
                "ContactPerson.first_name",
				"Customer.name",
				"Customer.type"
			),
			'recursive' => 0,
		));
	}

    function jqgrid_edit() {        
        switch ($this->params['form']['oper']) {
            case 'edit' :
                $this->TruckingCompany->saveAll($this->data);
                //$this->Driver->save($this->data);
                break;
            case 'add' :
                $this->TruckingCompany->save($this->data);
                break;
            case 'del' :
                $this->TruckingCompany->delete($this->params['form']['id']);
                break;
        }
    }
//==============================================================================
// End of JqGrid functions
//==============================================================================    
    
	function index() {
		$this->Customer->recursive = 0;
		$this->set('customers', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid customer', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('customer', $this->Customer->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Customer->create();
			if ($this->Customer->save($this->data)) {
				$this->Session->setFlash(__('The customer has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The customer could not be saved. Please, try again.', true));
			}
		}
		$contactPeople = $this->Customer->ContactPerson->find('list');
		$this->set(compact('contactPeople'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid customer', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Customer->save($this->data)) {
				$this->Session->setFlash(__('The customer has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The customer could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Customer->read(null, $id);
		}
		$contactPeople = $this->Customer->ContactPerson->find('list');
		$this->set(compact('contactPeople'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for customer', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Customer->delete($id)) {
			$this->Session->setFlash(__('Customer deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Customer was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>
