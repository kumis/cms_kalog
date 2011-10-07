<div class="packetsServices form">
<?php echo $this->Form->create('PacketsService');?>
	<fieldset>
		<legend><?php __('Edit Packets Service'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('packet_id');
		echo $this->Form->input('service_id');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('PacketsService.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('PacketsService.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Packets Services', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Packets', true), array('controller' => 'packets', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Packet', true), array('controller' => 'packets', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Services', true), array('controller' => 'services', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Service', true), array('controller' => 'services', 'action' => 'add')); ?> </li>
	</ul>
</div>