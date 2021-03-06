<div class="containerWidths index">
	<h2><?php __('Container Widths');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('min_millimeter');?></th>
			<th><?php echo $this->Paginator->sort('max_millimeter');?></th>
			<th><?php echo $this->Paginator->sort('min_feet');?></th>
			<th><?php echo $this->Paginator->sort('max_feet');?></th>
			<th><?php echo $this->Paginator->sort('min_inch');?></th>
			<th><?php echo $this->Paginator->sort('max_inch');?></th>
			<th><?php echo $this->Paginator->sort('created');?></th>
			<th><?php echo $this->Paginator->sort('created_by');?></th>
			<th><?php echo $this->Paginator->sort('modified');?></th>
			<th><?php echo $this->Paginator->sort('modified_by');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($containerWidths as $containerWidth):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $containerWidth['ContainerWidth']['id']; ?>&nbsp;</td>
		<td><?php echo $containerWidth['ContainerWidth']['min_millimeter']; ?>&nbsp;</td>
		<td><?php echo $containerWidth['ContainerWidth']['max_millimeter']; ?>&nbsp;</td>
		<td><?php echo $containerWidth['ContainerWidth']['min_feet']; ?>&nbsp;</td>
		<td><?php echo $containerWidth['ContainerWidth']['max_feet']; ?>&nbsp;</td>
		<td><?php echo $containerWidth['ContainerWidth']['min_inch']; ?>&nbsp;</td>
		<td><?php echo $containerWidth['ContainerWidth']['max_inch']; ?>&nbsp;</td>
		<td><?php echo $containerWidth['ContainerWidth']['created']; ?>&nbsp;</td>
		<td><?php echo $containerWidth['ContainerWidth']['created_by']; ?>&nbsp;</td>
		<td><?php echo $containerWidth['ContainerWidth']['modified']; ?>&nbsp;</td>
		<td><?php echo $containerWidth['ContainerWidth']['modified_by']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $containerWidth['ContainerWidth']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $containerWidth['ContainerWidth']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $containerWidth['ContainerWidth']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerWidth['ContainerWidth']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Container Width', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'add')); ?> </li>
	</ul>
</div>