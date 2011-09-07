<div class="licenseTypes form">
<?php echo $this->Form->create('LicenseType');?>
	<fieldset>
		<legend><?php __('Add License Type'); ?></legend>
	<?php
		echo $this->Form->input('name');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List License Types', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Licenses', true), array('controller' => 'licenses', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New License', true), array('controller' => 'licenses', 'action' => 'add')); ?> </li>
	</ul>
</div>