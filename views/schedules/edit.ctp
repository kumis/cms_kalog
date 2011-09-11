<div class="schedules form">
<?php echo $form->create('Schedule');?>
	<fieldset>
 		<legend><?php __('Edit Schedule');?></legend>
	<?php
		echo $form->input('id');
		echo $form->input('arrival_time');
		echo $form->input('departure_time');
		echo $form->input('closing_time');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('Schedule.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Schedule.id'))); ?></li>
		<li><?php echo $html->link(__('List Schedules', true), array('action' => 'index'));?></li>
	</ul>
</div>
