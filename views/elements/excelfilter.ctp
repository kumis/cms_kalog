<?php
if ( isset($data) ):
    echo $excel->generate($data, $titleExcel, $templateExcel);
else:
?>
<!-- begin tablegrid-head -->
<div class="tablegrid-head">
    <div class="module-head">
        <div class="module-head-c">
            <h2><?php echo isset($title_for_layout) ? __($title_for_layout, true) : __($modelName, true); ?></h2>
        </div>
    </div>
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
                            echo $form->submit('Print', array('div'=>false, 'name' => 'search'));
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
                            echo $form->submit('Print', array('div'=>false, 'name' => 'search'));
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
<?php endif;?>
