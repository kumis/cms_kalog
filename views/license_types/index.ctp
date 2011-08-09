<div class="licenseTypes index">
	<h2><?php __('License Types');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('name');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($licenseTypes as $licenseType):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $licenseType['LicenseType']['id']; ?>&nbsp;</td>
		<td><?php echo $licenseType['LicenseType']['name']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $licenseType['LicenseType']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $licenseType['LicenseType']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $licenseType['LicenseType']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $licenseType['LicenseType']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
	));
	?>	</p>

	<div class="paging">
		<?php echo $this->Paginator->prev('<< ' . __('previous', true), array(), null, array('class'=>'disabled'));?>
	 | 	<?php echo $this->Paginator->numbers();?>
 |
		<?php echo $this->Paginator->next(__('next', true) . ' >>', array(), null, array('class' => 'disabled'));?>
	</div>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('New License Type', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Licenses', true), array('controller' => 'licenses', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New License', true), array('controller' => 'licenses', 'action' => 'add')); ?> </li>
	</ul>
</div>