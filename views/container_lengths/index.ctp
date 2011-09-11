<div class="containerLengths index">
	<h2><?php __('Container Lengths');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('code');?></th>
			<th><?php echo $this->Paginator->sort('millimeter');?></th>
			<th><?php echo $this->Paginator->sort('feet');?></th>
			<th><?php echo $this->Paginator->sort('inch');?></th>
			<th><?php echo $this->Paginator->sort('created');?></th>
			<th><?php echo $this->Paginator->sort('created_by');?></th>
			<th><?php echo $this->Paginator->sort('modified');?></th>
			<th><?php echo $this->Paginator->sort('modified_by');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($containerLengths as $containerLength):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $containerLength['ContainerLength']['id']; ?>&nbsp;</td>
		<td><?php echo $containerLength['ContainerLength']['code']; ?>&nbsp;</td>
		<td><?php echo $containerLength['ContainerLength']['millimeter']; ?>&nbsp;</td>
		<td><?php echo $containerLength['ContainerLength']['feet']; ?>&nbsp;</td>
		<td><?php echo $containerLength['ContainerLength']['inch']; ?>&nbsp;</td>
		<td><?php echo $containerLength['ContainerLength']['created']; ?>&nbsp;</td>
		<td><?php echo $containerLength['ContainerLength']['created_by']; ?>&nbsp;</td>
		<td><?php echo $containerLength['ContainerLength']['modified']; ?>&nbsp;</td>
		<td><?php echo $containerLength['ContainerLength']['modified_by']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $containerLength['ContainerLength']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $containerLength['ContainerLength']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $containerLength['ContainerLength']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerLength['ContainerLength']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Container Length', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Container Types', true), array('controller' => 'container_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Type', true), array('controller' => 'container_types', 'action' => 'add')); ?> </li>
	</ul>
</div>