<?php
class ParkingsController extends AppController {
    var $pageTitle = 'Parkings';
    function add() {
        $this->__setAdditionals();
        parent::add();
    }
    
    function edit($id = null) {
         $this->__setAdditionals();
    }
    
    function __setAdditionals($add = true, $id = null) {
                
        $prices = $this->Parking->Price->find('list', array(
            'fields' => array('Price.id', 'Price.price_desc'),
            'order' => 'Price.vehicle_category_id ASC',
        ));
        $this->set(compact('prices'));
        
    }
}
