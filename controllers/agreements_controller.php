<?php
class AgreementsController extends AppController{
    var $pageTitle = 'Agreement';
    var $components = array('Cholesterol.Jqgrid');
	var $helpers = array('Cholesterol.Jqgrid', 'Cholesterol.Autocomplete');

   
   function index(){
       $customers = $this->__setJSONForAutocomplete('Customer', $this->Agreement,'customer', array(
       'name'=>'name'));
       
       //$this->set('autocompleteData',$customers);
		parent::index();
	}
//==============================================================================
// Start of JqGrid functions
//==============================================================================
	function jqgrid_list() {
		$this->Agreement->Behaviors->attach('Containable');
		$this->Jqgrid->find('Agreement', array(
			'contain' => array(
                'AgreementsPacket.id',
				'Customer.id',
                'Customer.name'
			),
            'fields' => array(
				"Agreement.id",
				"Customer.name",
                "Agreement.start_date",
                "Agreement.expired_date"
			),
            'order' => array(
                "Agreement.id"
            ),
			'recursive' => 0,
		));
	}

    function jqgrid_edit() {        
        switch ($this->params['form']['oper']) {
            case 'edit' :
                $this->Agreement->saveAll($this->data);
                //$this->Driver->save($this->data);
                break;
            case 'add' :
                $this->Agreement->save($this->data);
                break;
        }
    }
//==============================================================================
// End of JqGrid functions
//==============================================================================
  
}
