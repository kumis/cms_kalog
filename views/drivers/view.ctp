<div class="drivers view">
<h2><?php  __('Driver');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $driver['Driver']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('First Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $driver['Driver']['first_name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Middle Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $driver['Driver']['middle_name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Last Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $driver['Driver']['last_name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('License'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($driver['License']['code'], array('controller' => 'licenses', 'action' => 'view', $driver['License']['id'])); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Driver', true), array('action' => 'edit', $driver['Driver']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Driver', true), array('action' => 'delete', $driver['Driver']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $driver['Driver']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Drivers', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Driver', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Licenses', true), array('controller' => 'licenses', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New License', true), array('controller' => 'licenses', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Trucks', true), array('controller' => 'trucks', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Truck', true), array('controller' => 'trucks', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Trucks');?></h3>
	<?php if (!empty($driver['Truck'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Plate Number'); ?></th>
		<th><?php __('Driver Id'); ?></th>
		<th><?php __('Trucking Company Id'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($driver['Truck'] as $truck):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $truck['id'];?></td>
			<td><?php echo $truck['plate_number'];?></td>
			<td><?php echo $truck['driver_id'];?></td>
			<td><?php echo $truck['trucking_company_id'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'trucks', 'action' => 'view', $truck['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'trucks', 'action' => 'edit', $truck['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'trucks', 'action' => 'delete', $truck['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $truck['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Truck', true), array('controller' => 'trucks', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
