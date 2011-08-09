<?php
class AppController extends Controller {
    var $pageTitle = '';
    var $components    = array(
        'Auth', 'Session', 
        'Cookie', 'Captcha',
        'Userlog' => array(
            'model' => 'UserLog',
            'excludeAction' => array(
                'getParent', 'getDeep',
                'menu', 'menu_select', 'menu_select_type',
                'getOptions', 'get_options', 'secureimage',
                'getuser', 'getunit', 'istransacationexists'
            )
        )
    );
    var $helpers       = array('Html', 'Form', 'Javascript', 'Time', 'Tree', 'Session');
    var $paginate      = array('limit' => MAX_ROWS, 'page' => 1);
    var $modelName;
    
/**
 * This should be set according
 * to authentication
 * globalActions      - are actions that passed when checking isAuthorized
 * basicOperations    - are actions that set to view and being checked by tablegrid
 *                      or other views
 * module_permissions - this var is set when isAuthorized is called
 *                      and this value also set to view with same name
 * showAllExcept      - Id groups who can see all records 
 *                      if module's show_all set to false
 */
    var $globalActions = array(
        'getParent', 'getDeep', 'delete_rows', 'checkUnique', 'check_unique',
        'jsonize', 'getOptions', 'get_options', 'secureimage',
        'menu', 'menu_select', 'menu_select_type', 'login', 'logout', 'preferences',
        'display', 'getuser', 'getunit',
        '__setAdditionals', 'istransacationexists', 'permission_denied', 'fusionxml','authenticate',
        'gateinout','getstatus','gateout'
    );
    var $basicOperations = array(
        'add' => false, 'edit' => false, 'delete' => false,
        'view' => false, 'pdf' => false, 'csv' => false, 
        'print' => false
    );
    var $module_permission;
/**
 * set to group admin, so only admin can see all
 * records when show_all is set to false in current module / controller
 */
    var $showAllExcept = array(1, 23);
    
    function beforeFilter() {
        // read site settings and write it to session
        $Site = $this->Session->read('Site');
        if ( empty($Site) ) {
            ClassRegistry::init('SiteSetting');
            $Site = new SiteSetting;
            $this->Session->write('Site', $Site->find('list', array(
                'fields' => array('param', 'value')
            )));
        }
        
        // set default setting site
        Configure::write('Config.language', $this->Session->read('Site.default_lang'));
        
        // modelName is available to view
        $this->modelName =  Inflector::Singularize($this->name);
        $this->set( 'modelName', $this->modelName );
        // nama yg menyimpang dari behavior
        if ( isset($this->__xname) ) {
            $this->modelName =  $this->__xname;
            $this->set( 'modelName', $this->__xname );
        }
        
        $action = strtolower($this->params['action']);
        $controller = strtolower(Inflector::underscore($this->params['controller']));
        $this->set('action', $action);
        $this->set('controller', $controller);
        $this->set('title_for_layout', $this->pageTitle);
        
        // profile of users available to all views
        $profile = '';
        if ( $this->Auth->user('id') ) {
            // write log
            $this->Userlog->write( $this->Auth->user('id') );
            
            $showProfile = true;
            $profile = $this->Auth->user();
            $profile = $profile['User'];
            
            // group, module and menu permission
            // are set to session
            $group = $this->Session->read('Group');
           
			if ( is_null($group) ) {
                ClassRegistry::init('User');
                $this->User = new User;
                $this->User->Group->Behaviors->attach('Containable');
			    $group = $this->User->Group->find('first', array(
                    'contain' => array(
                        'Menu' => array(
                            'fields' => array(
                                'id', 'parent_id', 'name', 'url',
                                'element_id', 'enable', 'menu_type_id'
                            ),
                            'conditions' => array('Menu.enable' => 1),
                            'MenuType' => array(
                                'fields' => array('id', 'name', 'call_name')
                            )
                        ),
                        'ModuleAction' => array(
                            'fields' => array('id', 'module_id', 'name'),
                            'Module' => array(
                                'fields' => array('id', 'name', 'controller', 'show_all')
                            )
                        )
                    ),
                    'conditions' => array(
                        'Group.id' => $this->Auth->user('group_id')
                    )
                ));
                $this->Session->write('Group', $group);
                $this->set('group', $group);
			} else {
                //pr($this->Session->read('Group'));
            }
            
            
        }
        $this->set('profile', $profile);
        
        // form
        if ($action == 'add' || $action == 'edit') {
            // make sure created_by & modified by fields are filled, if table has that fields
            if ( !empty($this->data) ) {
                if ($this->{$this->modelName}->checkByField() ) {
                    if ($action == 'add') {
                        $this->data[$this->modelName]['created_by'] = $this->Auth->user('id');
                    } else if ($action == 'edit') {
                        $this->data[$this->modelName]['modified_by'] = $this->Auth->user('id');
                    }
                }
            }
        }
        
        // sends Auth data to data, usefull for model
        if ( !empty($this->data) && !isset($this->data['Auth']) ) {
            $this->data['Auth'] = $this->Auth->user();
        }
        
        // authorization is done via controller
        $this->Auth->authorize = 'controller';
        
        // is requested by ajax?
        if ( isset($this->params['url']['ajax']) && $this->params['url']['ajax'] ) {
            Configure::write('debug', 0);
            $this->layout = 'ajax';
        }
    }
   
/**
 * These are common action used by controller
 * Inherited to all subclass controller, can be overiden
 * by writing same method name on controller class.
 * Their views are placed in app/views/common
 *  
 * gedex
 */


/**
 * Global controller is used to post 
 * global data such as change languages
 * or theme
 */
    function globalcontroller() {
        // Configure::write('debug', 0);
        $this->autoRender = false;
        
    }
    
