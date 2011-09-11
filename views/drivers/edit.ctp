<div class="drivers form">
<?php echo $this->Form->create('Driver');?>
	<fieldset>
		<legend><?php __('Edit Driver'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('first_name');
		echo $this->Form->input('middle_name');
		echo $this->Form->input('last_name');
		echo $this->Form->input('license_id');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('Driver.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('Driver.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Drivers', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Licenses', true), array('controller' => 'licenses', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New License', true), array('controller' => 'licenses', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Trucks', true), array('controller' => 'trucks', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Truck', true), array('controller' => 'trucks', 'action' => 'add')); ?> </li>
	</ul>
</div>