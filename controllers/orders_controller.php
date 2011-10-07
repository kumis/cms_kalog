<?php
class OrdersController extends AppController {

	var $name = 'Orders';
    var $pageTitle = 'Order';
    var $components = array('Cholesterol.Jqgrid');
	var $helpers = array('Cholesterol.Jqgrid', 'Cholesterol.Autocomplete');

	function index() {
//		$this->Order->recursive = 0;
//		$this->set('orders', $this->paginate());
        //pr($this->Order->find('all'));
        $this->__setJSONForAutocomplete('Debtor', $this->Order,'debtor', array('name'=>'name'));
        $this->__setJSONForAutocomplete('Creditor', $this->Order,'creditor', array('name'=>'name'));
       
        //$this->set('autocompleteData',$customers);
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid order', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('order', $this->Order->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Order->create();
			if ($this->Order->save($this->data)) {
				$this->Session->setFlash(__('The order has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The order could not be saved. Please, try again.', true));
			}
		}
		$packages = $this->Order->Package->find('list');
		$containerTypes = $this->Order->ContainerType->find('list');
		$this->set(compact('packages', 'containerTypes'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid order', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Order->save($this->data)) {
				$this->Session->setFlash(__('The order has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The order could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Order->read(null, $id);
		}
		$packages = $this->Order->Package->find('list');
		$containerTypes = $this->Order->ContainerType->find('list');
		$this->set(compact('packages', 'containerTypes'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for order', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Order->delete($id)) {
			$this->Session->setFlash(__('Order deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Order was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
//==============================================================================
// Start of JqGrid functions
//==============================================================================
	function jqgrid_list() {
		$this->Order->Behaviors->attach('Containable');
		$this->Jqgrid->find('Order', array(
			'contain' => array(
				'Debtor.id',
                'Debtor.name',
				'Creditor.id',
                'Creditor.name',
                'Creditor.name',
/*
                'OrderPacket.order_id',
                'OrderPacket.packet_id',
*/
/*
                'Packet.id',
                'Packet.name'
*/
			),
            'fields' => array(
				"Order.id",
				"Order.debtor",
                "Order.creditor",
                "Order.date",
				"Debtor.name",
                "Creditor.name",
/*
                "OrderPacket.order_id",
                "OrderPacket.packet_id",
*/
/*
                "Packet.id",
                "Packet.name"
*/
			),
            'order' => array(
                "Order.id"
            ),
			'recursive' => 2,
		));
	}

    function jqgrid_edit() {        
        switch ($this->params['form']['oper']) {
            case 'edit' :
                $this->Order->saveAll($this->data);
                //$this->Driver->save($this->data);
                break;
            case 'add' :
                $this->Order->save($this->data);
                break;
        }
    }
//==============================================================================
// End of JqGrid functions
//==============================================================================
}
?>
