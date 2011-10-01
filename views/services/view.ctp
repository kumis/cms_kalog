<div class="services view">
<h2><?php  __('Service');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $service['Service']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $service['Service']['name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Default Debitur'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $service['Service']['default_debitur']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Default Creditur'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $service['Service']['default_creditur']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Service', true), array('action' => 'edit', $service['Service']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Service', true), array('action' => 'delete', $service['Service']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $service['Service']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Services', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Service', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Service Charges', true), array('controller' => 'service_charges', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Service Charge', true), array('controller' => 'service_charges', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Packets', true), array('controller' => 'packets', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Packet', true), array('controller' => 'packets', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Documents', true), array('controller' => 'documents', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Document', true), array('controller' => 'documents', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Service Charges');?></h3>
	<?php if (!empty($service['ServiceCharge'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Service Id'); ?></th>
		<th><?php __('Date Applied'); ?></th>
		<th><?php __('Basic Charge'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($service['ServiceCharge'] as $serviceCharge):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $serviceCharge['id'];?></td>
			<td><?php echo $serviceCharge['service_id'];?></td>
			<td><?php echo $serviceCharge['date_applied'];?></td>
			<td><?php echo $serviceCharge['basic_charge'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'service_charges', 'action' => 'view', $serviceCharge['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'service_charges', 'action' => 'edit', $serviceCharge['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'service_charges', 'action' => 'delete', $serviceCharge['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $serviceCharge['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Service Charge', true), array('controller' => 'service_charges', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
<div class="related">
	<h3><?php __('Related Packets');?></h3>
	<?php if (!empty($service['Packet'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Name'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($service['Packet'] as $packet):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $packet['id'];?></td>
			<td><?php echo $packet['name'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'packets', 'action' => 'view', $packet['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'packets', 'action' => 'edit', $packet['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'packets', 'action' => 'delete', $packet['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $packet['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Packet', true), array('controller' => 'packets', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
<div class="related">
	<h3><?php __('Related Documents');?></h3>
	<?php if (!empty($service['Document'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Name'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($service['Document'] as $document):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $document['id'];?></td>
			<td><?php echo $document['name'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'documents', 'action' => 'view', $document['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'documents', 'action' => 'edit', $document['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'documents', 'action' => 'delete', $document['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $document['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Document', true), array('controller' => 'documents', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
