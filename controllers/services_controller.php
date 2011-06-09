<?php
Class ServicesController extends AppController{
	var $uses=array();
	var $pageTitle='';
	
	function beforeFilter(){
		parent::beforeFilter();
		$this->Auth->allow('*');
	}
	
	function beforeRender(){
		$this->layout='json/default';
	}
	
	function authenticate(){
		Configure::write('debug',0);
		//$this->layout='json/default';
		$respon=0;
		$dt_all=array();
		App::import('Model',array('User','VehicleCategory'));
		if(isset($_POST) && !empty($_POST)){
			$this->User = new User;
			$this->VehicleCategory = new VehicleCategory;
			$this->User->Behaviors->attach('Containable');
			$cekuser= $this->User->find('first',array(
			'conditions'=>array(
				'User.username'=>$_POST['username'],
				'User.password'=>sha1($_POST['password'])
			),
			'contain' => false
			));
			if(isset($cekuser['User']['id'])){
				$this->VehicleCategory->Behaviors->attach('Containable');
				$dt_vehicle=$this->VehicleCategory->find('all',array('contain' => false));
				$dt_tmp_vehicle['Vehicle'] = $dt_vehicle;  
				$dt_all = array_merge($dt_tmp_vehicle,$cekuser);
			}			
		}
		$this->set('dt_all',$dt_all);
	}
	
	function cekauth(){
		
	}
	
	function gatein(){
		Configure::write('debug',0);
		App::import('Model',array('Parking','VehicleCategory','Member'));
		$this->Member = new Member;
		$this->VehicleCategory = new VehicleCategory;
		$this->Parking = new Parking; 
		
		if (isset($_POST)) {
			$this->Parking->create();
			if ( $this->Parking->save($_POST) ) {
				$this->set('layout', 1);
			} else {
				$this->set('layout', 0);
			}
		} else {
			$this->set('layout', 0);
		}
	}
	
	function getstatus(){
		Configure::write('debug',0);
		App::import('Model',array('Parking'));
		$this->Parking =  new Parking;
		if (isset($_POST)&& !empty($_POST)) {
			$this->Parking->recursive = 1;
			$dt_parking = $this->Parking->find('all', array(
			'conditions'=>array('Parking.vehicle_no' => $_POST['vehicle_no'] ,
								'Parking.status' => 0
						)
			));
			$this->set('dtstatus',$dt_parking);
			
		}
	}
}
?>
