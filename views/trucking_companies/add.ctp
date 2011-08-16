<div class="truckingCompanies form">
<?php echo $this->Form->create('TruckingCompany');?>
	<fieldset>
		<legend><?php __('Add Trucking Company'); ?></legend>
	<?php
		echo $this->Form->input('name');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Trucking Companies', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Trucks', true), array('controller' => 'trucks', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Truck', true), array('controller' => 'trucks', 'action' => 'add')); ?> </li>
	</ul>
</div>