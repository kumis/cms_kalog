<div class="containerWidths view">
<h2><?php  __('Container Width');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Min Millimeter'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['min_millimeter']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Max Millimeter'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['max_millimeter']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Min Feet'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['min_feet']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Max Feet'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['max_feet']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Min Inch'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['min_inch']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Max Inch'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['max_inch']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['created_by']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['modified']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerWidth['ContainerWidth']['modified_by']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Container Width', true), array('action' => 'edit', $containerWidth['ContainerWidth']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Container Width', true), array('action' => 'delete', $containerWidth['ContainerWidth']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerWidth['ContainerWidth']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Widths', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Width', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Container Heights Container Widths');?></h3>
	<?php if (!empty($containerWidth['ContainerHeightsContainerWidths'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Code'); ?></th>
		<th><?php __('Container Height Id'); ?></th>
		<th><?php __('Container Width Id'); ?></th>
		<th><?php __('Created'); ?></th>
		<th><?php __('Created By'); ?></th>
		<th><?php __('Modified'); ?></th>
		<th><?php __('Modified By'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($containerWidth['ContainerHeightsContainerWidths'] as $containerHeightsContainerWidths):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $containerHeightsContainerWidths['id'];?></td>
			<td><?php echo $containerHeightsContainerWidths['code'];?></td>
			<td><?php echo $containerHeightsContainerWidths['container_height_id'];?></td>
			<td><?php echo $containerHeightsContainerWidths['container_width_id'];?></td>
			<td><?php echo $containerHeightsContainerWidths['created'];?></td>
			<td><?php echo $containerHeightsContainerWidths['created_by'];?></td>
			<td><?php echo $containerHeightsContainerWidths['modified'];?></td>
			<td><?php echo $containerHeightsContainerWidths['modified_by'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'container_heights_container_widths', 'action' => 'view', $containerHeightsContainerWidths['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'container_heights_container_widths', 'action' => 'edit', $containerHeightsContainerWidths['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'container_heights_container_widths', 'action' => 'delete', $containerHeightsContainerWidths['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerHeightsContainerWidths['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
