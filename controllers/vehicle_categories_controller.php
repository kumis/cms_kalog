<?php
class VehicleCategoriesController extends AppController {
    var $pageTitle = 'Vehicle Categories';
        function add() {
        //$this->__setAdditionals();
       
        parent::add();
    }
    
    function edit($id = null) {
        //$this->__setAdditionals();
        parent::edit($id); 
    }
    
    function __setAdditionals($add = true, $id = null) {               
        $prices = $this->VehicleCategory->Price->find('list', array(
            'fields' => array('Price.id', 'Price.price_desc'),
            'order' => 'Price.price_desc ASC'
        ));
        $this->set(compact('prices'));
        
    }
}
?>
