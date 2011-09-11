<div class="locomotives view">
<h2><?php  __('Locomotive');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $locomotive['Locomotive']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Code'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $locomotive['Locomotive']['code']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit Locomotive', true), array('action' => 'edit', $locomotive['Locomotive']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete Locomotive', true), array('action' => 'delete', $locomotive['Locomotive']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $locomotive['Locomotive']['id'])); ?> </li>
		<li><?php echo $html->link(__('List Locomotives', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Locomotive', true), array('action' => 'add')); ?> </li>
	</ul>
</div>
