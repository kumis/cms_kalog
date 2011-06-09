<?php
class GroupsController extends AppController {
    var $pageTitle = 'Groups - Permission Management';
    function add() {
        $this->__setAdditionals();
        $this->set('module_actions', $this->Group->ModuleAction->find('list'));
        parent::add();
    }
    
    function edit($id = null) {
        if (!$id) {
            $this->Session->setFlash(__('Invalid parameter', true), 'error');
			$this->__redirect();
        }
        
        $this->__setAdditionals(false, $id);
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
			$messageFlashSuccess = (isset($this->niceName) ? $this->niceName : $this->modelName) . ' ' . __("successcully edited", true);
			$messageFlashError = (isset($this->niceName) ? $this->niceName : $this->modelName) . ' ' . __("cannot save this modification. Please fix the errors mentioned belows", true);
			
			if ($this->{$this->modelName}->save($this->data)) {
                // delete session group
                $this->Session->delete('Group');
                
				$this->Session->setFlash( $messageFlashSuccess, 'success');
                $this->__redirect('index');
			} else {
                $this->Session->setFlash($messageFlashError, 'error');
            }
		}
    }
    
    function __setAdditionals($add = true, $id = null) {
        ClassRegistry::init('Module');
        ClassRegistry::init('MenuType');
        $this->Module = new Module;
        $this->MenuType = new MenuType;
        $modules = $this->Module->find('all', array(
            'fields' => array('Module.id', 'Module.name', 'Module.controller'),
            'order' => 'Module.name ASC'
        ));
        $menus = $this->MenuType->find('all', array(
            'fields' => array('MenuType.id', 'MenuType.name', 'MenuType.call_name'),
            'order' => 'MenuType.name ASC'
        ));
        if (!$add) {
            $action_checked = $this->Group->GroupsModuleAction->find('list', array(
                'conditions' => array('GroupsModuleAction.group_id' => $id),
                'fields' => array('GroupsModuleAction.module_action_id', 'GroupsModuleAction.group_id')
            ));
            $this->set('action_checked', $action_checked);
            foreach ($modules as $i => $module) {
                foreach ( $module['ModuleAction'] as $j => $action ) {
                    if ( isset($action_checked[$action['id']]) ) {
                        $modules[$i]['ModuleAction'][$j]['checked'] = true;
                        $modules[$i]['Module']['checked'] = true;
                    }
                }
            }
            $menu_checked = $this->Group->GroupsMenu->find('list', array(
                'conditions' => array('GroupsMenu.group_id' => $id),
                'fields' => array('GroupsMenu.menu_id', 'GroupsMenu.group_id')
            ));
            $this->set('menu_checked', $menu_checked);
            foreach ($menus as $i => $menu) {
                foreach ( $menu['Menu'] as $j => $m ) {
                    if ( isset($menu_checked[$m['id']]) ) {
                        $menus[$i]['Menu'][$j]['checked'] = true;
                        $menus[$i]['MenuType']['checked'] = true;
                    }
                }
            }
        }
        $this->set('modules', $modules);
        $this->set('menus', $menus);
    }
}
?>
