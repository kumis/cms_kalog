<div class="carriageFreights view">
<h2><?php  __('CarriageFreight');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $carriageFreight['CarriageFreight']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Carriage Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $carriageFreight['CarriageFreight']['carriage_id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Freight Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $carriageFreight['CarriageFreight']['freight_id']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit CarriageFreight', true), array('action' => 'edit', $carriageFreight['CarriageFreight']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete CarriageFreight', true), array('action' => 'delete', $carriageFreight['CarriageFreight']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $carriageFreight['CarriageFreight']['id'])); ?> </li>
		<li><?php echo $html->link(__('List CarriageFreights', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New CarriageFreight', true), array('action' => 'add')); ?> </li>
	</ul>
</div>
