<?php
class VehicleCategory extends AppModel {
	var $name = 'VehicleCategory';
    var $validate = array(
        'name' => array(
            'required' => array(
                'rule' => '/\w+[\w\s]/',
                'message' => 'This field cannot be left blank and must be alphanumeric'
            ),
            'maxlength' => array(
                'rule' => array('maxlength', 50),
                'message' => 'Maximum character is 50 characters'
            )
        ),
        'code' => array(
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
    
	//var $belongsTo = array('Price');
	var $hasMany = array('Member','Parking');
    var $cacheQueries = true;
}
?>
