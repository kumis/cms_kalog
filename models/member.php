<?php
class Member extends AppModel {
    var $validate = array(
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
        ),
        'name' => array(
            'required' => array(
                'rule' => '/\w+[\w\s]/',
                'message' => 'This field cannot be left blank and must be alphanumeric'
            ),
            'maxlength' => array(
                'rule' => array('maxlength', 50),
                'message' => 'Maximum character is 50 characters'
            ),
        ),
        'stnk_no' => array(
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
        ),
        'price_id' => array(
			'required' => true,
            'allowEmpty' => false,
            'rule' => array('vPrice'),
            'message' => 'Choose based on available option'
        )
        
    );
    
    var $belongsTo = array(
        'Price'
    );
    function vPrice($field){
		return $this->Price->find('count', array(
            'conditions' => array(
                'Price.id' => $field["price_id"]
            ),
            'recursive' => -1
        )) > 0;
	}
}
?>
