<div class="packets view">
<h2><?php  __('Packet');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $packet['Packet']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $packet['Packet']['name']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Packet', true), array('action' => 'edit', $packet['Packet']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Packet', true), array('action' => 'delete', $packet['Packet']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $packet['Packet']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Packets', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Packet', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Services', true), array('controller' => 'services', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Service', true), array('controller' => 'services', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Services');?></h3>
	<?php if (!empty($packet['Service'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Name'); ?></th>
		<th><?php __('Default Debitur'); ?></th>
		<th><?php __('Default Creditur'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($packet['Service'] as $service):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $service['id'];?></td>
			<td><?php echo $service['name'];?></td>
			<td><?php echo $service['default_debitur'];?></td>
			<td><?php echo $service['default_creditur'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View', true), array('controller' => 'services', 'action' => 'view', $service['id'])); ?>
				<?php echo $this->Html->link(__('Edit', true), array('controller' => 'services', 'action' => 'edit', $service['id'])); ?>
				<?php echo $this->Html->link(__('Delete', true), array('controller' => 'services', 'action' => 'delete', $service['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $service['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Service', true), array('controller' => 'services', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
