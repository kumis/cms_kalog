<div class="containerTypes form">
<?php echo $this->Form->create('ContainerType');?>
	<fieldset>
		<legend><?php __('Add Container Type'); ?></legend>
	<?php
		echo $this->Form->input('container_length_id');
		echo $this->Form->input('container_heights_container_widths_id');
		echo $this->Form->input('container_group_type_id');
		echo $this->Form->input('created_by');
		echo $this->Form->input('modified_by');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Container Types', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Container Lengths', true), array('controller' => 'container_lengths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Length', true), array('controller' => 'container_lengths', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Group Types', true), array('controller' => 'container_group_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Type', true), array('controller' => 'container_group_types', 'action' => 'add')); ?> </li>
	</ul>
</div>