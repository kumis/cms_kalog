<div class="blocks index">
	<h2><?php __('Blocks');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('code');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($blocks as $block):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $block['Block']['id']; ?>&nbsp;</td>
		<td><?php echo $block['Block']['code']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $block['Block']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $block['Block']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $block['Block']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $block['Block']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Block', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Coordinates', true), array('controller' => 'coordinates', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Coordinate', true), array('controller' => 'coordinates', 'action' => 'add')); ?> </li>
	</ul>
</div>