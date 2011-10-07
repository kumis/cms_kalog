<?php
class ContainerTypesController extends AppController {

	var $name = 'ContainerTypes';

	function index() {
		$this->ContainerType->recursive = 0;
		$this->set('containerTypes', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid container type', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('containerType', $this->ContainerType->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->ContainerType->create();
			if ($this->ContainerType->save($this->data)) {
				$this->Session->setFlash(__('The container type has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container type could not be saved. Please, try again.', true));
			}
		}
		$containerLengths = $this->ContainerType->ContainerLength->find('list');
		$containerHeightsContainerWidths = $this->ContainerType->ContainerHeightsContainerWidth->find('list');
		$containerGroupTypes = $this->ContainerType->ContainerGroupType->find('list');
		$this->set(compact('containerLengths', 'containerHeightsContainerWidths', 'containerGroupTypes'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid container type', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->ContainerType->save($this->data)) {
				$this->Session->setFlash(__('The container type has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The container type could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->ContainerType->read(null, $id);
		}
		$containerLengths = $this->ContainerType->ContainerLength->find('list');
		$containerHeightsContainerWidths = $this->ContainerType->ContainerHeightsContainerWidth->find('list');
		$containerGroupTypes = $this->ContainerType->ContainerGroupType->find('list');
		$this->set(compact('containerLengths', 'containerHeightsContainerWidths', 'containerGroupTypes'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for container type', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->ContainerType->delete($id)) {
			$this->Session->setFlash(__('Container type deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Container type was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
    
    function jqgrid_list(){
        $this->Container->Behaviors->attach('Containable');
		$this->Jqgrid->find('Container', array(
			'contain' => array(
				'ContainerGroupType.id',
                'ContainerGroupType.code'
			),
            'fields' => array(
				"ContainerType.id",
				"Container.container_no",
                "ContainerGroupType.code"
			),
            'order' => array(
                "Container.id"
            ),
			'recursive' => 0,
		));
        
    }
}
?>
