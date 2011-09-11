<div class="carriages view">
<h2><?php  __('Carriage');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $carriage['Carriage']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Code'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $carriage['Carriage']['code']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit Carriage', true), array('action' => 'edit', $carriage['Carriage']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete Carriage', true), array('action' => 'delete', $carriage['Carriage']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $carriage['Carriage']['id'])); ?> </li>
		<li><?php echo $html->link(__('List Carriages', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Carriage', true), array('action' => 'add')); ?> </li>
	</ul>
</div>
