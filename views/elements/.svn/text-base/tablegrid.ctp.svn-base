<!-- begin tablegrid-head -->
<div class="tablegrid-head">
    <div class="module-head">
        <div class="module-head-c">
            <h2><?php echo isset($title_for_layout) ? __($title_for_layout, true) : __($modelName, true); ?></h2>
            <div class="module-tools">
                <?php if ( $module_permission['operations']['print']): ?>
                <a href='#' class="media print"><span>Print</span></a> | 
                <?php endif;?>
                <?php if ( $module_permission['operations']['csv']): ?>
                <a href='#' class="media csv"><span>Save as csv</span></a> |
                <?php endif;?>
                <?php if ( $module_permission['operations']['pdf']): ?>
                <a href='#' class="media pdf"><span>Save as pdf</span></a>
                <?php endif;?>
            </div>
        </div>
    </div>
    <?php
        if ( isset($module_permission['operations']['add']) && $module_permission['operations']['add'] ):
        echo '<div class="btc">';
        echo $html->link( '<span rel="' . $this->params['controller'] . '">' . __('Add New', true) . "</span>", 
                            array('action'=>'add'), 
                            array(
                                'class' => 'add_new btovgr', 'rel' => $this->params['controller'],
                                'escape' => false
                            ), 
                            false, false
                        ) . '&nbsp;';
        echo '</div>';
        endif;
        
        if ( isset($module_permission['operations']['delete']) && $module_permission['operations']['delete'] ):
        echo '<div class="btc">';
        echo $html->link( '<span rel="' . $this->params['controller'] . '">' . __('Delete', true) . "</span>",
                            array('action'=>'delete_rows'),
                            array(
                                'class' => 'delete btovgr', 'rel' => $this->params['controller'],
                                'escape' => false
                            ),
                            false, false
                        );
        echo '</div>';
        endif;
    ?>
    <br class="clear" />
    <!-- filter -->
    <?php if (isset($filter)):?>
    <div id="filter-box">
        <form accept-charset="UNKNOWN" enctype="application/x-www-form-urlencoded" method="get" name="search-form" id="search-form">
        <table cellpadding="0" cellspacing="0" class="tablefilter">
        <thead>
            <tr>
                <th colspan="<?php echo $filter_max_col*2;?>" class="label">
                    <strong><?php echo isset($filter_title) ? $filter_title : 'Pencarian';?></strong>
                </th>
            </tr>
        </thead>
        <tbody>
            <?php
                $i = 0; $j = 0;
                $s_filter = sizeof($filter);
                foreach ( $filter as $key => $row ): 
             ?>
            <tr>
                <?php if (is_array($row) && count($row) > 1 ): ?>
                    <?php $j = 0;?>
                    <?php foreach ($row as $input_field => $label): ?>
                    <?php if ( is_array($label) && isset($label['options']) ) :?>
                        <td class="label cursor"><?php __($label['label']); $j++; ?></td>
                    <?php else:?>
                        <td class="label cursor"><?php __($label); ?></td>
                    <?php endif;?>
                    <td class="inputText">
                        <?php if ( is_array($label) && isset($label['options']) ) :?>
                            <?php
                                echo $form->select(
                                    $input_field, $label['options'],
                                    isset(${$input_field."Value"}) ? ${$input_field."Value"} : null,
                                    array('name' => 'opt_' . $input_field)
                                );
                            ?>
                        <?php else: ?>
                            <input class="inline" type="text" name="txt_<?php echo "$input_field"; ?>" value="<?php echo isset(${$input_field."Value"}) ? ${$input_field."Value"} : ''; ?>" />
                        <?php endif;?>
                     </td>
                     <?php endforeach; ?>
                     <?php if ( $i == (sizeof($filter) - 1) && $filter_max_col > 2 ): ?>
                        <td colspan="<?php echo ($filter_max_col*2)-2;?>" class="label">
                        <?php
                            echo $form->submit('Cari', array('div'=>false, 'name' => 'search')) . "&nbsp; atau &nbsp;";
                            echo $html->link(__('Tampilkan semua', true), array('action'=>'index'), array('class'=>'clear')) . "&nbsp;";
                        ?>
                        </td>
                     <?php endif; ?>
                 <?php else: ?>
                     <?php if (is_array($row)): ?>
                        <td class="label cursor"><?php echo $row['label']; ?></td>
                     <?php else:?>
                        <td class="label cursor"><?php __($row); ?></td>
                     <?php endif;?>
                     <td class="inputText">
                        <?php if (is_array($row)): ?>
                            <?php
                                echo $form->select(
                                    $key, $row['options'],
                                    isset(${$key."Value"}) ? ${$key."Value"} : null,
                                    array('name' => 'opt_' . $key)
                                );
                            ?>
                        <?php else:?>
                            <input class="inline" type="text" name="txt_<?php echo "$key"; ?>" value="<?php echo isset(${$key."Value"}) ? ${$key."Value"} : ''; ?>" />
                        <?php endif;?>
                        
                     </td>
                     <?php if ( $filter_max_col >= 2 ): ?>
                     <td colspan="<?php echo ($filter_max_col*2)-2;?>" class="label">
                     <?php
                        if ( $i == (sizeof($filter) - 1) ) {
                            echo $form->submit('Cari', array('div'=>false, 'name' => 'search')) . "&nbsp; atau &nbsp;";
                            echo $html->link(__('Tampilkan semua', true), array('action'=>'index'), array('class'=>'clear')) . "&nbsp;";
                        }
                    ?>
                     </td>
                     <?php endif; ?>
                 <?php endif; ?>
                 <?php $i++; ?>
            </tr>
            <?php endforeach; ?>
        </tbody>
        </table>
        </form>
    <!-- filter eof --> 
    </div>
    <?php endif;?>
