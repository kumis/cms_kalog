<div class="containerYards form">
<?php echo $this->Form->create('ContainerYard');?>
	<fieldset>
		<legend><?php __('Edit Container Yard'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('name');
		echo $this->Form->input('branch_id');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('ContainerYard.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('ContainerYard.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Container Yards', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Branches', true), array('controller' => 'branches', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Branch', true), array('controller' => 'branches', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Yard Coordinates', true), array('controller' => 'container_yard_coordinates', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Yard Coordinate', true), array('controller' => 'container_yard_coordinates', 'action' => 'add')); ?> </li>
	</ul>
</div>