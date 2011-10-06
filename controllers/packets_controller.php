<?php
class PacketsController extends AppController{
    var $pageTitle = 'packet';
    var $components = array('Cholesterol.Jqgrid');
	var $helpers = array('Cholesterol.Jqgrid', 'Cholesterol.Autocomplete');
	
	function index(){
       
       //$this->set('autocompleteData',$customers);
		parent::index();
	}
//==============================================================================
// Start of JqGrid functions
//==============================================================================
	function jqgrid_list() {
		$this->Packet->Behaviors->attach('Containable');
		$this->Jqgrid->find('Packet', array(
			'contain' => array('Service.id'),

            'fields' => array(
				"Packet.id",
				"Packet.name"
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
