<div class="containerDepos view">
<h2><?php  __('Container Depo');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerDepo['ContainerDepo']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerDepo['ContainerDepo']['name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Branch'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($containerDepo['Branch']['name'], array('controller' => 'branches', 'action' => 'view', $containerDepo['Branch']['id'])); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Container Depo', true), array('action' => 'edit', $containerDepo['ContainerDepo']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Container Depo', true), array('action' => 'delete', $containerDepo['ContainerDepo']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerDepo['ContainerDepo']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Depos', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Depo', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Branches', true), array('controller' => 'branches', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Branch', true), array('controller' => 'branches', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Depo Coordinates', true), array('controller' => 'container_depo_coordinates', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Depo Coordinate', true), array('controller' => 'container_depo_coordinates', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Container Depo Coordinates');?></h3>
	<?php if (!empty($containerDepo['ContainerDepoCoordinate'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Container Depo Id'); ?></th>
		<th><?php __('Coordinate Id'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($containerDepo['ContainerDepoCoordinate'] as $containerDepoCoordinate):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $containerDepoCoordinate['id'];?></td>
			<td><?php echo $containerDepoCoordinate['container_depo_id'];?></td>
			<td><?php echo $containerDepoCoordinate['coordinate_id'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'container_depo_coordinates', 'action' => 'view', $containerDepoCoordinate['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'container_depo_coordinates', 'action' => 'edit', $containerDepoCoordinate['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'container_depo_coordinates', 'action' => 'delete', $containerDepoCoordinate['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerDepoCoordinate['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Container Depo Coordinate', true), array('controller' => 'container_depo_coordinates', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
