<div class="trucks form">
<?php echo $this->Form->create('Truck');?>
	<fieldset>
		<legend><?php __('Add Truck'); ?></legend>
	<?php
		echo $this->Form->input('plate_number');
		echo $this->Form->input('driver_id');
		echo $this->Form->input('trucking_company_id');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Trucks', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Drivers', true), array('controller' => 'drivers', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Driver', true), array('controller' => 'drivers', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Trucking Companies', true), array('controller' => 'trucking_companies', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Trucking Company', true), array('controller' => 'trucking_companies', 'action' => 'add')); ?> </li>
	</ul>
</div>