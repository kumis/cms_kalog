<?php
class PricesController extends AppController {
    var $pageTitle = 'Price Management';
    function add() {
        //$this->__setAdditionals();
       
        parent::add();
    }
    
    function edit($id = null) {
      //  $this->__setAdditionals();
        parent::edit($id); 
    }
    /*
    function __setAdditionals($add = true, $id = null) {               
        $vehicles = $this->Price->VehicleCategory->find('list', array(
            'fields' => array('VehicleCategory.id', 'VehicleCategory.name'),
            'order' => 'VehicleCategory.name ASC'
        ));
        $this->set(compact('vehicles'));
        
    }
    * */
}
?>
