<?php
class TruckingCompaniesController extends AppController {
	// add Jqgrid component and helpers in your class variables.
	var $components = array('Cholesterol.Jqgrid');
	var $helpers = array('Cholesterol.Jqgrid', 'Cholesterol.Autocomplete');
    
	var $name = 'TruckingCompanies';

	function index() {
//		$this->TruckingCompany->recursive = 0;
//		$this->set('truckingCompanies', $this->paginate());
		$this->set('trucks', $this->TruckingCompany->Truck->find('list'));     
   		$this->set('truckingCompanies', $this->TruckingCompany->find('list'));
		$this->set('drivers', $this->TruckingCompany->Truck->Driver->find('list'));

	}
	
//==============================================================================
// Start of JqGrid functions
//==============================================================================
	function jqgrid_list() {
		$this->TruckingCompany->Behaviors->attach('Containable');
		$this->Jqgrid->find('TruckingCompany', array(
			'contain' => array(
				'Truck.id'
			),
            'fields' => array(
				"TruckingCompany.id",
				"TruckingCompany.name"
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
    
	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid trucking company', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('truckingCompany', $this->TruckingCompany->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->TruckingCompany->create();
			if ($this->TruckingCompany->save($this->data)) {
				$this->Session->setFlash(__('The trucking company has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The trucking company could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid trucking company', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->TruckingCompany->save($this->data)) {
				$this->Session->setFlash(__('The trucking company has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The trucking company could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->TruckingCompany->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for trucking company', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->TruckingCompany->delete($id)) {
			$this->Session->setFlash(__('Trucking company deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Trucking company was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>