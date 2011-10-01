<div class="packetsServices view">
<h2><?php  __('Packets Service');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $packetsService['PacketsService']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Packet'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($packetsService['Packet']['name'], array('controller' => 'packets', 'action' => 'view', $packetsService['Packet']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Service'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($packetsService['Service']['name'], array('controller' => 'services', 'action' => 'view', $packetsService['Service']['id'])); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Packets Service', true), array('action' => 'edit', $packetsService['PacketsService']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Packets Service', true), array('action' => 'delete', $packetsService['PacketsService']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $packetsService['PacketsService']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Packets Services', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Packets Service', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Packets', true), array('controller' => 'packets', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Packet', true), array('controller' => 'packets', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Services', true), array('controller' => 'services', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Service', true), array('controller' => 'services', 'action' => 'add')); ?> </li>
	</ul>
</div>
