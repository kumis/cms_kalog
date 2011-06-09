<?php
class CitiesController extends AppController {
    var $pageTitle = 'Cities';
    
    function add() {
        $provinces = $this->City->Province->find('list');
        $this->set('provinces', $provinces);
        
        $this->__add(); 
    }
    
    function edit($id = null) {
        $provinces = $this->City->Province->find('list');
        $this->set('provinces', $provinces);
        
        parent::edit($id); 
    }
}
?>