<?php
class Module extends AppModel {
    var $name = 'Module';
    var $validate = array(
        'name' => array(
            'required' => array(
                'required' => true,
                'allowEmpty' => false,
                'rule' => '/^[\w\s]+$/',
                'message' => 'This field is required',
                'last' => true
            ),
            'max' => array(
                'rule' => array('maxLength', 50),
                'message' => 'Maximum character is 50 characters'
            )
        ),
        'controller' => array(
            'required' => array(
                'required' => true,
                'allowEmpty' => false,
                'rule' => '|^[A-Za-z_]+[A-Za-z0-9_]?$|',
                'message' => 'This field is required',
                'last' => true
            ),
            'max' => array(
                'rule' => array('maxLength', 50),
                'message' => 'Maximum character is 50 characters'
            ),
            'unique' => array(
                'rule' => array('unique', 'controller'),
                'message' => 'This controller is already registered'
            ),
            'valid' => array(
                'rule' => array('vController'),
                'message' => 'Required files do not exist. Model, Controller and View files must be exist'
            )
        )
    );
    
    var $belongsTo = array(
        'User' => array(
            'className' => 'User',
            'foreignKey' => 'created_by',
            'fields' => array('id', 'name')
        )
    );
    
    var $hasMany = array(
        'ModuleAction' => array(
            'dependent' => true
        )
    );
    
    var $cacheQueries = true;
    
    function afterSave($created) {
        $actions = array();
        if ( isset($this->data[$this->name]['actions']) ) {
            $actions = explode(' ', $this->data[$this->name]['actions']);
            // make sure unique action
            $actions = array_unique($actions);
        }
        
        // clean up non valid action such as empty action
        foreach ($actions as $key => $action) {
            if ( !preg_match('/^[^\d\s][a-zA-Z0-9_]*/', $action) ) {
                unset($actions[$key]);
            }
        }
    
        if ( !empty($actions) ) {
            if ( !(isset($this->id) && $this->id) ) {
                $this->id = $this->getLastInsertID();
            }
            
            if ( $created ) {
                // fresh actions
                $data = array('ModuleAction' => array());
                foreach ( $actions as $key => $action ) {
                    $data['ModuleAction'][$key]['name'] = $action;
                    $data['ModuleAction'][$key]['module_id'] = $this->id;
                    $data['ModuleAction'][$key]['created_by'] = $this->data[$this->name]['created_by'];
                }
                $this->ModuleAction->saveAll($data['ModuleAction']);
            } else {
                // temp save group permissions of this module
                $this->ModuleAction->bindModel(array(
                    'hasAndBelongsToMany' => array(
                        'Group' => array(
                            'className'              => 'Group',
                            'joinTable'              => 'groups_module_actions',
                            'foreignKey'             => 'module_action_id',
                            'associationForeignKey'  => 'group_id',
                            'unique'                 => true
                        )
                    )
                ));
                $this->ModuleAction->Behaviors->attach('Containable');
                $GroupModuleAction = $this->ModuleAction->find('all', array(
                    'conditions' => array(
                        'ModuleAction.module_id' => $this->id
                    ),
                    'fields' => array('ModuleAction.module_id', 'ModuleAction.name'),
                    'contain' => array(
                        'Group'
                    )
                ));
                $group_permissions = array();
                foreach ( $GroupModuleAction as $key => $val ) {
                    foreach ( $val['Group'] as $group ) {
                        $group_permissions[$group['id']][$val['ModuleAction']['name']] = 1;
                    }
                }
                
                // clear all related actions
                $this->ModuleAction->deleteAll(array(
                    'ModuleAction.module_id' => $this->id
                ));
                
                // then save
                $data = array('ModuleAction' => array());
                foreach ( $actions as $key => $action ) {
                    $data['ModuleAction'][$key]['name'] = $action;
                    $data['ModuleAction'][$key]['module_id'] = $this->id;
                    $data['ModuleAction'][$key]['modified_by'] = $this->data[$this->name]['modified_by'];
                }
                $this->ModuleAction->saveAll($data['ModuleAction']);
                
                // get all id of newly module_action
                $this->Behaviors->attach('Containable');
                $ModuleAction  = $this->ModuleAction->find('all', array(
                    'conditions' => array(
                        'ModuleAction.module_id' => $this->id
                    ),
                    'fields' => array('ModuleAction.id', 'ModuleAction.name'),
                    'contain' => array()
                ));
                
                $values_insert = array();
                foreach ( $ModuleAction as $action ) {
                    foreach ( $group_permissions as $group => $group_actions ) {
                        if ( array_key_exists($action['ModuleAction']['name'], $group_actions) ) {
                            $values_insert[] = '(' . $action['ModuleAction']['id'] . ',' . $group . ')';
                        }
                    }
                }
                $query = "INSERT INTO groups_module_actions(module_action_id, group_id) VALUES" . 
                          implode($values_insert, ',');
                
                // restore group permissions of this module
                $this->query($query);
            }
        }
        
        //return true;
        return $this->__refreshMenu();
    }
    
    function vController() {
        // views that must exist
        $views = array('index.ctp', 'add.ctp', 'edit.ctp');
        // make sure Model is exists
        $modelName = Inflector::singularize($this->data[$this->name]['controller']);
        
        if ( $modelName == 'page' ) {
            return true;
        }
        /*
        if ( !file_exists(ROOT . DS . APP_DIR . DS. 'models' . DS . $modelName . '.php') ) {
            $this->validationErrors['controller'] = "Model's file doesn't exist";
            return false;
        }
        */
        if ( !file_exists(ROOT . DS . APP_DIR . DS . 'controllers' . DS . $this->data[$this->name]['controller'] . '_controller.php') ) {
            $this->validationErrors['controller'] = "Controller's file doesn't exist";
            return false;
        }
        if ( !is_dir(ROOT . DS . APP_DIR . DS . 'views' . DS . $this->data[$this->name]['controller']) ) {
            if ($this->data[$this->name]['controller'] == 'pages') {
                break;
            }
            foreach ( $views as $view ) {
                if (!file_exists(ROOT . DS . 'views' . DS . $this->data[$this->name]['controller'] . DS . $view)) {
                    $this->validationErrors['controller'] = "$view file doesn't exist";
                    return false;
                }
            }
            
        }
        
        return true;
    }
}
?>
