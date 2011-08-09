<div class="licenseTypes view">
<h2><?php  __('License Type');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $licenseType['LicenseType']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $licenseType['LicenseType']['name']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit License Type', true), array('action' => 'edit', $licenseType['LicenseType']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete License Type', true), array('action' => 'delete', $licenseType['LicenseType']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $licenseType['LicenseType']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List License Types', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New License Type', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Licenses', true), array('controller' => 'licenses', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New License', true), array('controller' => 'licenses', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Licenses');?></h3>
	<?php if (!empty($licenseType['License'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('License Type Id'); ?></th>
		<th><?php __('Code'); ?></th>
		<th><?php __('Authorized By'); ?></th>
		<th><?php __('Issued Date'); ?></th>
		<th><?php __('Expired Date'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($licenseType['License'] as $license):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $license['id'];?></td>
			<td><?php echo $license['license_type_id'];?></td>
			<td><?php echo $license['code'];?></td>
			<td><?php echo $license['authorized_by'];?></td>
			<td><?php echo $license['issued_date'];?></td>
			<td><?php echo $license['expired_date'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'licenses', 'action' => 'view', $license['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'licenses', 'action' => 'edit', $license['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'licenses', 'action' => 'delete', $license['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $license['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New License', true), array('controller' => 'licenses', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
