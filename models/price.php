<?php
class Price extends AppModel {
    var $validate = array(
        'price_desc' => array(
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
        'price_first_hour'=>array(
			'required'=>array(
				'allowEmpty' => false,
                'rule' => array('notEmpty'),
                'message' => 'This field cannot be empty'
			),
			'valid' => array(        
				'rule' => array('money', 'left'),        
				'message' => 'Please supply a valid monetary amount.'    
			)
        ),
        'price_per_hour'=>array(
			'required'=>array(
				'allowEmpty' => false,
                'rule' => array('notEmpty'),
                'message' => 'This field cannot be empty'
			),
			'valid' => array(        
				'rule' => array('money', 'left'),        
				'message' => 'Please supply a valid monetary amount.'    
			)
        ),
        'price_max'=>array(
			'required'=>array(
				'allowEmpty' => false,
                'rule' => array('notEmpty'),
                'message' => 'This field cannot be empty'
			),
			'valid' => array(        
				'rule' => array('money', 'left'),        
				'message' => 'Please supply a valid monetary amount.'    
			)
        ),/**
        'vehicle_category_id' =>  array(
            'required' => true,
            'allowEmpty' => false,
            'rule' => array('vVehicle'),
            'message' => 'Choose based on available option'
        ),*/
    );
    
    var $belongsTo = array(
       
    );
    var $hasMany = array('VehicleCategory');
    /*
    function vVehicle($field){
		return $this->VehicleCategory->find('count', array(
            'conditions' => array(
                'VehicleCategory.id' => $field["vehicle_category_id"]
            ),
            'recursive' => -1
        )) > 0;
	}
	* */
}
?>
