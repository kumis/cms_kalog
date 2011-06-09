<?php
class SiteSettingsController extends AppController {
    var $pageTitle = 'Site Settings';
 
    function index(){
		pr($this->Auth);
		//pr($this->Session);
		parent::index();
	}

}
?>
