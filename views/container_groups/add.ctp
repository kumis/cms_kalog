<div class="containerGroups form">
<?php echo $this->Form->create('ContainerGroup');?>
	<fieldset>
		<legend><?php __('Add Container Group'); ?></legend>
	<?php
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

		<li><?php echo $this->Html->link(__('List Container Groups', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Container Group Designations', true), array('controller' => 'container_group_designations', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Designation', true), array('controller' => 'container_group_designations', 'action' => 'add')); ?> </li>
	</ul>
</div>