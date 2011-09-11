<div class="containerTypes view">
<h2><?php  __('Container Type');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerType['ContainerType']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Container Length'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($containerType['ContainerLength']['code'], array('controller' => 'container_lengths', 'action' => 'view', $containerType['ContainerLength']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Container Heights Container Widths'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($containerType['ContainerHeightsContainerWidths']['id'], array('controller' => 'container_heights_container_widths', 'action' => 'view', $containerType['ContainerHeightsContainerWidths']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Container Group Type'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($containerType['ContainerGroupType']['code'], array('controller' => 'container_group_types', 'action' => 'view', $containerType['ContainerGroupType']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerType['ContainerType']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerType['ContainerType']['created_by']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerType['ContainerType']['modified']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $containerType['ContainerType']['modified_by']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Container Type', true), array('action' => 'edit', $containerType['ContainerType']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Container Type', true), array('action' => 'delete', $containerType['ContainerType']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $containerType['ContainerType']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Types', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Type', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Lengths', true), array('controller' => 'container_lengths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Length', true), array('controller' => 'container_lengths', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Heights Container Widths', true), array('controller' => 'container_heights_container_widths', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Container Group Types', true), array('controller' => 'container_group_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Container Group Type', true), array('controller' => 'container_group_types', 'action' => 'add')); ?> </li>
	</ul>
</div>