<!-- tablegrid-head eof -->    
</div>

<!-- begin tablegrid body -->
<div class="show_result_paging">
<?php
    if (isset($filter)):
        $paginator->options['url'] = array('filter' => 1 . '/' . $str_fl);
    endif;
    echo $paginator->counter(array('format' => __("Halaman", true) . " <strong>%page%</strong> " . __("dari", true) . " <strong>%pages%</strong> ," . __("menampilkan", true) . " <strong>%current%</strong> " . __("baris dari total", true) .  " <strong>%count%</strong> " . __("baris, dimulai dari baris", true) . " <strong>%start%</strong>, " . __("berakhir di baris", true) . " <strong>%end%</strong>"
));
?>
</div>
<form class="formgrid" name="formgrid" action="<?php echo $formgrid; ?>">
<table cellpadding="0" cellspacing="0" class="tablegrid" id="tablegrid_<?php echo $this->params['controller'];?>">
<thead>
<tr>
    <th>
        <?php if ( $module_permission['operations']['delete'] ):?>
            <input type="checkbox" name="checkall_head" class="checkall" />
        <?php else:?>
            &nbsp;
        <?php endif;?>
    </th>
    <?php foreach ( $fields as $key => $field ): ?>
        <?php 
            if ($field['sortable']):
                if ( isset($assoc[ $key ]) ) {
                    echo '<th class="sortable">' . $paginator->sort($field['title'], $assoc[$key]['model'] . '.' . $assoc[$key]['field'], array('title' => __('Sort by', true) . ' ' . $field['title']));
                } else {
                    echo '<th class="sortable">' . $paginator->sort($field['title'], $key, array('title' => __('Sort by', true) . ' ' . $field['title']));
                }
            else:
                echo '<th>' . $field['title'];
            endif;
        ?>
        </th>
    <?php endforeach; ?>
</tr>
</thead>
<tfoot>
<tr>
    <th>
        <?php if ( $module_permission['operations']['delete'] ):?>
            <input type="checkbox" name="checkall_foot" class="checkall" />
        <?php else:?>
            &nbsp;
        <?php endif;?>
    </th>
    <?php foreach ( $fields as $key => $field ): ?>
        <?php 
            if ($field['sortable']):
                echo '<th class="sortable">' . $paginator->sort($field['title'], $key, array('title' => __('Sort by', true) . ' ' . $field['title']));
            else:
                echo '<th>' . $field['title'];
            endif;
        ?>
        </th>
    <?php endforeach; ?>
</tr>
</tfoot>
<tbody>
<?php
$i = 0;
if (empty($records)) {
    echo '<tr><td colspan="' . (count($fields) + 1) . '" class="noRecord">' . __('No Records', true) . '</td></tr>';
}
foreach ($records as $record):
    $class = null;
    if ($i++ % 2 == 0) {
        $class = ' class="altrow"';
    }
