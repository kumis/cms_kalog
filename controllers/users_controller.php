<?php
class UsersController extends AppController {
    var $pageTitle = 'User Management';
    
    function beforeFilter() {
        $this->Auth->fields = array(
            'username' => 'username',
            'password' => 'password'
        );
        $this->Auth->authenticate = ClassRegistry::init('User');
        $this->Auth->userScope = array('User.active' => true);
        $this->Auth->autoRedirect = false;
        parent::beforeFilter();
    }

/*
    function index() {
        $this->Auth->allow();
    }
*/
    function add() {
        $this->__setAdditionals();
        parent::add();
    }
    
    function edit($id = null) {
        $this->__setAdditionals();
        parent::edit($id);
    }
    
    function preferences($id = null) {
        
        if ( ($preferences = $this->Auth->user()) !== false ) {
            $this->__setAdditionals();
            // $this->data = $preferences;
        } else {
            $this->Auth->login();
        }
        
        $id = $this->Auth->user('id');
        
        if (!$id) {
            $this->Session->setFlash(__('Invalid parameter', true), 'error');
			$this->__redirect();
        }
        
		$this->set('id', $id);
        $this->{$this->modelName}->id = $id;
        if (!empty($this->data)) {
			$messageFlashSuccess = (isset($this->niceName) ? $this->niceName : $this->modelName) . ' ' . __("successcully edited", true);
			$messageFlashError = (isset($this->niceName) ? $this->niceName : $this->modelName) . ' ' . __("cannot save this modification. Please fix the errors mentioned belows", true);
			
            $this->data[$this->modelName]['group_id'] = $this->Auth->user('group_id');
			if ($this->{$this->modelName}->save($this->data)) {
				$this->Session->setFlash( $messageFlashSuccess, 'success');
                $this->__redirect('index');
			} else {
                $this->Session->setFlash($messageFlashError, 'error');
            }
		}
        
		if (empty($this->data)) {
			$this->data = $this->{$this->modelName}->find('first', array($this->modelName . '.id' => $id));
            
            if (!$this->data) {
                $this->Session->setFlash(__('Invalid parameter', true), 'error');
                $this->__redirect('index');
            }
		} else {
            $this->data[$this->modelName]['id'] = $id;
        }
    }

/**
 * Login here
 */
    function login() {
        if ($this->Auth->user()) {
            // save last login when login
            if (!empty($this->data['User']['username'])) {
                $this->User->id = $this->Auth->user('id');
                $this->User->saveField('last_login', date('Y-m-d H:i:s'));
            }
            
			if (!empty($this->data['User']['remember_me'])) {
				$cookie = array();
				$cookie['username'] = $this->data['User']['username'];
				$cookie['password'] = $this->data['User']['password'];
				$this->Cookie->write('Auth.User', $cookie, true, '+2 weeks');
                
				unset($this->data['User']['remember_me']);
			}
			
            $redirect = $this->Session->read('Auth.redirect');
            
            if ( is_null($redirect) || $redirect === '/users/logout' ) {
			    $this->Auth->loginRedirect = array('/');
            }
            $this->redirect($this->Auth->redirect());
		}
        
		if (empty($this->data)) {
			$cookie = $this->Cookie->read('Auth.User');
			if (!is_null($cookie)) {
				if ($this->Auth->login($cookie)) {
					//  Clear auth message, just in case we use it.
					$this->Session->delete('Message.auth');
                    
                    $redirect = $this->Session->read('Auth.redirect');
                    if ( is_null($redirect) || $redirect === '/users/logout' ) {
                        $this->Auth->loginRedirect = array('/');
                    }
					$this->redirect($this->Auth->redirect());
				}
			}
		}
        $this->layout = 'login';
        /*
        if ( $this->Auth->user('id') ) {
            $this->redirect('/');
        }
        $this->layout = 'login';
        */
    }

/**
 * Logout here
 */
    function logout() {
        $this->layout = 'login';
        
        // delete cookie
        $this->Cookie->delete('Auth');
        
        // delete last route
        $this->Session->delete('Auth.redirect');
        
        // delete permission and menu
        $this->Session->delete('Group');
        
        // delete site conf
        $this->Session->delete('Site');
        
        // delete message in auth
        $this->Session->delete('Message.auth');
        
        // redirect to login
        $this->redirect($this->Auth->logout());
    }

    function __setAdditionals($update = false) {
        // set unit_codes option
        $unit_codes = $this->User->UnitCode->find('list', array(
            'fields' => array('UnitCode.id', 'UnitCode.name'),
            'order' => 'UnitCode.name', 'recursive' => 0
        ));
        
        $this->set('unit_codes', $unit_codes);
        
        // set provinces option
        $provinces = $this->User->Province->find('all', array(
            'fields' => array('Province.id', 'Province.name'),
            'order' => 'Province.name', 'recursive' => 0
        ));
        $this->set(compact('provinces'));
        
        // set cities option
        $cities = $this->User->City->find('all', array(
            'fields' => array('City.id', 'City.name'),
            'order' => 'City.name', 'recursive' => 0
        ));
        $this->set(compact('cities'));
        
        // set groups option
        $groups = $this->User->Group->find('list', array(
            'fields' => array('Group.id', 'Group.name'),
            'order' => 'Group.name', 'recursive' => 0
        ));
        $this->set(compact('groups'));

        if ( $update ) {
            $cities = $this->User->City->find('all', array(
                'conditions' => array('City.province_id' => $this->data['User']['province_id']),
                'fields' => array('City.id', 'City.name'),
                'order' => 'City.name', 'recursive' => 0
            ));
            $this->set('cities', $cities);
        }
        
        // set ajax URL
        $prefix = parent::__pathToController() . '/getOptions';
        $this->set('ajaxURL', "var ajaxURL = '" . $prefix . "';");
    }
}
?>
