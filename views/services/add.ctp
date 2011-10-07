<div class="services form">
<?php echo $this->Form->create('Service');?>
	<fieldset>
		<legend><?php __('Add Service'); ?></legend>
	<?php
		echo $this->Form->input('name');
		echo $this->Form->input('default_debitur');
		echo $this->Form->input('default_creditur');
		echo $this->Form->input('Packet');
		echo $this->Form->input('Document');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Services', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Service Charges', true), array('controller' => 'service_charges', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Service Charge', true), array('controller' => 'service_charges', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Packets', true), array('controller' => 'packets', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Packet', true), array('controller' => 'packets', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Documents', true), array('controller' => 'documents', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Document', true), array('controller' => 'documents', 'action' => 'add')); ?> </li>
	</ul>
</div>