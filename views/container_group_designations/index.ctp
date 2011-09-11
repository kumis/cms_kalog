<div class="containerGroupDesignations index">
	<h2><?php __('Container Group Designations');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('code');?></th>
			<th><?php echo $this->Paginator->sort('description');?></th>
			<th><?php echo $this->Paginator->sort('container_group_id');?></th>
			<th><?php echo $this->Paginator->sort('created');?></th>
			<th><?php echo $this->Paginator->sort('created_by');?></th>
			<th><?php echo $this->Paginator->sort('modified');?></th>
			<th><?php echo $this->Paginator->sort('modified_by');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($containerGroupDesignations as $containerGroupDesignation):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $containerGroupDesignation['ContainerGroupDesignation']['id']; ?>&nbsp;</td>
		<td><?php echo $containerGroupDesignation['ContainerGroupDesignation']['code']; ?>&nbsp;</td>
		<td><?php echo $containerGroupDesignation['ContainerGroupDesignation']['description']; ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($containerGroupDesignation['ContainerGroup']['code'], array('controller' => 'container_groups', 'action' => 'view', $containerGroupDesignation['ContainerGroup']['id'])); ?>
		</td>
		<td><?php echo $containerGroupDesignation['ContainerGroupDesignation']['created']; ?>&nbsp;</td>
		<td><?php echo $containerGroupDesignation['ContainerGroupDesignation']['created_by']; ?>&nbsp;</td>
		<td><?php echo $containerGroupDesignation['ContainerGroupDesignation']['modified']; ?>&nbsp;</td>
		<td><?php echo $containerGroupDesignation['ContainerGroupDesignation']['modified_by']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $containerGroupDesignation['ContainerGroupDesignation']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $containerGroupDesignation['ContainerGroupDesignation']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $containerGroupDesignation['ContainerGroupDesignation']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerGroupDesignation['ContainerGroupDesignation']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Container Group Designation', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Container Groups', true), array('controller' => 'container_groups', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group', true), array('controller' => 'container_groups', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Group Types', true), array('controller' => 'container_group_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Type', true), array('controller' => 'container_group_types', 'action' => 'add')); ?> </li>
	</ul>
</div>