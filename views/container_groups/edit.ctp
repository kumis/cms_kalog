<div class="containerGroups form">
<?php echo $this->Form->create('ContainerGroup');?>
	<fieldset>
		<legend><?php __('Edit Container Group'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('code');
		echo $this->Form->input('description');
		echo $this->Form->input('created_by');
		echo $this->Form->input('modified_by');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('ContainerGroup.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('ContainerGroup.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Container Groups', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Container Group Designations', true), array('controller' => 'container_group_designations', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Designation', true), array('controller' => 'container_group_designations', 'action' => 'add')); ?> </li>
	</ul>
</div>