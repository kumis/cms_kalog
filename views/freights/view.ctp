<div class="freights view">
<h2><?php  __('Freight');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $freight['Freight']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Schedule Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $freight['Freight']['schedule_id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Locomotive Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $freight['Freight']['locomotive_id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Date'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $freight['Freight']['date']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit Freight', true), array('action' => 'edit', $freight['Freight']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete Freight', true), array('action' => 'delete', $freight['Freight']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $freight['Freight']['id'])); ?> </li>
		<li><?php echo $html->link(__('List Freights', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Freight', true), array('action' => 'add')); ?> </li>
	</ul>
</div>
