<?php
class ModuleAction extends AppModel {
    var $belongsTo = array(
     'Module',
     'User' => array(
            'className' => 'User',
            'foreignKey' => 'created_by',
            'fields' => array('id', 'name')
        ));
    var $cacheQueries = true;
}
?>
