<div class="carriages form">
<?php echo $form->create('Carriage');?>
	<fieldset>
 		<legend><?php __('Edit Carriage');?></legend>
	<?php
		echo $form->input('id');
		echo $form->input('code');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('Carriage.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Carriage.id'))); ?></li>
		<li><?php echo $html->link(__('List Carriages', true), array('action' => 'index'));?></li>
	</ul>
</div>