    // index for common tablegrid
    function index() {
        $this->__index();
		$this->set('formgrid', Helper::url('delete_rows'));
    }
    
    function __index() {
        $condition = array();
        
        // filter show all in tablegrid
        if ( !$this->module_permission['show_all'] ) {
            $condition[$this->modelName . '.created_by'] = $this->Auth->user('id');
            if ( !empty($this->showAllExcept) ) {
                $isShowAll = array_intersect(array($this->Auth->user('group_id')), $this->showAllExcept);
                if ( !empty($isShowAll) ) {
                    unset($condition[$this->modelName . '.created_by']);
                }
            }
        }
        
        // filter by field passed in tablegrid
        $str_fl = '';
        if ( isset($this->params['url']['search']) && $this->params['url']['search'] == 'Cari' ) {
            App::import('Sanitize');
            $filtered_link   = array();
            $filtered_link[] = '?search=Cari';
            
            
            foreach ( $this->params['url'] as $param => $value ) {
                if ( !empty($value) && $param != 'url' && $param != 'search' && $param != 'ref') {
                    $param_name = substr($param, 4);
                    $param_type = substr($param, 0, 4);
                    $filtered_link[] = $param . "=" . $value;
                    $this->set($param_name . "Value", $value);
                    
                    if ( $param_type == 'opt_' ) {
                        $equal = Sanitize::paranoid($value);
                        $condition[$this->modelName.".$param_name"] = $equal;
                    } else if ( $param_type == 'txt_' ) {
                        $like = '%' . Sanitize::paranoid($value, array('*', ' ', '-', '.')) . '%';
                        $condition[$this->modelName.".$param_name LIKE"] = $like;
                    }
                }
            }
            
            if (!empty($filtered_link)) {
                $str_fl = implode("&", $filtered_link);
            }   
        }
        
        $this->set('str_fl', $str_fl);
        $this->set('records', $this->paginate($condition));
    }
    
    function add() {
		$this->__add();
	}
    
    function __add() {
		if ( !empty($this->data) ) {
			$this->{$this->modelName}->create();
			$messageFlashSuccess = (isset($this->pageTitle) ? $this->pageTitle : $this->modelName) . ' ' . __('successfully added', true);
			$messageFlashError = (isset($this->pageTitle) ? $this->pageTitle : $this->modelName) . ' ' . __('cannot add this new record. Please fix the errors mentioned belows', true);
			if ($this->{$this->modelName}->save($this->data)) {
				$this->Session->setFlash( $messageFlashSuccess, 'success');
                $this->__redirect();
			} else {
                $this->Session->setFlash($messageFlashError, 'error');
			}
		}
	}
	
    function edit($id = null) {
        if (!$id) {
            $this->Session->setFlash(__('Invalid parameter', true), 'error');
			$this->__redirect();
        }
        
		$this->set('id', $id);
        $this->__edit();
        
		if (empty($this->data)) {
			$this->data = $this->{$this->modelName}->find('first', array(
                'conditions' => array($this->modelName . '.id' => $id)
            ));
            
            if (!$this->data) {
                $this->Session->setFlash(__('Invalid parameter', true), 'error');
                $this->__redirect('index');
            }
		} else {
            $this->data[$this->modelName]['id'] = $id;
        }
	}
    
