<div class="containerYards index">
	<h2><?php __('Container Yards');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('name');?></th>
			<th><?php echo $this->Paginator->sort('branch_id');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($containerYards as $containerYard):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $containerYard['ContainerYard']['id']; ?>&nbsp;</td>
		<td><?php echo $containerYard['ContainerYard']['name']; ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($containerYard['Branch']['name'], array('controller' => 'branches', 'action' => 'view', $containerYard['Branch']['id'])); ?>
		</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $containerYard['ContainerYard']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $containerYard['ContainerYard']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $containerYard['ContainerYard']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerYard['ContainerYard']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Container Yard', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Branches', true), array('controller' => 'branches', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Branch', true), array('controller' => 'branches', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Yard Coordinates', true), array('controller' => 'container_yard_coordinates', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Yard Coordinate', true), array('controller' => 'container_yard_coordinates', 'action' => 'add')); ?> </li>
	</ul>
</div>