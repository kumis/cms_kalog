<div class="tiers view">
<h2><?php  __('Tier');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $tier['Tier']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Code'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $tier['Tier']['code']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Tier', true), array('action' => 'edit', $tier['Tier']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Tier', true), array('action' => 'delete', $tier['Tier']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $tier['Tier']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Tiers', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Tier', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Coordinates', true), array('controller' => 'coordinates', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Coordinate', true), array('controller' => 'coordinates', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Coordinates');?></h3>
	<?php if (!empty($tier['Coordinate'])):?>
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
		foreach ($tier['Coordinate'] as $coordinate):
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
