<?php
class UserLog extends AppModel {
    var $name = 'UserLog';
    var $belongsTo = array('User');
    var $recursive = -1;
    var $maxRecord = 1000;
    
    function afterSave() {
        $total = $this->find('count')*1;
        
        if ( $total >= $this->maxRecord ) {
            $this->deleteAll(
                array(
                    'UserLog.created <' => date('Y-m-d') . ' 00:00:00'
                ), false
            );
        }
        
    }
}
?>
