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
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Packets', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Services', true), array('controller' => 'services', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Service', true), array('controller' => 'services', 'action' => 'add')); ?> </li>
	</ul>
</div>