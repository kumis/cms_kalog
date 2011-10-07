<div class="ordersPackets index">
	<h2><?php __('Orders Packets');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('order_id');?></th>
			<th><?php echo $this->Paginator->sort('packet_id');?></th>
			<th><?php echo $this->Paginator->sort('quantity');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($ordersPackets as $ordersPacket):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $ordersPacket['OrdersPacket']['id']; ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($ordersPacket['Order']['id'], array('controller' => 'orders', 'action' => 'view', $ordersPacket['Order']['id'])); ?>
		</td>
		<td>
			<?php echo $this->Html->link($ordersPacket['Packet']['name'], array('controller' => 'packets', 'action' => 'view', $ordersPacket['Packet']['id'])); ?>
		</td>
		<td><?php echo $ordersPacket['OrdersPacket']['quantity']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $ordersPacket['OrdersPacket']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $ordersPacket['OrdersPacket']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $ordersPacket['OrdersPacket']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $ordersPacket['OrdersPacket']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
	));
	?>	</p>

	<div class="paging">
		<?php echo $this->Paginator->prev('<< ' . __('previous', true), array(), null, array('class'=>'disabled'));?>
	 | 	<?php echo $this->Paginator->numbers();?>
 |
		<?php echo $this->Paginator->next(__('next', true) . ' >>', array(), null, array('class' => 'disabled'));?>
	</div>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('New Orders Packet', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Orders', true), array('controller' => 'orders', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Order', true), array('controller' => 'orders', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Packets', true), array('controller' => 'packets', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Packet', true), array('controller' => 'packets', 'action' => 'add')); ?> </li>
	</ul>
</div>