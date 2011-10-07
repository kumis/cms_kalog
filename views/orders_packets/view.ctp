<div class="ordersPackets view">
<h2><?php  __('Orders Packet');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $ordersPacket['OrdersPacket']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Order'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($ordersPacket['Order']['id'], array('controller' => 'orders', 'action' => 'view', $ordersPacket['Order']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Packet'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($ordersPacket['Packet']['name'], array('controller' => 'packets', 'action' => 'view', $ordersPacket['Packet']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Quantity'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $ordersPacket['OrdersPacket']['quantity']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Orders Packet', true), array('action' => 'edit', $ordersPacket['OrdersPacket']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Orders Packet', true), array('action' => 'delete', $ordersPacket['OrdersPacket']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $ordersPacket['OrdersPacket']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Orders Packets', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Orders Packet', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Orders', true), array('controller' => 'orders', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Order', true), array('controller' => 'orders', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Packets', true), array('controller' => 'packets', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Packet', true), array('controller' => 'packets', 'action' => 'add')); ?> </li>
	</ul>
</div>
