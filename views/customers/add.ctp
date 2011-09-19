<div class="customers form">
<?php echo $this->Form->create('Customer');?>
	<fieldset>
		<legend><?php __('Add Customer'); ?></legend>
	<?php
		echo $this->Form->input('name');
		echo $this->Form->input('contact_person_id');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Customers', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Contact People', true), array('controller' => 'contact_people', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Contact Person', true), array('controller' => 'contact_people', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Agreements', true), array('controller' => 'agreements', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Agreement', true), array('controller' => 'agreements', 'action' => 'add')); ?> </li>
	</ul>
</div>