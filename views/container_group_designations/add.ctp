<div class="containerGroupDesignations form">
<?php echo $this->Form->create('ContainerGroupDesignation');?>
	<fieldset>
		<legend><?php __('Add Container Group Designation'); ?></legend>
	<?php
		echo $this->Form->input('code');
		echo $this->Form->input('description');
		echo $this->Form->input('container_group_id');
		echo $this->Form->input('created_by');
		echo $this->Form->input('modified_by');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Container Group Designations', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Container Groups', true), array('controller' => 'container_groups', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group', true), array('controller' => 'container_groups', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Group Types', true), array('controller' => 'container_group_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Type', true), array('controller' => 'container_group_types', 'action' => 'add')); ?> </li>
	</ul>
</div>