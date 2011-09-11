<div class="userPreferences form">
<?php echo $form->create('UserPreference');?>
	<fieldset>
 		<legend><?php __('Add UserPreference');?></legend>
	<?php
		echo $form->input('user_id');
		echo $form->input('param');
		echo $form->input('value');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('List UserPreferences', true), array('action' => 'index'));?></li>
	</ul>
</div>
