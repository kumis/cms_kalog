<?php
class UserlogComponent extends Object {
    var $model;
    var $modelName;
    var $excludeAction = array();
    var $name = 'Userlog';
    
    function initialize(&$controller, $settings = array()) {
        $this->controller = &$controller;
        
        if ( !isset($settings['model']) ) {
            $settings['model'] = 'UserLog';
        }
        
        $this->modelName = $settings['model'];
        
        if ( isset($settings['excludeAction']) ) {
            $this->excludeAction = $settings['excludeAction'];
        }
    }
    
    function write($user_id) {
        if ( !$this->model ) {
            $this->model = ClassRegistry::init($this->modelName);
        }
        
        if ( $this->model ) {
            // pass excluded actions
            $isExcludedAction = array_intersect(array($this->controller->params['action']), $this->excludeAction);
            if ( !$isExcludedAction ) {
                $data = array();
                $data[$this->modelName]['user_id'] = $user_id;
                $data[$this->modelName]['ip_address'] = $_SERVER['REMOTE_ADDR'];
                $data[$this->modelName]['controller'] = $this->controller->params['controller'];
                $data[$this->modelName]['action'] = $this->controller->params['action'];
                $data[$this->modelName]['request_method'] = $_SERVER['REQUEST_METHOD'];
                $data[$this->modelName]['referer'] = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
                $data[$this->modelName]['url'] = $_SERVER['REQUEST_URI'];
                $data[$this->modelName]['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
                $this->model->create();
                $this->model->save($data);
            }
        }
        
    }
    
    function getLastLogDatetime($user_id) {
        if ( $this->model ) {
            $result = $this->model->find('first', array(
                'conditions' => array(
                    $this->modelName . '.user_id' => $user_id
                ),
                'fields' => array($this->modelName . '.created'),
                'order' => $this->modelName . '.created DESC'
            ));
        }
        
        return isset($result[$this->modelName]['created']) ? $result[$this->modelName]['created'] : null;
    }
    
    function getActiveUsersToday() {
        if ( $this->model ) {
            $this->model->recursive = 1;
            $result = $this->model->find('all', array(
                'conditions' => array(
                    $this->modelName . '.created >=' => date('Y-m-d') . ' 00:00:00'
                ),
                'fields' => array(
                    'User.id', 'User.name', 'User.last_login',
                    'UserLog.created'
                ),
                'order' => $this->modelName . '.created DESC',
                'group' => $this->modelName . '.user_id'
            ));
        }
        
        return $result;
    }
}
