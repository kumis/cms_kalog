<?php
class AppModel extends Model {
    
    function unique($data, $name){
        $this->reqursive = -1;
        $found = $this->find($this->name.".$name='".$data[$name]."'");
        $same = isset($this->id) && $found[$this->name]['id'] == $this->id;
        
        return !$found || $found && $same;
    }
    
    function checkByField() {
        //Get the name of the table
        $db =& ConnectionManager::getDataSource($this->useDbConfig);
        $tableName = $db->fullTableName($this, false);
        
        // cek if field created_by and modified_by is exists in current table
        $result = $this->query("SHOW COLUMNS FROM {$tableName} LIKE '%ed_by'");
        
        if ( isset( $result[0]['COLUMNS']['Type'] ) || isset( $result[0][0]['Type'] ) ) {
            return true;
        } else {
            return false;
        }
    }
    
    function cachedFindAll($conditions = null, $fields = null, $order = null, $limit = null, $page = 1, $recursive = null) {
        $findID = null;
        
        // constructs the findID
        if (is_array($conditions)) {
            $conditionsID = implode('.', $conditions);
        } else {
            $conditionsID = $conditions;
        }
        
        if (is_array($order)) {
            $orderID = implode('.', $order);
        } else {
            $orderID = $order;
        }
        
        if (is_array($fields)) {
            $fieldsID = implode('.', $fields);
        } else {
            $fieldsID = $fields;
        }
        
        $findID = md5($this->useTable . $conditionsID . $orderID . $fieldsID);
        
        if (!$findID) {
            return false;
        }
        
        // check to see if a cached version exists
        $cachedSQLFile = CACHE . DS . 'models' . DS . $findID . '_cached_data';
        if ( file_exists($cachedSQLFile) ) {
            // the file exists, so read the file and unserialize it.
            if (function_exists('file_get_contents')) {
                $serializedData = file_get_contents($cachedSQLFile);
            } else {
                $serializedData = implode('', file($cachedSQLFile));
            }
            $data = unserialize($serializedData);
        }
        
        if (!isset($data) || !is_array($data)) {
            /* either we can't find the variable and it doesn't exist, or the data
               isn't an array, so reload it */
            $data = $this->find('all', array(
                'conditions' => $conditions,
                'fields' => $fields,
                'order' => $order,
                'limit' => $limit,
                'page' => $page,
                'recursive' => $recursive
            ));
            
            // if it's there and the data was bad, delete the file
            if (file_exists($cachedSQLFile)) {
                @unlink(file_exists($cachedSQLFile));
            }
            
            // write the new, cached version
            $cacheFile = fopen($cachedSQLFile, 'w');
            fwrite($cacheFile, serialize($data));
            fclose($cacheFile);
        }
        
        return $data;
    }
    
    function cachedFind($conditions = null, $fields = null, $order = null, $recursive = null) {
        $data = $this->cachedFindAll($conditions, $fields, $order, 1, null, $recursive);
    
        if (empty($data[0])) {
            return false;
        }
        return $data[0];
    }
    
    function afterSave() {
        $this->__clearCachedData('_cached_data', 'model', '');
    }
    
    function __clearCachedData() {
        $folder = new Folder( CACHE );
        $cache =& Cache::getInstance();
        
        // configure cache object
        $cache->config('default', array('engine' => 'File', 'path' => CACHE . DS . 'models', 'prefix' => '', 'duration' => 86400));
        
        // cd to path of caches, relative to CACHE
        $folder->cd( CACHE . DS . 'models' );
        
        // find all *_cached_data files
        $caches = array();
        $caches = $folder->find('.*._cached_data');
        
        if ( count($caches) > 0 ) {         
            foreach ( $caches as $cachedData ) {
                @unlink( CACHE . 'models' . DS . $cachedData );
            }
        }
        
    }
    
    function __refreshMenu() {
        //echo CACHE . 'views' . DS . 'element_group_id_' . $this->data['Auth']['User']['group_id'] .  '_menu_sidebar';
        @unlink( CACHE . 'views' . DS . 'element_group_id_' . $this->data['Auth']['User']['group_id'] .  '_menu_sidebar' );
        return true;
    }

    function findDistinct($conditions = null, $fields = null){
        $db =& ConnectionManager::getDataSource($this->useDbConfig);

        $str = 'DISTINCT ';
        if (!is_array($fields)){
            $str .= '`' . $fields . '`';
        }else{
            foreach ($fields as $field){
                $str .= '`' . $field . '`, ';
            }
            $str = substr($str, 0, -2);   
        }
        $queryData = array(
                    'conditions'   => $conditions,
                    'fields'       => $str,
                    );
        $data = $db->read($this, $queryData, false);

        return $data;      
    }

}
?>
