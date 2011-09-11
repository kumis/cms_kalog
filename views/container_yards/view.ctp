<div class="containerYards view">
<h2><?php  __('Container Yard');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerYard['ContainerYard']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerYard['ContainerYard']['name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Branch'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($containerYard['Branch']['name'], array('controller' => 'branches', 'action' => 'view', $containerYard['Branch']['id'])); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Container Yard', true), array('action' => 'edit', $containerYard['ContainerYard']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Container Yard', true), array('action' => 'delete', $containerYard['ContainerYard']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerYard['ContainerYard']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Yards', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Yard', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Branches', true), array('controller' => 'branches', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Branch', true), array('controller' => 'branches', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Yard Coordinates', true), array('controller' => 'container_yard_coordinates', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Yard Coordinate', true), array('controller' => 'container_yard_coordinates', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Container Yard Coordinates');?></h3>
	<?php if (!empty($containerYard['ContainerYardCoordinate'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Container Yard Id'); ?></th>
		<th><?php __('Coordinate Id'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($containerYard['ContainerYardCoordinate'] as $containerYardCoordinate):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $containerYardCoordinate['id'];?></td>
			<td><?php echo $containerYardCoordinate['container_yard_id'];?></td>
			<td><?php echo $containerYardCoordinate['coordinate_id'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'container_yard_coordinates', 'action' => 'view', $containerYardCoordinate['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'container_yard_coordinates', 'action' => 'edit', $containerYardCoordinate['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'container_yard_coordinates', 'action' => 'delete', $containerYardCoordinate['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerYardCoordinate['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Container Yard Coordinate', true), array('controller' => 'container_yard_coordinates', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
