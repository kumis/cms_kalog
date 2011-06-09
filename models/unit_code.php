<?php
class UnitCode extends AppModel {
    var $validate = array(
        'name' => array(
            'required' => array(
                'required' => true,
                'allowEmpty' => false,
                'rule' => '/^\w+[\w\s]?/',
                'message' => 'This field cannot be left blank and must be alphanumeric'
            ),
            'maxlength' => array(
                'rule' => array('maxLength', 100),
                'message' => 'Maximum characters is 100 characters'
            )
        ),
        'code' => array(
            'required' => array(    
                'required' => true,
                'allowEmpty' => false,
                'rule' => '|^[a-zA-Z0-9\.]{1,10}$|',
                'message' => 'This field cannot be left blank and must be alphanumeric or .'
            ),
            'maxlength' => array(
                'rule' => array('maxLength', 10),
                'message' => 'Maximum character is 10 characters'
            ),
            'unique' => array(
                'rule' => array('unique', 'code'),
                'message' => 'Code already exist'
            ),
        )
    );
    
    var $belongsTo = array(
        'User' => array(
            'className' => 'User',
            'foreignKey' => 'created_by',
            'fields' => array('id', 'name')
        )
    );
}
?>
