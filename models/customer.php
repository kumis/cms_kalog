<?php
class Customer extends AppModel {
	var $name = 'Customer';
	var $displayField = 'name';
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'ContactPerson' => array(
			'className' => 'ContactPerson',
			'foreignKey' => 'contact_person_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

	var $hasMany = array(
		'Agreement' => array(
			'className' => 'Agreement',
			'foreignKey' => 'customer_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);
    
    function beforeFind($queryData) {
        if(is_array($queryData['fields'])) {
            $key = array_search('Customer.type',$queryData['fields']);
            if($key) {
               unset($queryData['fields'][$key]); 
            }            
        }
        return $queryData;
    }
    
//    function afterFind($results) {
//        
//        foreach ($results as $key => $val) {
//            $conditions = array('Agreement.customer_id' => $results[$key]['Customer']['id']);
////            $agreements = $this->Agreement->find('all', array('conditions' =>  $conditions)); 
//            
////            echo "<pre>";
////            print_r($agreements);            
//            $results[$key]['Customer']['type'] = "xxx";
//        }
//        return $results;
//    }

}
?>