<div class="licenses index">
	<h2><?php __('Licenses');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('license_type_id');?></th>
			<th><?php echo $this->Paginator->sort('code');?></th>
			<th><?php echo $this->Paginator->sort('authorized_by');?></th>
			<th><?php echo $this->Paginator->sort('issued_date');?></th>
			<th><?php echo $this->Paginator->sort('expired_date');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($licenses as $license):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $license['License']['id']; ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($license['LicenseType']['name'], array('controller' => 'license_types', 'action' => 'view', $license['LicenseType']['id'])); ?>
		</td>
		<td><?php echo $license['License']['code']; ?>&nbsp;</td>
		<td><?php echo $license['License']['authorized_by']; ?>&nbsp;</td>
		<td><?php echo $license['License']['issued_date']; ?>&nbsp;</td>
		<td><?php echo $license['License']['expired_date']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $license['License']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $license['License']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $license['License']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $license['License']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New License', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List License Types', true), array('controller' => 'license_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New License Type', true), array('controller' => 'license_types', 'action' => 'add')); ?> </li>
	</ul>
</div>