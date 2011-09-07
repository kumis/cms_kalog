<div class="locomotives form">
<?php echo $form->create('Locomotive');?>
	<fieldset>
 		<legend><?php __('Add Locomotive');?></legend>
	<?php
		echo $form->input('code');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('List Locomotives', true), array('action' => 'index'));?></li>
	</ul>
</div>
