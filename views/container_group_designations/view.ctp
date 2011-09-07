<div class="containerGroupDesignations view">
<h2><?php  __('Container Group Designation');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupDesignation['ContainerGroupDesignation']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Code'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupDesignation['ContainerGroupDesignation']['code']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Description'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupDesignation['ContainerGroupDesignation']['description']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Container Group'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($containerGroupDesignation['ContainerGroup']['code'], array('controller' => 'container_groups', 'action' => 'view', $containerGroupDesignation['ContainerGroup']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupDesignation['ContainerGroupDesignation']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupDesignation['ContainerGroupDesignation']['created_by']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupDesignation['ContainerGroupDesignation']['modified']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroupDesignation['ContainerGroupDesignation']['modified_by']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Container Group Designation', true), array('action' => 'edit', $containerGroupDesignation['ContainerGroupDesignation']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Container Group Designation', true), array('action' => 'delete', $containerGroupDesignation['ContainerGroupDesignation']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerGroupDesignation['ContainerGroupDesignation']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Group Designations', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Designation', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Groups', true), array('controller' => 'container_groups', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group', true), array('controller' => 'container_groups', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Group Types', true), array('controller' => 'container_group_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Type', true), array('controller' => 'container_group_types', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Container Group Types');?></h3>
	<?php if (!empty($containerGroupDesignation['ContainerGroupType'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Code'); ?></th>
		<th><?php __('Description'); ?></th>
		<th><?php __('Container Group Id'); ?></th>
		<th><?php __('Container Group Designation Id'); ?></th>
		<th><?php __('Created'); ?></th>
		<th><?php __('Created By'); ?></th>
		<th><?php __('Modified'); ?></th>
		<th><?php __('Modified By'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($containerGroupDesignation['ContainerGroupType'] as $containerGroupType):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $containerGroupType['id'];?></td>
			<td><?php echo $containerGroupType['code'];?></td>
			<td><?php echo $containerGroupType['description'];?></td>
			<td><?php echo $containerGroupType['container_group_id'];?></td>
			<td><?php echo $containerGroupType['container_group_designation_id'];?></td>
			<td><?php echo $containerGroupType['created'];?></td>
			<td><?php echo $containerGroupType['created_by'];?></td>
			<td><?php echo $containerGroupType['modified'];?></td>
			<td><?php echo $containerGroupType['modified_by'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'container_group_types', 'action' => 'view', $containerGroupType['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'container_group_types', 'action' => 'edit', $containerGroupType['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'container_group_types', 'action' => 'delete', $containerGroupType['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerGroupType['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Container Group Type', true), array('controller' => 'container_group_types', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
