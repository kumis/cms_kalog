<div class="userPreferences view">
<h2><?php  __('UserPreference');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $userPreference['UserPreference']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('User Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $userPreference['UserPreference']['user_id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Param'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $userPreference['UserPreference']['param']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Value'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $userPreference['UserPreference']['value']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit UserPreference', true), array('action' => 'edit', $userPreference['UserPreference']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete UserPreference', true), array('action' => 'delete', $userPreference['UserPreference']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $userPreference['UserPreference']['id'])); ?> </li>
		<li><?php echo $html->link(__('List UserPreferences', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New UserPreference', true), array('action' => 'add')); ?> </li>
	</ul>
</div>
