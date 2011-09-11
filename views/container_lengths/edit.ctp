<div class="containerLengths form">
<?php echo $this->Form->create('ContainerLength');?>
	<fieldset>
		<legend><?php __('Edit Container Length'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('code');
		echo $this->Form->input('millimeter');
		echo $this->Form->input('feet');
		echo $this->Form->input('inch');
		echo $this->Form->input('created_by');
		echo $this->Form->input('modified_by');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('ContainerLength.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('ContainerLength.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Container Lengths', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Container Types', true), array('controller' => 'container_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Type', true), array('controller' => 'container_types', 'action' => 'add')); ?> </li>
	</ul>
</div>