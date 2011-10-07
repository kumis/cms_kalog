<div class="packetsServices index">
	<h2><?php __('Packets Services');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('packet_id');?></th>
			<th><?php echo $this->Paginator->sort('service_id');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($packetsServices as $packetsService):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $packetsService['PacketsService']['id']; ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($packetsService['Packet']['name'], array('controller' => 'packets', 'action' => 'view', $packetsService['Packet']['id'])); ?>
		</td>
		<td>
			<?php echo $this->Html->link($packetsService['Service']['name'], array('controller' => 'services', 'action' => 'view', $packetsService['Service']['id'])); ?>
		</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $packetsService['PacketsService']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $packetsService['PacketsService']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $packetsService['PacketsService']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $packetsService['PacketsService']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Packets Service', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Packets', true), array('controller' => 'packets', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Packet', true), array('controller' => 'packets', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Services', true), array('controller' => 'services', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Service', true), array('controller' => 'services', 'action' => 'add')); ?> </li>
	</ul>
</div>