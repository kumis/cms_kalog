<div class="containerHeightsContainerWidths form">
<?php echo $this->Form->create('ContainerHeightsContainerWidth');?>
	<fieldset>
		<legend><?php __('Add Container Heights Container Width'); ?></legend>
	<?php
		echo $this->Form->input('code');
		echo $this->Form->input('container_height_id');
		echo $this->Form->input('container_width_id');
		echo $this->Form->input('created_by');
		echo $this->Form->input('modified_by');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Container Heights Container Widths', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Container Heights', true), array('controller' => 'container_heights', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Height', true), array('controller' => 'container_heights', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Widths', true), array('controller' => 'container_widths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Width', true), array('controller' => 'container_widths', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Types', true), array('controller' => 'container_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Type', true), array('controller' => 'container_types', 'action' => 'add')); ?> </li>
	</ul>
</div>