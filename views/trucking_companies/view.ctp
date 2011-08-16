<div class="truckingCompanies view">
<h2><?php  __('Trucking Company');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $truckingCompany['TruckingCompany']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $truckingCompany['TruckingCompany']['name']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Trucking Company', true), array('action' => 'edit', $truckingCompany['TruckingCompany']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Trucking Company', true), array('action' => 'delete', $truckingCompany['TruckingCompany']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $truckingCompany['TruckingCompany']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Trucking Companies', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Trucking Company', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Trucks', true), array('controller' => 'trucks', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Truck', true), array('controller' => 'trucks', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Trucks');?></h3>
	<?php if (!empty($truckingCompany['Truck'])):?>
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
		foreach ($truckingCompany['Truck'] as $truck):
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
