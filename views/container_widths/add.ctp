<div class="containerWidths form">
<?php echo $this->Form->create('ContainerWidth');?>
	<fieldset>
		<legend><?php __('Add Container Width'); ?></legend>
	<?php
		echo $this->Form->input('min_millimeter');
		echo $this->Form->input('max_millimeter');
		echo $this->Form->input('min_feet');
		echo $this->Form->input('max_feet');
		echo $this->Form->input('min_inch');
		echo $this->Form->input('max_inch');
		echo $this->Form->input('created_by');
		echo $this->Form->input('modified_by');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Container Widths', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'add')); ?> </li>
	</ul>
</div>