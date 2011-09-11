<div class="containerGroups view">
<h2><?php  __('Container Group');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroup['ContainerGroup']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Code'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroup['ContainerGroup']['code']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Description'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroup['ContainerGroup']['description']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroup['ContainerGroup']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroup['ContainerGroup']['created_by']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroup['ContainerGroup']['modified']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerGroup['ContainerGroup']['modified_by']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Container Group', true), array('action' => 'edit', $containerGroup['ContainerGroup']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Container Group', true), array('action' => 'delete', $containerGroup['ContainerGroup']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerGroup['ContainerGroup']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Groups', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Group Designations', true), array('controller' => 'container_group_designations', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Designation', true), array('controller' => 'container_group_designations', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Container Group Designations');?></h3>
	<?php if (!empty($containerGroup['ContainerGroupDesignation'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Code'); ?></th>
		<th><?php __('Description'); ?></th>
		<th><?php __('Container Group Id'); ?></th>
		<th><?php __('Created'); ?></th>
		<th><?php __('Created By'); ?></th>
		<th><?php __('Modified'); ?></th>
		<th><?php __('Modified By'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($containerGroup['ContainerGroupDesignation'] as $containerGroupDesignation):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $containerGroupDesignation['id'];?></td>
			<td><?php echo $containerGroupDesignation['code'];?></td>
			<td><?php echo $containerGroupDesignation['description'];?></td>
			<td><?php echo $containerGroupDesignation['container_group_id'];?></td>
			<td><?php echo $containerGroupDesignation['created'];?></td>
			<td><?php echo $containerGroupDesignation['created_by'];?></td>
			<td><?php echo $containerGroupDesignation['modified'];?></td>
			<td><?php echo $containerGroupDesignation['modified_by'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'container_group_designations', 'action' => 'view', $containerGroupDesignation['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'container_group_designations', 'action' => 'edit', $containerGroupDesignation['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'container_group_designations', 'action' => 'delete', $containerGroupDesignation['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerGroupDesignation['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Container Group Designation', true), array('controller' => 'container_group_designations', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
