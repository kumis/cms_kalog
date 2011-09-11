<div class="trucks view">
<h2><?php  __('Truck');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $truck['Truck']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Plate Number'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $truck['Truck']['plate_number']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Driver'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($truck['Driver']['first_name'], array('controller' => 'drivers', 'action' => 'view', $truck['Driver']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Trucking Company'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($truck['TruckingCompany']['name'], array('controller' => 'trucking_companies', 'action' => 'view', $truck['TruckingCompany']['id'])); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Truck', true), array('action' => 'edit', $truck['Truck']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Truck', true), array('action' => 'delete', $truck['Truck']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $truck['Truck']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Trucks', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Truck', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Drivers', true), array('controller' => 'drivers', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Driver', true), array('controller' => 'drivers', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Trucking Companies', true), array('controller' => 'trucking_companies', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Trucking Company', true), array('controller' => 'trucking_companies', 'action' => 'add')); ?> </li>
	</ul>
</div>
