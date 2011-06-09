<?php
class MenuType extends AppModel {
    var $name = 'MenuType';
    var $validate = array(
        'name' => array(
            'required' => array(
                'rule' => '/^\w+[\w\s]$/',
                'message' => 'This field cannot be left blank and must be alphanumeric'
            ),
            'maxlength' => array(
                'rule' => array('maxlength', 20),
                'message' => 'Maximum character is 20 characters'
            )
        ),
        'call_name' => array(
            'required' => array(
                'rule' => '/^\w+[\w\s]$/',
                'message' => 'This field cannot be left blank and must be alphanumeric'
            ),
            'maxlength' => array(
                'rule' => array('maxlength', 10),
                'message' => 'Maximum character is 10 characters'
            ),
            'unique' => array(
                'rule' => array('unique', 'call_name'),
                'message' => 'Call Name already exists'
            )
        )
    );
    
    var $hasMany = array('Menu');
    var $cacheQueries = true;
}
?>
