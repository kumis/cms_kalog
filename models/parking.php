<?php
class Parking extends AppModel {
    /*
    var $validate = array(
        'name' => array(
            'valid' => array(
                'rule' => array('alphaNumeric'),
                'message' => 'This field only accept alpha numeric characters'
            ),
            'required' => array(
                'allowEmpty' => false,
                'rule' => array('notEmpty'),
                'message' => 'This field cannot be empty'
            ),
            'maxlength' => array(
                'rule' => array('maxlength', 60),
                'message' => 'Maximum character is 60 characters'
            ),
            'unique' => array(
                'rule' => array('unique', 'name'),
                'message' => 'This name already exists'
            ),
        )
    );
    **/
    var $belongsTo = array(
        'Member', 'VehicleCategory'
    );
    
    
    var $cacheQueries = true;

    function afterSave() {
        
    }
    
    
}
?>
