<div class="containerGroupTypes index">
	<h2><?php __('Container Group Types');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('code');?></th>
			<th><?php echo $this->Paginator->sort('description');?></th>
			<th><?php echo $this->Paginator->sort('container_group_id');?></th>
			<th><?php echo $this->Paginator->sort('container_group_designation_id');?></th>
			<th><?php echo $this->Paginator->sort('created');?></th>
			<th><?php echo $this->Paginator->sort('created_by');?></th>
			<th><?php echo $this->Paginator->sort('modified');?></th>
			<th><?php echo $this->Paginator->sort('modified_by');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($containerGroupTypes as $containerGroupType):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $containerGroupType['ContainerGroupType']['id']; ?>&nbsp;</td>
		<td><?php echo $containerGroupType['ContainerGroupType']['code']; ?>&nbsp;</td>
		<td><?php echo $containerGroupType['ContainerGroupType']['description']; ?>&nbsp;</td>
		<td><?php echo $containerGroupType['ContainerGroupType']['container_group_id']; ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($containerGroupType['ContainerGroupDesignation']['code'], array('controller' => 'container_group_designations', 'action' => 'view', $containerGroupType['ContainerGroupDesignation']['id'])); ?>
		</td>
		<td><?php echo $containerGroupType['ContainerGroupType']['created']; ?>&nbsp;</td>
		<td><?php echo $containerGroupType['ContainerGroupType']['created_by']; ?>&nbsp;</td>
		<td><?php echo $containerGroupType['ContainerGroupType']['modified']; ?>&nbsp;</td>
		<td><?php echo $containerGroupType['ContainerGroupType']['modified_by']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $containerGroupType['ContainerGroupType']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $containerGroupType['ContainerGroupType']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $containerGroupType['ContainerGroupType']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerGroupType['ContainerGroupType']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Container Group Type', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Container Group Designations', true), array('controller' => 'container_group_designations', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Designation', true), array('controller' => 'container_group_designations', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Types', true), array('controller' => 'container_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Type', true), array('controller' => 'container_types', 'action' => 'add')); ?> </li>
	</ul>
</div>