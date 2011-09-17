<div class="columns view">
<h2><?php  __('Column');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $column['Column']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Code'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $column['Column']['code']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Column', true), array('action' => 'edit', $column['Column']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Column', true), array('action' => 'delete', $column['Column']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $column['Column']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Columns', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Column', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Coordinates', true), array('controller' => 'coordinates', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Coordinate', true), array('controller' => 'coordinates', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Coordinates');?></h3>
	<?php if (!empty($column['Coordinate'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Block Id'); ?></th>
		<th><?php __('Column Id'); ?></th>
		<th><?php __('Row Id'); ?></th>
		<th><?php __('Tier Id'); ?></th>
		<th><?php __('Container Id'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($column['Coordinate'] as $coordinate):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $coordinate['id'];?></td>
			<td><?php echo $coordinate['block_id'];?></td>
			<td><?php echo $coordinate['column_id'];?></td>
			<td><?php echo $coordinate['row_id'];?></td>
			<td><?php echo $coordinate['tier_id'];?></td>
			<td><?php echo $coordinate['container_id'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'coordinates', 'action' => 'view', $coordinate['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'coordinates', 'action' => 'edit', $coordinate['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'coordinates', 'action' => 'delete', $coordinate['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $coordinate['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Coordinate', true), array('controller' => 'coordinates', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
