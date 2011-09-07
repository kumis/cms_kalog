<div class="userPreferences form">
<?php echo $form->create('UserPreference');?>
	<fieldset>
 		<legend><?php __('Edit UserPreference');?></legend>
	<?php
		echo $form->input('id');
		echo $form->input('user_id');
		echo $form->input('param');
		echo $form->input('value');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('UserPreference.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('UserPreference.id'))); ?></li>
		<li><?php echo $html->link(__('List UserPreferences', true), array('action' => 'index'));?></li>
	</ul>
</div>
