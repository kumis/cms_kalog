<div class="schedules form">
<?php echo $form->create('Schedule');?>
	<fieldset>
 		<legend><?php __('Add Schedule');?></legend>
	<?php
		echo $form->input('arrival_time');
		echo $form->input('departure_time');
		echo $form->input('closing_time');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('List Schedules', true), array('action' => 'index'));?></li>
	</ul>
</div>
