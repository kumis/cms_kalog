<div class="ordersPackets form">
<?php echo $this->Form->create('OrdersPacket');?>
	<fieldset>
		<legend><?php __('Edit Orders Packet'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('order_id');
		echo $this->Form->input('packet_id');
		echo $this->Form->input('quantity');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('OrdersPacket.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('OrdersPacket.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Orders Packets', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Orders', true), array('controller' => 'orders', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Order', true), array('controller' => 'orders', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Packets', true), array('controller' => 'packets', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Packet', true), array('controller' => 'packets', 'action' => 'add')); ?> </li>
	</ul>
</div>