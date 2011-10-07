<?php
class OrdersPacketsController extends AppController {

	var $name = 'OrdersPackets';
    var $pageTitle = 'OrdersPackets';
    var $components = array('Cholesterol.Jqgrid');
	var $helpers = array('Cholesterol.Jqgrid', 'Cholesterol.Autocomplete');
    
	function index() {
//		$this->Order->recursive = 0;
//		$this->set('orders', $this->paginate());
        $this->__setJSONForAutocomplete('Debtor', $this->Order,'debtor', array('name'=>'name'));
        $this->__setJSONForAutocomplete('Creditor', $this->Order,'creditor', array('name'=>'name'));
       
        //$this->set('autocompleteData',$customers);
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid orders packet', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('ordersPacket', $this->OrdersPacket->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->OrdersPacket->create();
			if ($this->OrdersPacket->save($this->data)) {
				$this->Session->setFlash(__('The orders packet has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The orders packet could not be saved. Please, try again.', true));
			}
		}
		$orders = $this->OrdersPacket->Order->find('list');
		$packets = $this->OrdersPacket->Packet->find('list');
		$this->set(compact('orders', 'packets'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid orders packet', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->OrdersPacket->save($this->data)) {
				$this->Session->setFlash(__('The orders packet has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The orders packet could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->OrdersPacket->read(null, $id);
		}
		$orders = $this->OrdersPacket->Order->find('list');
		$packets = $this->OrdersPacket->Packet->find('list');
		$this->set(compact('orders', 'packets'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for orders packet', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->OrdersPacket->delete($id)) {
			$this->Session->setFlash(__('Orders packet deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Orders packet was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
    
//==============================================================================
// Start of JqGrid functions
//==============================================================================
	function jqgrid_list() {
		$this->OrdersPacket->Behaviors->attach('Containable');
		$this->Jqgrid->find('OrdersPacket', array(
			'contain' => array(
				'Packet.id',
                'Packet.name'
			),
            'fields' => array(
				"OrdersPacket.id",
				"OrdersPacket.quantity",
				"Packet.name",
			),
            'order' => array(
                "OrdersPacket.id"
            ),
			'recursive' => 1,
		));
	}

    function jqgrid_edit() {        
        switch ($this->params['form']['oper']) {
            case 'edit' :
                $this->OrdersPacket->saveAll($this->data);
                //$this->Driver->save($this->data);
                break;
            case 'add' :
                $this->OrdersPacket->save($this->data);
                break;
        }
    }
//==============================================================================
// End of JqGrid functions
//==============================================================================    
}
?>
