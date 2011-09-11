<div class="schedules view">
<h2><?php  __('Schedule');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $schedule['Schedule']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Arrival Time'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $schedule['Schedule']['arrival_time']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Departure Time'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $schedule['Schedule']['departure_time']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Closing Time'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $schedule['Schedule']['closing_time']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit Schedule', true), array('action' => 'edit', $schedule['Schedule']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete Schedule', true), array('action' => 'delete', $schedule['Schedule']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $schedule['Schedule']['id'])); ?> </li>
		<li><?php echo $html->link(__('List Schedules', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Schedule', true), array('action' => 'add')); ?> </li>
	</ul>
</div>
