<div class="packets form">
<?php echo $this->Form->create('Packet');?>
	<fieldset>
		<legend><?php __('Add Packet'); ?></legend>
	<?php
		echo $this->Form->input('name');
		echo $this->Form->input('Service');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
