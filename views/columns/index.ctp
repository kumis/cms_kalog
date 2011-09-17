<div class="columns index">
	<h2><?php __('Columns');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('code');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($columns as $column):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $column['Column']['id']; ?>&nbsp;</td>
		<td><?php echo $column['Column']['code']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $column['Column']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $column['Column']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $column['Column']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $column['Column']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Column', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Coordinates', true), array('controller' => 'coordinates', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Coordinate', true), array('controller' => 'coordinates', 'action' => 'add')); ?> </li>
	</ul>
</div>