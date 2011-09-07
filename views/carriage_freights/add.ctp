<div class="carriageFreights form">
<?php echo $form->create('CarriageFreight');?>
	<fieldset>
 		<legend><?php __('Add CarriageFreight');?></legend>
	<?php
		echo $form->input('carriage_id');
		echo $form->input('freight_id');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('List CarriageFreights', true), array('action' => 'index'));?></li>
	</ul>
</div>
