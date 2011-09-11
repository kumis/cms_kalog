<div class="licenses view">
<h2><?php  __('License');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $license['License']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('License Type'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($license['LicenseType']['name'], array('controller' => 'license_types', 'action' => 'view', $license['LicenseType']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Code'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $license['License']['code']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Authorized By'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $license['License']['authorized_by']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Issued Date'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $license['License']['issued_date']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Expired Date'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $license['License']['expired_date']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit License', true), array('action' => 'edit', $license['License']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete License', true), array('action' => 'delete', $license['License']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $license['License']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Licenses', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New License', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List License Types', true), array('controller' => 'license_types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New License Type', true), array('controller' => 'license_types', 'action' => 'add')); ?> </li>
	</ul>
</div>
