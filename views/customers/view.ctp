<div class="customers view">
<h2><?php  __('Customer');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $customer['Customer']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $customer['Customer']['name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Contact Person'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($customer['ContactPerson']['id'], array('controller' => 'contact_people', 'action' => 'view', $customer['ContactPerson']['id'])); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Customer', true), array('action' => 'edit', $customer['Customer']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Customer', true), array('action' => 'delete', $customer['Customer']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $customer['Customer']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Customers', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Customer', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Contact People', true), array('controller' => 'contact_people', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Contact Person', true), array('controller' => 'contact_people', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Agreements', true), array('controller' => 'agreements', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Agreement', true), array('controller' => 'agreements', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Agreements');?></h3>
	<?php if (!empty($customer['Agreement'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Customer Id'); ?></th>
		<th><?php __('Start Date'); ?></th>
		<th><?php __('Expired Date'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($customer['Agreement'] as $agreement):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $agreement['id'];?></td>
			<td><?php echo $agreement['customer_id'];?></td>
			<td><?php echo $agreement['start_date'];?></td>
			<td><?php echo $agreement['expired_date'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'agreements', 'action' => 'view', $agreement['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'agreements', 'action' => 'edit', $agreement['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'agreements', 'action' => 'delete', $agreement['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $agreement['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Agreement', true), array('controller' => 'agreements', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
