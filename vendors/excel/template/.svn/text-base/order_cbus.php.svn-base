<?php
/**
 * Excel template for order_cbus (CBU)
 * 
 * @author      gedex
 * @created     2010-11-19
 * @copyright   MIT license
 */
class order_cbus_template {
    var $helper;
    var $xls;
    var $sheet;
    var $data;
    var $m = array(
        '01' => 'January', '02' => 'February', '03' => 'March', '04' => 'April',
        '05' => 'May', '06' => 'June', '07' => 'July', '08' => 'August',
        '09' => 'September', '10' => 'October', '11' => 'November', '12' => 'December'
    );
    
    function __construct($helper, &$data) {
        $this->helper = $helper;
        $this->xls    = $this->helper->xls;
        $this->data   =& $data;
    }
    
    function title($title = '') {
    }
    
    function headers() {
    }
    
    function rows() {
        // start cell
        $sc = 'A';
        // end cell
        $ec = 'R';

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
        $blue_bg = array(
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'startcolor' => array(
	 				'argb' => 'FF99CCFF'
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
        $blue_text = array(
            'font' => array(
                'color' => array('argb' => 'FF0000FF'),
                'bold' => 1,
                'size' => 8
            )
        );
        $white_text = array(
            'font' => array(
                'color' => array('argb' => 'FFFFFFFF'),
                'bold' => 1,
                'size' => 8
            )
        );
        $gray_text = array(
            'font' => array(
                'color' => array('argb' => 'FF555555'),
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
        // headers
        $hds = array('S/No', 'Production', 'Model', 'Package', 'Order Number', 'Colour',
            'Upholstery', 'Options include', 'Options delete'
        );

        $sheet_index = 0;
        $total_sheets = count($this->data);
        $this->xls->setActiveSheetIndex($sheet_index);
        $this->sheet  = $this->xls->getActiveSheet();
        foreach ($this->data as $key => $cbu):
            $this->sheet->setTitle( $this->m[$key] );
            
            $c = $sc;
            $hd_style = array_merge($border, $center, $blue_bg);
            foreach ($hds as $k => $v) {
                $n = 0;
                $_c = $c;
                if ( is_array($v) ) {
                    $_c = $this->helper->_nextCell($c, $v[1]);
                    $this->sheet->setCellValue($c.'1', $v[0]);
                    $this->sheet->mergeCells($c.'1:'.$_c.'1');
                    $n = $v[1];
                } else {
                    $this->sheet->setCellValue($c.'1', $v);
                }
                $this->sheet->getColumnDimension($c)->setAutoSize(1);
                $this->sheet->getStyle($c.'1:'.$_c.'1')->applyFromArray($hd_style);
                
                $c = $this->helper->_nextCell($c, $n+1);
            }
            
            $row = 2;
            $no = 1;
            $row_style = array_merge($center, $border);
            if (!empty($cbu)) {
                foreach ($cbu as $k => $v) {
                    // no
                    $this->sheet->setCellValue($sc.$row, $no);
                    $this->sheet->getStyle($sc.$row)->applyFromArray($row_style);
                    $c = $this->helper->_nextCell($sc);
                    
                    // production month
                    $this->sheet->setCellValue($c.$row, $this->m[$v['production_month']]);
                    $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                    $c = $this->helper->_nextCell($c);
                    
                    // model
                    $this->sheet->setCellValue($c.$row, $v['CarModel']['type']);
                    $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                    $c = $this->helper->_nextCell($c);
                    
                    // package
                    $this->sheet->setCellValue($c.$row, $v['car_package']);
                    $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                    $c = $this->helper->_nextCell($c);
                    
                    // order number
                    $this->sheet->setCellValue($c.$row, $v['fag_order_no']);
                    $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                    $c = $this->helper->_nextCell($c);
                    
                    // exterior color
                    $this->sheet->setCellValue($c.$row, $v['CarExteriorColor']['code']);
                    $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                    $c = $this->helper->_nextCell($c);
                    
                    // upholstery
                    $this->sheet->setCellValue($c.$row, $v['CarUpholstery']['code']);
                    $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                    $c = $this->helper->_nextCell($c);
                    
                    // options include
                    $this->sheet->setCellValue($c.$row, $v['optional_include']);
                    $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                    $c = $this->helper->_nextCell($c);
                    
                    // options delete
                    $this->sheet->setCellValue($c.$row, $v['optional_delete']);
                    $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                    $c = $this->helper->_nextCell($c);
                    
                    $row++;
                    $no++;
                }
            }
            
            $sheet_index++;
            if ($sheet_index < ($total_sheets)) {
                $this->xls->createSheet();
                $this->xls->setActiveSheetIndex($sheet_index);
                $this->sheet  = $this->xls->getActiveSheet();
            }
        endforeach;
        $this->xls->setActiveSheetIndex(0);
    }
}
