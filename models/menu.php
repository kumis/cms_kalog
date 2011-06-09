<?php
class Menu extends AppModel {
	var $name = 'Menu';
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
        'url' => array(
            'valid' => array(
                'rule' => '/\S+/',
                'message' => 'This field must be valid path'
            ),
            'maxlength' => array(
                'rule' => array('maxlength', 50),
                'message' => 'Maximum character is 50 characters'
            )
        )
    );
    
    var $belongsTo = array(
        'MenuType'
    );
    
    var $actsAs = array('Tree');
    var $displayField = 'name';
    var $cacheQueries = true;
    
    function afterSave() {
        return $this->__refreshMenu();
    }
    
    function afterDelete() {
        return $this->__refreshMenu();
    }
}
?>
