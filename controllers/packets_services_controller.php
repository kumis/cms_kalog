<?php
class PacketsServicesController extends AppController {

	var $name = 'PacketsServices';

	function index() {
		$this->PacketsService->recursive = 0;
		$this->set('packetsServices', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid packets service', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('packetsService', $this->PacketsService->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->PacketsService->create();
			if ($this->PacketsService->save($this->data)) {
				$this->Session->setFlash(__('The packets service has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The packets service could not be saved. Please, try again.', true));
			}
		}
		$packets = $this->PacketsService->Packet->find('list');
		$services = $this->PacketsService->Service->find('list');
		$this->set(compact('packets', 'services'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid packets service', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->PacketsService->save($this->data)) {
				$this->Session->setFlash(__('The packets service has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The packets service could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->PacketsService->read(null, $id);
		}
		$packets = $this->PacketsService->Packet->find('list');
		$services = $this->PacketsService->Service->find('list');
		$this->set(compact('packets', 'services'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for packets service', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->PacketsService->delete($id)) {
			$this->Session->setFlash(__('Packets service deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Packets service was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
