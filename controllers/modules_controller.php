<?php
class ModulesController extends AppController {
    var $pageTitle = 'Module Management';
    
    function edit($id) {
        parent::edit($id);
        $this->data[$this->modelName]['actions'] = '';
        $actions = array();
        if ( isset($this->data['ModuleAction']) && !empty($this->data['ModuleAction']) ) {
            foreach ( $this->data['ModuleAction'] as $key => $action ) {
                $actions[$key] = $action['name'];
            }
            $this->data[$this->modelName]['actions'] = implode($actions, ' ');
        }
    }
}
?>