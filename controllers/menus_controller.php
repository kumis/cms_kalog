<?php
class MenusController extends AppController {
    var $pageTitle    = 'Menus';
    var $prefixSelect = '';

	function view($id = null) {
		if (!$id) {
			$this->flash(__('Invalid Menu', true), array('action'=>'index'));
		}
		$this->set('menu', $this->Menu->read(null, $id));
	}
    
    function add() {
        if (!empty($this->data)) {
            $this->Session->delete('Group');    
        }
        
        parent::add();
    }
    
    function edit($id = null) {
        if (!empty($this->data)) {
            $this->Session->delete('Group');    
        }
        
        parent::edit($id);
    }
    
    function delete($id = null) {
		if (!$id) {
			$this->flash(__('Invalid Menu', true), array('action'=>'index'));
		}
        
		if ($this->Menu->del($id)) {
			$this->flash(__('Menu deleted', true), array('action'=>'index'));
		} else {
            // this is when delete operation failed
            $this->flash(__('Abort deleted', true), array('action'=>'index'));
		}
	}
    
    /**
     * Mendapatkan semua menu
     * Ini diakses melalui method requestAction oleh
     * element menu.call_name.ctp
     * 
     * @author gedex
     * @access public
     * @return mixed mengembalikan array berupa menu jika diakses oleh element
     *               jika diakses melalui URL maka akan mengembalikan false
     */
    function menu() {
        // hindari direquest melalui URL
        if ( isset($this->params['requested']) ) {
            
            $menu_types = $this->Session->read('Group.Menu');
            $available_menus = array();
            $available_menu_types = array();
            foreach ( $menu_types as $key => $menu ) {
                $available_menus[$menu['MenuType']['id']][$key] = $menu['id'];
                $available_menu_types[$menu['MenuType']['id']] = array(
                    'id' => $menu['MenuType']['id'],
                    'name' => $menu['MenuType']['name']
                );
            }
            
            $menus = array();
            foreach ( $available_menu_types as $menu_type ) {
                $conditions = array(
                    'Menu.id' => $available_menus[$menu_type['id']],
                    'Menu.enable' => 1,
                    'MenuType.id' => $menu_type['id']
                );
                
                $menus[$menu_type['id']] = $this->Menu->find('threaded',
                    array(
                        'conditions' => $conditions,
                        'order' => 'MenuType.name ASC'
                    )
                );
                foreach ($menus[$menu_type['id']] as $key => $menu) {
                    $menus[$menu_type['id']][$key]['Menu']['hasChild'] = 0;
                    if ( $this->Menu->childcount($menu['Menu']['id']) ) {
                        $menus[$menu_type['id']][$key]['Menu']['hasChild'] = 1;
                    }
                }
            }
            
            
            return array('lists' => $menus, 'names' => $available_menu_types);
        }
        
        return false;
    }
    
    /**
     * Mendapatkan semua menu
     * Ini diakses melalui method requestAction oleh
     * element menu.select.call_element.ctp
     * Tujuannya agar dapat dicaching selamanya
     * 
     * @author gedex
     * @access public
     * @return mixed mengembalikan array berupa menu jika diakses oleh element
     *               jika diakses melalui URL maka akan mengembalikan false
     */
    function menu_select() {
        // hindari direquest melalui URL
        if ( isset($this->params['requested']) ) {
            return $this->Menu->generateTreeList();
        }
        
        return false;
    }
    
    function menu_select_type() {
        // hindari direquest melalui URL
        if ( isset($this->params['requested']) ) {
            return $this->Menu->MenuType->find('list', array('fields' => array('id', 'name')));
        }
        
        return false;
    }
}
?>
