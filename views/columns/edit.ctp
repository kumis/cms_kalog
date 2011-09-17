<div class="columns form">
<?php echo $this->Form->create('Column');?>
	<fieldset>
		<legend><?php __('Edit Column'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('code');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('Column.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('Column.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Columns', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Coordinates', true), array('controller' => 'coordinates', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Coordinate', true), array('controller' => 'coordinates', 'action' => 'add')); ?> </li>
	</ul>
</div>