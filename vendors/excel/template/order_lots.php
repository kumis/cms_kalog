<?php
/**
 * Excel template for order lots (SKD/CKD)
 * 
 * @author      gedex
 * @created     2010-11-16
 * @copyright   MIT license
 */
class order_lots_template {
    var $helper;
    var $xls;
    var $sheet;
    var $data;
    
    function __construct($helper, &$data) {
        $this->helper = $helper;
        $this->xls    = $this->helper->xls;
        $this->xls->setActiveSheetIndex(0);
        
        $this->sheet  = $this->xls->getActiveSheet();
        $this->data   =& $data;
    }
    
    function title($title = '') {
    }
    
    function headers() {
    }
    
    function rows() {
        // start cell
        $sc = 'B';
        // start row for header
        $srh = 2;
        // end row for header
        $erh = 7;
        // cell spacing between table lot
        $cs = 2;
        
        // style
        $border = array(
            'borders' => array(
                'outline' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array('argb' => 'FF000000'),
                ),
            ),
            'font' => array(
                'bold' => 1,
                'size' => 8
            )
        );
        $yellow_bg = array(
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'startcolor' => array(
	 				'argb' => 'FFFFCC00'
	 			)
            )
        );
        $red_text = array(
            'font' => array(
                'color' => array('argb' => 'FFFF0000'),
                'bold' => 1,
                'size' => 8
            )
        );
        $reguler = array(
            'font' => array(
                'color' => array('argb' => 'FF000000'),
                'bold' => 0,
                'size' => 8
            )
        );
        $big = array(
            'font' => array(
                'color' => array('argb' => 'FF000000'),
                'bold' => 1,
                'size' => 22
            )
        );
        $blue_text = array(
            'font' => array(
                'color' => array('argb' => 'FF0000FF'),
                'bold' => 1,
                'size' => 8
            )
        );
        $center = array(
            'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER
			),
        );
        $left = array(
            'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER
			)
        );

        foreach ($this->data as $lot):
            // car type
            $this->sheet->setCellValue($sc.$srh, $lot['car_type']);
            $this->sheet->mergeCells($sc.$srh.':'.$sc.$erh);
            $this->sheet->getStyle($sc.$srh.':'.$sc.$erh)->applyFromArray(array_merge($left, $border, $big));
            $this->sheet->getStyle($sc.$srh)->getAlignment()->setIndent(1);
            $this->sheet->getColumnDimension($sc)->setWidth(30);
            
            // code
            $c = $this->helper->_nextCell($sc);
            $this->sheet->setCellValue($c.$srh, 'Code');
            $this->sheet->mergeCells($c.$srh.':'.$c.$erh);
            $this->sheet->getStyle($c.$srh.':'.$c.$erh)->applyFromArray(array_merge($border, $center));
            $this->sheet->getColumnDimension($c)->setWidth(8);
            
            // order month
            $_mc = array();
            foreach ($lot['details']['in'] as $in) {
                foreach ($in as $i => $v) {
                    $_mc[$i] = $i;
                }
                unset($_mc[$i]);
            }
            $mc = count($_mc);
            $c = $this->helper->_nextCell($c);
            $this->sheet->setCellValue($c.$srh, $lot['order_month'] . ' Packing Month');
            $end_cell = $this->helper->_nextCell($c, $mc-1);
            $this->sheet->mergeCells($c.$srh.':'.$end_cell.$srh);
            $this->sheet->getStyle($c.$srh.':'.$end_cell.$srh)->applyFromArray(array_merge($border, $center));
            if ( $mc == 1 ) {
                $this->sheet->getColumnDimension($c)->setWidth(20);
            }
            
            
            // horizontal interior colors
            $c = $this->helper->_nextCell($sc, 2);
            $r = $srh+1;
            $qty_maps = array(); // maps cells between interior and exterior colors
            $total_per_interior = array();
            $trash_stack = array();

            foreach ( $lot['details']['in'] as $id => $interior_color ) {
                $row = $r;
                $i = 0;
                $gnc = false; // should we go to next cell
                foreach ($interior_color as $k => $v) {
                    if ( !array_key_exists($k, $trash_stack) ) {
                        $this->sheet->setCellValue($c.$row, $k);
                        $this->sheet->getStyle($c.$row)->applyFromArray(array_merge($border, $center));
                        
                        $qty_maps[$id] = $c;
                        $trash_stack[$k] = $c;
                        $gnc = true;
                    } else {
                        $qty_maps[$id] = $trash_stack[$k];
                        $gnc = false;
                    }
                    
                    if ( !isset($total_per_interior[$k]) && !$i ) {
                        $total_per_interior[$k] = array(
                            'cell' => $c, 'val' => $v
                        );
                    } else if (!$i) {
                        $total_per_interior[$k]['val'] += $v;
                    }
                    $row++;
                    $i++;
                }
                $c = $gnc ? $this->helper->_nextCell($c) : $c;
            }
            $last_cell = $this->helper->_prevCell($c);
            
            // total ordered
            $c = $this->helper->_nextCell($sc, 2);
            $r = $srh+3;
            $this->sheet->setCellValue($c.$r, $lot['total_qty']);
            $this->sheet->mergeCells($c.$r.':'.$last_cell.$r);
            $this->sheet->getStyle($c.$r.':'.$last_cell.$r)->applyFromArray(array_merge($center, $border, $red_text));
            
            // lot number
            // the row will be always 6
            $r = $srh+4;
            $this->sheet->setCellValue($c.$r, 'Lot ' . $lot['lot_number'] . ' (' . $lot['car_model'] . ')');
            $this->sheet->mergeCells($c.$r.':'.$last_cell.$r);
            $this->sheet->getStyle($c.$r.':'.$last_cell.$r)->applyFromArray(array_merge($center, $border, $red_text));
            
            // empty cell
            $r = $erh;
            $this->sheet->mergeCells($c.$r.':'.$last_cell.$r);
            $this->sheet->getStyle($c.$r.':'.$last_cell.$r)->applyFromArray($border);
            
            // last cell of current lot
            //$last_cell = $this->helper->_prevCell($code_cell);
            
            // exterior colors
            $code_cell = $sc;
            $row = $erh+1;
            $previous_row = $row;
            // hold exterior color that already printed
            // key is a 
            $trash_stack_ex = array();
            foreach ( $lot['details']['ex'] as $id => $exterior_color ) {
                $code_cell = $sc;
                $i = 0;
                
                foreach ($exterior_color as $k => $v) {
                    if ( !array_key_exists($k, $trash_stack_ex) && !isset($trash_stack_ex[$k][$qty_maps[$id]]) ) {
                        $this->sheet->setCellValue($code_cell.$row, $k);
                        $aln = $i ? array_merge($border, $center) : array_merge($border, $left);
                        $this->sheet->getStyle($code_cell.$row)->applyFromArray($aln);
                        $this->sheet->getStyle($code_cell.$row)->getAlignment()->setIndent(1);
                        
                        // fill qty that intersects with this exterior colors
                        $this->sheet->setCellValue($qty_maps[$id].$row, $v);
                        $code_cell = $this->helper->_nextCell($code_cell);
                        $i++;
                                        
                        // move it to trash stack
                        $trash_stack_ex[$k][$qty_maps[$id]] = array(
                            'qty' => $v,
                            'row' => $row
                        );
                    } else {
                        if ( !isset($trash_stack_ex[$k][$qty_maps[$id]]) ) {
                            foreach ($trash_stack_ex[$k] as $trash_stack_ex_c) {
                                if ( isset($trash_stack_ex_c['row']) ) {
                                    $row = $trash_stack_ex_c['row'];
                                    break;
                                }
                            }
                            
                            $trash_stack_ex[$k][$qty_maps[$id]] = array(
                                'qty' => 0,
                                'row' => $row
                            );
                        }
                        
                        // fill qty that intersects with this exterior colors
                        $this->sheet->setCellValue($qty_maps[$id].$trash_stack_ex[$k][$qty_maps[$id]]['row'], $v+$trash_stack_ex[$k][$qty_maps[$id]]['qty']);

                        // append qty to the stack
                        if ( $i == 1 ) {
                            $trash_stack_ex[$k][$qty_maps[$id]]['qty'] += $v;
                            $row = $previous_row;
                        }

                        $code_cell = $this->helper->_nextCell($code_cell);
                        $i++;
                    }
                }

                // give border for qty
                $c = $code_cell;
                $l = $this->helper->_nextCell($last_cell);
                while ($c != $l) {
                    $this->sheet->getStyle($c.$row)->applyFromArray(array_merge($border, $center));
                    $this->sheet->getStyle($c.$row)->applyFromArray($reguler);
                    $c = $this->helper->_nextCell($c);
                }
                $previous_row = $row;
                $row++;
            }
            $last_row = $row;
            
            // total
            $total_cell = $sc.$last_row.':'.$this->helper->_nextCell($sc).$last_row;
            $this->sheet->mergeCells($total_cell);
            $this->sheet->setCellValue($sc.$last_row, 'Total');
            $this->sheet->getStyle($total_cell)->applyFromArray(array_merge($center, $border, $yellow_bg));
            foreach ($total_per_interior as $total) {
                $this->sheet->setCellValue($total['cell'].$last_row, $total['val']);
                $this->sheet->getStyle($total['cell'].$last_row)->applyFromArray(array_merge($border, $center, $yellow_bg, $blue_text));
            }
            
            $sc = $this->helper->_nextCell($last_cell, $cs);
        endforeach;
    }
}
