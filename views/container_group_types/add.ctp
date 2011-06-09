<div class="containerGroupTypes form">
<?php echo $this->Form->create('ContainerGroupType');?>
	<fieldset>
		<legend><?php __('Add Container Group Type'); ?></legend>
	<?php
		echo $this->Form->input('code');
		echo $this->Form->input('description');
		echo $this->Form->input('container_group_id');
		echo $this->Form->input('container_group_designation_id');
		echo $this->Form->input('created_by');
		echo $this->Form->input('modified_by');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Container Group Types', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Container Group Designations', true), array('controller' => 'container_group_designations', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Designation', true), array('controller' => 'container_group_designations', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Types', true), array('controller' => 'container_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Type', true), array('controller' => 'container_types', 'action' => 'add')); ?> </li>
	</ul>
</div>