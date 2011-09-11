<div class="containerHeightsContainerWidths index">
	<h2><?php __('Container Heights Container Widths');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('code');?></th>
			<th><?php echo $this->Paginator->sort('container_height_id');?></th>
			<th><?php echo $this->Paginator->sort('container_width_id');?></th>
			<th><?php echo $this->Paginator->sort('created');?></th>
			<th><?php echo $this->Paginator->sort('created_by');?></th>
			<th><?php echo $this->Paginator->sort('modified');?></th>
			<th><?php echo $this->Paginator->sort('modified_by');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($containerHeightsContainerWidths as $containerHeightsContainerWidth):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['id']; ?>&nbsp;</td>
		<td><?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['code']; ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($containerHeightsContainerWidth['ContainerHeight']['id'], array('controller' => 'container_heights', 'action' => 'view', $containerHeightsContainerWidth['ContainerHeight']['id'])); ?>
		</td>
		<td>
			<?php echo $this->Html->link($containerHeightsContainerWidth['ContainerWidth']['id'], array('controller' => 'container_widths', 'action' => 'view', $containerHeightsContainerWidth['ContainerWidth']['id'])); ?>
		</td>
		<td><?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['created']; ?>&nbsp;</td>
		<td><?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['created_by']; ?>&nbsp;</td>
		<td><?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['modified']; ?>&nbsp;</td>
		<td><?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['modified_by']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Container Heights Container Width', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Container Heights', true), array('controller' => 'container_heights', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Height', true), array('controller' => 'container_heights', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Widths', true), array('controller' => 'container_widths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Width', true), array('controller' => 'container_widths', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Types', true), array('controller' => 'container_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Type', true), array('controller' => 'container_types', 'action' => 'add')); ?> </li>
	</ul>
</div>