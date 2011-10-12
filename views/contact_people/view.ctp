<div class="contactPeople view">
<h2><?php  __('Contact Person');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $contactPerson['ContactPerson']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('First Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $contactPerson['ContactPerson']['first_name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Middle Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $contactPerson['ContactPerson']['middle_name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Last Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $contactPerson['ContactPerson']['last_name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Email'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $contactPerson['ContactPerson']['email']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Mobile Phone Number'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $contactPerson['ContactPerson']['mobile_phone_number']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Contact Person', true), array('action' => 'edit', $contactPerson['ContactPerson']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Contact Person', true), array('action' => 'delete', $contactPerson['ContactPerson']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $contactPerson['ContactPerson']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Contact People', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Contact Person', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Customers', true), array('controller' => 'customers', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Customer', true), array('controller' => 'customers', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Customers');?></h3>
	<?php if (!empty($contactPerson['Customer'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Name'); ?></th>
		<th><?php __('Contact Person Id'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($contactPerson['Customer'] as $customer):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $customer['id'];?></td>
			<td><?php echo $customer['name'];?></td>
			<td><?php echo $customer['contact_person_id'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'customers', 'action' => 'view', $customer['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'customers', 'action' => 'edit', $customer['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'customers', 'action' => 'delete', $customer['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $customer['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Customer', true), array('controller' => 'customers', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
