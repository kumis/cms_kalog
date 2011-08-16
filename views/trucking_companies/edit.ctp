<div class="truckingCompanies form">
<?php echo $this->Form->create('TruckingCompany');?>
	<fieldset>
		<legend><?php __('Edit Trucking Company'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('name');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('TruckingCompany.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('TruckingCompany.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Trucking Companies', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Trucks', true), array('controller' => 'trucks', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Truck', true), array('controller' => 'trucks', 'action' => 'add')); ?> </li>
	</ul>
</div>