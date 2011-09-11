<div class="locomotives form">
<?php echo $form->create('Locomotive');?>
	<fieldset>
 		<legend><?php __('Edit Locomotive');?></legend>
	<?php
		echo $form->input('id');
		echo $form->input('code');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('Locomotive.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Locomotive.id'))); ?></li>
		<li><?php echo $html->link(__('List Locomotives', true), array('action' => 'index'));?></li>
	</ul>
</div>
