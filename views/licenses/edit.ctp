<div class="licenses form">
<?php echo $this->Form->create('License');?>
	<fieldset>
		<legend><?php __('Edit License'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('license_type_id');
		echo $this->Form->input('code');
		echo $this->Form->input('authorized_by');
		echo $this->Form->input('issued_date');
		echo $this->Form->input('expired_date');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('License.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('License.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Licenses', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List License Types', true), array('controller' => 'license_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New License Type', true), array('controller' => 'license_types', 'action' => 'add')); ?> </li>
	</ul>
</div>