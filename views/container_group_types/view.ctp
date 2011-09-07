<div class="containerGroupTypes view">
<h2><?php  __('Container Group Type');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupType['ContainerGroupType']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Code'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupType['ContainerGroupType']['code']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Description'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupType['ContainerGroupType']['description']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Container Group Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupType['ContainerGroupType']['container_group_id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Container Group Designation'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($containerGroupType['ContainerGroupDesignation']['code'], array('controller' => 'container_group_designations', 'action' => 'view', $containerGroupType['ContainerGroupDesignation']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupType['ContainerGroupType']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupType['ContainerGroupType']['created_by']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupType['ContainerGroupType']['modified']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupType['ContainerGroupType']['modified_by']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Container Group Type', true), array('action' => 'edit', $containerGroupType['ContainerGroupType']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Container Group Type', true), array('action' => 'delete', $containerGroupType['ContainerGroupType']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerGroupType['ContainerGroupType']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Group Types', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Type', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Group Designations', true), array('controller' => 'container_group_designations', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Designation', true), array('controller' => 'container_group_designations', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Types', true), array('controller' => 'container_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Type', true), array('controller' => 'container_types', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Container Types');?></h3>
	<?php if (!empty($containerGroupType['ContainerType'])):?>
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
		foreach ($containerGroupType['ContainerType'] as $containerType):
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