    function __edit() {
		if (!empty($this->data)) {
			$messageFlashSuccess = (isset($this->pageTitle) ? $this->pageTitle : $this->modelName) . ' ' . __("successcully edited", true);
			$messageFlashError = (isset($this->pageTitle) ? $this->pageTitle : $this->modelName) . ' ' . __("cannot save this modification. Please fix the errors mentioned belows", true);
			
			if ($this->{$this->modelName}->save($this->data)) {
				$this->Session->setFlash( $messageFlashSuccess, 'success');
                $this->__redirect('index');
			} else {
                $this->Session->setFlash($messageFlashError, 'error');
            }
		}
    }
    
    // delete only one record, commonly found as a link in edit action
    function delete($id = null) {
		if ($this->{$this->modelName}->delete($id)) {
            $this->Session->setFlash(__("Record successfully deleted", true), 'success');
		} else {
            $this->Session->setFlash(__("Error deleting deleted", true), 'error');
		}
        $this->redirect(array('action' => 'index'));
	}
	
	function __redirect($action = 'index') {
        $this->redirect(array('action' => $action));
	}
    
    // delete rows in tablegrid by checked checkbox
    function delete_rows() {
        $this->layout   = 'ajax';
        $this->viewPath = 'common';
        
        if ( Configure::read('debug') > 0 ) {
            //Configure::write('debug', 0);
        }
    
		if ( !empty($this->data) ) {
		    $count = 0;
		    foreach ($this->data['rows'] as $row) {
		        $this->{$this->modelName}->delete($row);
                $count++;
		    }
		    $this->set('result', '<div class="flash_box flash_success">' . "$count " . __("record succesfully deleted", true) . '</div>');
		} else {
		    // someone accessing the url
            $this->Session->setFlash('Invalid URL', 'error');
	        $this->redirect(array('action'=>'index'));
		}
	}
    
    function checkUnique() {
        $this->layout = 'ajax';
	    $this->viewPath = "common";
        
        if ( Configure::read('debug') > 0 ) {
            Configure::write('debug', 0);
        }
        
        if ( !$this->params['named'] ) {
	        $this->Session->setFlash('Invalid parameter', 'error');
	        $this->redirect(array('action'=>'index'));
	    }
        foreach ($this->params['named'] as $field => $value) {
            $condition[Inflector::singularize($this->name).".$field"] = $value;
	    }
        $result = $this->{Inflector::singularize($this->name)}->hasAny($condition);
	    $this->set('result', $result);
    }
	
	function jsonize() {
	    $this->layout = 'json/default';
	    $this->viewPath = "common";
	    
        if ( Configure::read('debug') > 0 ) {
            Configure::write('debug', 0);
        }
        
	    if ( !$this->params['named'] ) {
	        $this->Session->setFlash('Invalid parameter for JSON', 'error');
	        $this->redirect(array('action'=>'index'));
	    }
	    
	    foreach ($this->params['named'] as $field => $value) {
	        $like = str_replace('*', '%', $value);
            $condition[Inflector::singularize($this->name).".$field LIKE"] = $like;
	    }
        $this->{Inflector::singularize($this->name)}->recursive = -1;
	    $result = $this->{Inflector::singularize($this->name)}->findAll($condition);
	    $this->set('result', $result);
	}
    
    function __pathToController() {
        $plugin = isset($this->params['plugin']) ? $this->params['plugin'] . '/' : '';
        return $this->webroot . $plugin . $this->params['controller'];
    }
    
    function __setOption($model, $name, $options) {
        if (!isset($options['conditions'])) {
            $options['conditions'] = null;
        }
        
        $parentModel = Inflector::singularize($this->name);    
        if ( isset($this->$parentModel->$model) ) {
            $this->$parentModel->$model->recursive = -1;
            ${$name} = $this->$parentModel->$model->find('list', array('fields' => $options['fields'], 'conditions' => $options['conditions']));
        } else {
            App::import('Model', "Setup.$model");
            $this->$model = new $model;
            $this->$model->recursive = -1;
            ${$name} = $this->$model->find('list', array('fields' => $options['fields'], 'conditions' => $options['conditions']));
        }
        
        $this->set($name, ${$name});
    }
	
