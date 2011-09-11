<div class="locations form">
<?php echo $this->Form->create('Location');?>
	<fieldset>
		<legend><?php __('Edit Location'); ?></legend>
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

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('Location.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('Location.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Locations', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Branches', true), array('controller' => 'branches', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Branch', true), array('controller' => 'branches', 'action' => 'add')); ?> </li>
	</ul>
</div>