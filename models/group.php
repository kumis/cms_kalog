<?php
class Group extends AppModel {
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
    
    var $hasMany = array(
        'User', 'GroupsModuleAction', 'GroupsMenu'
    );
    
    var $hasAndBelongsToMany = array(
        'ModuleAction' => array(
            'className'              => 'ModuleAction',
            'joinTable'              => 'groups_module_actions',
            'foreignKey'             => 'group_id',
            'associationForeignKey'  => 'module_action_id',
            'unique'                 => true
        ),
        'Menu' => array(
            'className'              => 'Menu',
            'joinTable'              => 'groups_menus',
            'foreignKey'             => 'group_id',
            'associationForeignKey'  => 'menu_id',
            'unique'                 => true
        )
    );
    var $cacheQueries = true;

    function afterSave() {
        $i = 0;
        $values = array();
        foreach ($this->data['GroupModuleAction'] as $id => $action) {
            if ( $action ) {
                $values[$i] = '(' . $id . ',' . $this->id . ')';
                $i++;
            }
        }
        $this->query("DELETE FROM groups_module_actions WHERE group_id = ". $this->id);
        $this->query("INSERT INTO groups_module_actions(module_action_id, group_id) VALUES" . implode($values, ','));
        
        $i = 0;
        $values = array();
        foreach ( $this->data['GroupMenu'] as $id => $menu ) {
            if ( $menu ) {
                $values[$i] = '(' . $id . ',' . $this->id . ')';
                $i++;
            }
        }
        $this->query("DELETE FROM groups_menus WHERE group_id = ". $this->id);
        $this->query("INSERT INTO groups_menus(menu_id, group_id) VALUES" . implode($values, ','));
        return $this->__refreshMenu();
    }
    
    function afterDelete() {
        return $this->__refreshMenu();
    }
}
?>
