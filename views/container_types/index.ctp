<div class="containerTypes index">
	<h2><?php __('Container Types');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('container_length_id');?></th>
			<th><?php echo $this->Paginator->sort('container_heights_container_widths_id');?></th>
			<th><?php echo $this->Paginator->sort('container_group_type_id');?></th>
			<th><?php echo $this->Paginator->sort('created');?></th>
			<th><?php echo $this->Paginator->sort('created_by');?></th>
			<th><?php echo $this->Paginator->sort('modified');?></th>
			<th><?php echo $this->Paginator->sort('modified_by');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($containerTypes as $containerType):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $containerType['ContainerType']['id']; ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($containerType['ContainerLength']['code'], array('controller' => 'container_lengths', 'action' => 'view', $containerType['ContainerLength']['id'])); ?>
		</td>
		<td>
			<?php echo $this->Html->link($containerType['ContainerHeightsContainerWidths']['id'], array('controller' => 'container_heights_container_widths', 'action' => 'view', $containerType['ContainerHeightsContainerWidths']['id'])); ?>
		</td>
		<td>
			<?php echo $this->Html->link($containerType['ContainerGroupType']['code'], array('controller' => 'container_group_types', 'action' => 'view', $containerType['ContainerGroupType']['id'])); ?>
		</td>
		<td><?php echo $containerType['ContainerType']['created']; ?>&nbsp;</td>
		<td><?php echo $containerType['ContainerType']['created_by']; ?>&nbsp;</td>
		<td><?php echo $containerType['ContainerType']['modified']; ?>&nbsp;</td>
		<td><?php echo $containerType['ContainerType']['modified_by']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $containerType['ContainerType']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $containerType['ContainerType']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $containerType['ContainerType']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerType['ContainerType']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Container Type', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Container Lengths', true), array('controller' => 'container_lengths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Length', true), array('controller' => 'container_lengths', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Group Types', true), array('controller' => 'container_group_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Type', true), array('controller' => 'container_group_types', 'action' => 'add')); ?> </li>
	</ul>
</div>