?>
    <tr<?php echo $class;?> rel="r<?php
        echo isset($record["$modelName"]["id"]) ? $record["$modelName"]["id"] : '';
    ?>">
        <td width="1%" class="no">
            <?php if ( $module_permission['operations']['delete'] ):?>
                <input type="checkbox" class="cb" name="data[rows][]" value="<?php echo $record["$modelName"]["id"]; ?>" id="r<?php echo $record["$modelName"]["id"];?>" />
            <?php else:?>
                &nbsp;
        <?php endif;?>
        </td>
        <?php
            foreach ( $fields as $key => $field ):                
                if (isset($assoc) && array_key_exists($key, $assoc)) {
                    $val = isset($record[$assoc[$key]['model']][$assoc[$key]['field']]) ? $record[$assoc[$key]['model']][$assoc[$key]['field']] : '-';
                } else {
                    $val = isset($record["$modelName"]["$key"]) ? $record["$modelName"]["$key"] : '';
                }
                
                if (isset($displayedAs) && array_key_exists($key, $displayedAs)) {
                    switch ($displayedAs[$key]) {
                        case 'date':
                            $val = $time->format('d/m/Y', $val);
                            break;
                        case 'datetime':
                            $val = $time->format('d/m/Y H:i', $val);
                            break;
                        case 'int':
                        case 'integer':
                            $val = sprintf($val*1, 'd');
                        case 'percentage':
                            $val = $val . ' %';
                            break;
                        case 'money':
                            $val = number_format($val, 2, '.', ',');
                            break;
                    }
                }
                
                if (isset($replacement) && array_key_exists($key, $replacement)) {
                    if ( isset($replacement[$key][$val]['parse']) ) {
                        $val = sprintf($replacement[$key][$val]['parse'], $record[$replacement[$key][$val]['model']][$replacement[$key][$val]['field']]);
                    } else {
                        $val = isset($replacement[$key][$val]) ? $replacement[$key][$val]['replaced'] : $val;
                    }
                    
                }
                
                if ( isset($if) && array_key_exists($key, $if)) {
                    switch ($if[$key]['operator']) {
                        case 'equalToField':
                            if ( $val == $record[$modelName][$if[$key]['to']] ) {
                                $val = $if[$key]['replaced'];
                            }
                            break;
                        case 'fieldsEqualTo':
                            foreach ( $if[$key]['fields'] as $fieldEqualTo ) {
                                if ( $record[$modelName][$fieldEqualTo['name']] == $fieldEqualTo['expected'] ) {
                                    $val = $fieldEqualTo['showAs'];
                                    break;
                                }
                            }
                            break;
                        case 'equal':
                            break;
                        case 'hasManyImplode':
                            $toBeimploded = array();
                            if ( isset($record[$if[$key]['model']]) && !empty($record[$if[$key]['model']]) ) {
                                foreach ( $record[$if[$key]['model']] as $idx => $row ) {
                                    $toBeimploded[$idx] = $row[$if[$key]['field']];
                                    if ( isset($if[$key]['link']) ) {
                                        $toBeimploded[$idx] = $html->link($row[$if[$key]['field']], 
                                            array('controller' => $if[$key]['link']['controller'], 
                                                'action' => $if[$key]['link']['action'],
                                                $row[$if[$key]['link']['params']['field']]
                                            )
                                        );
                                    }
                                    
                                }
                            }
                            $val = implode($toBeimploded, $if[$key]['separator']);
                            break;
                    }
                }
                
                if (isset($editable) && $key == $editable) {
                    $action = 'edit';
                    if ( isset($editableLink) ) {
                        $action = $editableLink;
                    }
                    
                    $editField = $record["$modelName"]['id'];
                    if ( isset($editableField) ) {
                        $editField = $record["$modelName"]["$editableField"];
                    }
                    
                    $link = $module_permission['operations']['edit'] ? $html->link( $val, array('action'=> $action, $editField)) : $val;
                    $val = (isset($record["$modelName"]["$key"])) ? $link : '';
                }
                
                if ( isset($field['wrapBefore']) &&  isset($field['wrapAfter']) ) {
                    if ( is_string($field['wrapBefore']) && !empty($field['wrapBefore']) ) {
                        $val =  $field['wrapBefore'] . $val . $field['wrapAfter'];
                    }
                }
                
                if ( isset($field['before']) ) {
                    if ( is_array($field['before']) && !empty($field['before']) ) {
                        $val = $record[$field['before']['model']][$field['before']['field']] . $val;
                    }
                }
                
                if ( isset($field['after']) && !empty($field['after']) ) {
                    $val = $val . $field['after'];
                }
                
                echo "<td>$val</td>";
            endforeach; 
        ?>
    </tr>
<?php endforeach; ?>
</tbody>
</table><!-- end table grid body -->
<?php echo $form->end();?>
<div class="paging">
    <?php echo $paginator->first('First', array('class'=>'first', 'title'=>'Pertama'));?>
    <?php echo $paginator->prev('Previous', array('class'=>'prev', 'title'=>'Sebelumnya'), null, array('class'=>'disabled'));?>
 | 	<?php echo $paginator->numbers();?>
    <?php echo $paginator->next('Next', array('class'=>'next', 'title'=>'Berikutnya'), null, array('class'=>'disabled'));?>
    <?php echo $paginator->last('Last', array('class'=>'last', 'title'=>'Terakhir'));?>
</div>