	function getOptions() {
		$this->cacheAction = true;
        $this->layout = 'json/default';
        $this->viewPath = 'common';
        Configure::write('debug', 0);
        
		$plugin = isset($this->params['url']['plugin']) ? $this->params['url']['plugin'] . '.' : '';
        $model = $this->params['url']['model'];
		$field = $this->params['url']['field'];
        $belongsTo = $this->params['url']['belongsTo'];
        $belongsToId = $this->params['url']['belongsToId'];
        
		$belongsTos = explode(',', $belongsTo);
		$belongsToIds = explode(',', $belongsToId);
		if (count($belongsTos) > 1 && count($belongsToIds) > 1) {
			$conditions = array();
			foreach ($belongsTos as $key => $bt) {
				$conditions[$model.'.'.$bt] =  $belongsToIds[$key];
			}
		} else {
			$conditions = array($model.'.'.$belongsTo => $belongsToId);
        }
		if ( isset($this->{$this->modelName}->$model) && !isset($this->$model) ) {
			$this->$model = $this->{$this->modelName}->$model;
		}
		if ( !isset($this->$model) ) {
	        App::import('Model', "$plugin$model");
	        $this->$model = new $model;
		}
        $this->$model->recursive = -1;
        
        // hardcode for activity here
        if ( $model == 'Activity' ) {
            $results = $this->Activity->find('all', array(
                'fields' => array('id', 'code', 'name'),
                'recursive' => -1,
                'conditions' => $conditions
            ));
            $result = array();
            foreach ($results as $r) {
                $result[$r['Activity']['id']] = $r['Activity']['name'] .
                    ' (' . $r['Activity']['code'] . ')';
            }
        } else {
            $result = $this->$model->find('list', array(
                'fields' => array($model.'.id', $model.".$field"),
                'conditions' => $conditions)
            );
        }
        
	    $this->set('result', $result);
    }

/**
 * Methods related to security
 * secureimage - For captcha
 * isAuthorized - For authorization
 */
    function securimage(){
        $this->layout = 'ajax'; //a blank layout
        
        if (Configure::read('debug') > 0) {
            Configure::write('debug', 0);
        }

        if ( isset($this->params['url']['audio']) && $this->params['url']['audio'] ) {
            $this->captcha->audio_format = (isset($_GET['format']) && in_array(strtolower($_GET['format']), array('mp3', 'wav')) ? strtolower($_GET['format']) : 'mp3');
            $this->set( 'captcha_data', $this->captcha->outputAudioFile() );
        } else {
            $this->set( 'captcha_data', $this->captcha->show('') ); //dynamically creates an image
        }
    }
    
    function permission_denied() {
        Configure::write('debug', 0);
        
        if ( isset($this->params['url']['ajax']) && $this->params['url']['ajax'] ) {
            $this->layout = 'ajax';
        }
        
        $this->viewPath = 'common';
        $this->set('message', "You don't have access to this module.");
    }
    
    function isAuthorized() {
        if ( !$this->Session->read('Group') ) {
            return false;
        }
        
        // pass global actions
        $isGlobalAction = array_intersect(array($this->action), $this->globalActions);
        if ( !empty($isGlobalAction) ) {
            return true;
        }
        
        // check permission based on action and controller
        $permissions = $this->Session->read('Group.ModuleAction'); 
        $controller = Inflector::underscore($this->params['controller']);
        $allowed = false;
        foreach ( $permissions as $permission ) {
            if ( $this->action == $permission['name'] && $permission['Module']['controller'] == $controller ) {
                
                // set permitable operation on current controller
                $operations = $this->basicOperations;
                foreach ( $permissions as $permitable ) {
                    if ( $permitable['module_id'] == $permission['module_id'] ) {
                        $operations[$permitable['name']] = true;
                    }
                }
                $module_permission = array(
                    'module_id' => $permission['id'],
                    'show_all' => $permission['Module']['show_all'],
                    'operations' => $operations
                );
                
                // module permission are set to view
                // so you can customize your view according to permitable 
                // operation
                $this->module_permission = $module_permission;
                $this->set('module_permission', $module_permission);
                $allowed = true;
                
                break; // exit loop after current action and controller are found
            }
        }
        
        // is requested by ajax?
        // make it forbidden for ajax
        if ( !$allowed ) {
            $this->redirect(array('action' => 'permission_denied'));
        }
        
        return $allowed;
    }
    
    function getMonthName($m = 1) {
        $m = $m*1;
        $w = '';
        if ($m > 0 && $m <= 12) {
            switch($m) {
                case 1:
                    $w = 'Januari';
                    break;
                case 2:
                    $w = 'Februari';
                    break;
                case 3:
                    $w = 'Maret';
                    break;
                case 4:
                    $w = 'April';
                    break;
                case 5:
                    $w = 'Mei';
                    break;
                case 6:
                    $w = 'Juni';
                    break;
                case 7:
                    $w = 'Juli';
                    break;
                case 8:
                    $w = 'Agustus';
                    break;
                case 9:
                    $w = 'September';
                    break;
                case 10:
                    $w = 'Oktober';
                    break;
                case 11:
                    $w = 'November';
                    break;
                case 12:
                    $w = 'Desember';
                    break;
            }
        }
        
        return $w;
    }
    
}
?>
