<div class="carriages index">
<h2><?php __('Carriages');?></h2>
<p>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('id');?></th>
	<th><?php echo $paginator->sort('code');?></th>
	<th class="actions"><?php __('Actions');?></th>
</tr>
<?php
$i = 0;
foreach ($carriages as $carriage):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $carriage['Carriage']['id']; ?>
		</td>
		<td>
			<?php echo $carriage['Carriage']['code']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link(__('View', true), array('action' => 'view', $carriage['Carriage']['id'])); ?>
			<?php echo $html->link(__('Edit', true), array('action' => 'edit', $carriage['Carriage']['id'])); ?>
			<?php echo $html->link(__('Delete', true), array('action' => 'delete', $carriage['Carriage']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $carriage['Carriage']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
</table>
</div>
<div class="paging">
	<?php echo $paginator->prev('<< '.__('previous', true), array(), null, array('class'=>'disabled'));?>
 | 	<?php echo $paginator->numbers();?>
	<?php echo $paginator->next(__('next', true).' >>', array(), null, array('class' => 'disabled'));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('New Carriage', true), array('action' => 'add')); ?></li>
	</ul>
</div>
