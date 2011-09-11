<div class="carriages form">
<?php echo $form->create('Carriage');?>
	<fieldset>
 		<legend><?php __('Add Carriage');?></legend>
	<?php
		echo $form->input('code');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('List Carriages', true), array('action' => 'index'));?></li>
	</ul>
</div>
