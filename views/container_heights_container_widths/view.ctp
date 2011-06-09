<div class="containerHeightsContainerWidths view">
<h2><?php  __('Container Heights Container Width');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Code'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['code']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Container Height'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($containerHeightsContainerWidth['ContainerHeight']['id'], array('controller' => 'container_heights', 'action' => 'view', $containerHeightsContainerWidth['ContainerHeight']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Container Width'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($containerHeightsContainerWidth['ContainerWidth']['id'], array('controller' => 'container_widths', 'action' => 'view', $containerHeightsContainerWidth['ContainerWidth']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['created_by']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['modified']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['modified_by']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Container Heights Container Width', true), array('action' => 'edit', $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Container Heights Container Width', true), array('action' => 'delete', $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerHeightsContainerWidth['ContainerHeightsContainerWidth']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Heights Container Widths', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Heights Container Width', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Heights', true), array('controller' => 'container_heights', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Height', true), array('controller' => 'container_heights', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Widths', true), array('controller' => 'container_widths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Width', true), array('controller' => 'container_widths', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Types', true), array('controller' => 'container_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Type', true), array('controller' => 'container_types', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Container Types');?></h3>
	<?php if (!empty($containerHeightsContainerWidth['ContainerType'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Container Length Id'); ?></th>
		<th><?php __('Container Heights Container Widths Id'); ?></th>
		<th><?php __('Container Group Type Id'); ?></th>
		<th><?php __('Created'); ?></th>
		<th><?php __('Created By'); ?></th>
		<th><?php __('Modified'); ?></th>
		<th><?php __('Modified By'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($containerHeightsContainerWidth['ContainerType'] as $containerType):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $containerType['id'];?></td>
			<td><?php echo $containerType['container_length_id'];?></td>
			<td><?php echo $containerType['container_heights_container_widths_id'];?></td>
			<td><?php echo $containerType['container_group_type_id'];?></td>
			<td><?php echo $containerType['created'];?></td>
			<td><?php echo $containerType['created_by'];?></td>
			<td><?php echo $containerType['modified'];?></td>
			<td><?php echo $containerType['modified_by'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'container_types', 'action' => 'view', $containerType['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'container_types', 'action' => 'edit', $containerType['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'container_types', 'action' => 'delete', $containerType['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerType['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Container Type', true), array('controller' => 'container_types', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
