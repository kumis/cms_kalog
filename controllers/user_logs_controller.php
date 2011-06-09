<?php
class UserLogsController extends AppController {
    var $pageTitle = 'Log Pengguna';
    
    function index() {
        $this->UserLog->recursive = 1;
        $this->paginate['order']['UserLog.created'] = 'DESC';
        parent::index();
    }
}
?>