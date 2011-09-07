<div class="freights form">
<?php echo $form->create('Freight');?>
	<fieldset>
 		<legend><?php __('Add Freight');?></legend>
	<?php
		echo $form->input('schedule_id');
		echo $form->input('locomotive_id');
		echo $form->input('date');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('List Freights', true), array('action' => 'index'));?></li>
	</ul>
</div>
