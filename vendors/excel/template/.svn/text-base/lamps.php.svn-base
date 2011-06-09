<?php
/**
 * Excel template for lamps
 * 
 * @author      gedex
 * @created     2011-01-24
 * @copyright   MIT license
 */
class lamps_template {
    var $helper;
    var $xls;
    var $sheet;
    var $data;
    
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
        $ec = 'AE';

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

        $sheet_index = 0;
        $total_sheets = count($this->data);
        $this->xls->setActiveSheetIndex($sheet_index);
        $this->sheet  = $this->xls->getActiveSheet();
        $this->sheet->setTitle( 'Existing' );

        App::import('Model', array('StreetType', 'PillarType', 'LampType', 'NetworkType', 'NetworkSize'));
        $StreetType = new StreetType;
        $street_types = $StreetType->find('list', array(
            'fields' => array('id', 'name'), 'order' => 'id ASC'
        ));
        $PillarType = new PillarType;
        $pillar_types = $PillarType->find('list', array(
            'fields' => array('id', 'name')
        ));
        $LampType = new LampType;
        $lamp_types = $LampType->find('list', array(
            'fields' => array('id', 'name')
        ));
        $NetworkType = new NetworkType;
        $network_types = $NetworkType->find('list', array(
            'fields' => array('id', 'name'), 'order' => 'id ASC'
        ));
        $NetworkSize = new NetworkSize;
        $_network_sizes = $NetworkSize->find('all', array(
            'recursive' => -1, 'order' => 'network_type_id ASC'
        ));
        $network_sizes = array();
        $merged_network_sizes = array();
        foreach ( $_network_sizes as $ns) {
            $network_sizes[$ns['NetworkSize']['network_type_id']][$ns['NetworkSize']['id']] = $ns['NetworkSize']['name'];
        }
        $merged_network_sizes = array();
        foreach ( $network_sizes as $nsid => $ns) {
            foreach ( $ns as $_ns ) {
                $merged_network_sizes[] = $_ns;
            }
        }
        $_mns = $merged_network_sizes;
        // header
        $hds = array(
            array('Lokasi', 3+count($street_types)-1), array('Jenis', 2+count($_mns)+count($pillar_types)+count($lamp_types))
        );
        $hd_style = array_merge($border, $center, $blue_bg);
        $sr = 1;
        $this->sheet->setCellValue('A1', 'No');
        $this->sheet->mergeCells('A1:A4');
        $this->sheet->getColumnDimension('A')->setAutoSize(1);
        $this->sheet->getStyle('A1:A4')->applyFromArray($hd_style);
        $c = 'B';
        foreach ($hds as $k => $v) {
            $n = 0;
            $_c = $c;
            if ( is_array($v) ) {
                $_c = $this->helper->_nextCell($c, $v[1]);
                $this->sheet->setCellValue($c.$sr, $v[0]);
                $this->sheet->mergeCells($c.$sr.':'.$_c.$sr);
                $n = $v[1];
            } else {
                $this->sheet->setCellValue($c.$sr, $v);
            }
            $this->sheet->getColumnDimension($c)->setAutoSize(1);
            $this->sheet->getStyle($c.$sr.':'.$_c.$sr)->applyFromArray($hd_style);
            
            $c = $this->helper->_nextCell($c, $n+1);
        }
        $hds = array(
            'Gardu', 'Kelurahan', 'Nama Jalan', array('Kelas Jalan', count($street_types)-1),
            array('JARINGAN (meter)', count($_network_sizes)-1),
            array('PHB (Unit)', 2), array('TIANG', count($pillar_types)-1), array('LAMPU', count($lamp_types)-1)
        );
        $c = 'B';
        $hd_style = array_merge($border, $center, $blue_bg);
        $sr = 2;
        foreach ($hds as $k => $v) {
            $n = 0;
            $_c = $c;
            if ( is_array($v) ) {
                $_c = $this->helper->_nextCell($c, $v[1]);
                $this->sheet->setCellValue($c.$sr, $v[0]);
                $this->sheet->mergeCells($c.$sr.':'.$_c.$sr);
                $n = $v[1];
            } else {
                $this->sheet->setCellValue($c.$sr, $v);
            }
            $this->sheet->getColumnDimension($c)->setAutoSize(1);
            $this->sheet->getStyle($c.$sr.':'.$_c.$sr)->applyFromArray($hd_style);
            
            $c = $this->helper->_nextCell($c, $n+1);
        }
        $this->sheet->mergeCells('B2:B4');
        $this->sheet->getColumnDimension('B')->setAutoSize(1);
        $this->sheet->getStyle('B2:B4')->applyFromArray($hd_style);
        $this->sheet->mergeCells('C2:C4');
        $this->sheet->getColumnDimension('C')->setAutoSize(1);
        $this->sheet->getStyle('C2:C4')->applyFromArray($hd_style);
        $this->sheet->mergeCells('D2:D4');
        $this->sheet->getColumnDimension('D')->setAutoSize(1);
        $this->sheet->getStyle('D2:D4')->applyFromArray($hd_style);
        
        $c = $this->helper->_nextCell('E', count($street_types)-1); 
        $this->sheet->getStyle('E2:'.$c.'3')->applyFromArray($hd_style);
        $this->sheet->mergeCells('E2:'.$c.'3');
        $this->sheet->getColumnDimension('E')->setAutoSize(1);
        $this->sheet->getStyle('E2:'.$c.'3')->applyFromArray($hd_style);
        
        $c++;
        $c = $this->helper->_nextCell($c, count($merged_network_sizes)); 
        $_c = $this->helper->_nextCell($c, 2); 
        $this->sheet->getStyle($c.'2:'.$_c.'3')->applyFromArray($hd_style);
        $this->sheet->mergeCells($c.'2:'.$_c.'3');
        $this->sheet->getColumnDimension($c)->setAutoSize(1);
        $this->sheet->getStyle($c.'2:'.$_c.'3')->applyFromArray($hd_style);
        
        $c = $this->helper->_nextCell($_c, 1);
        $_c = $this->helper->_nextCell($c, count($pillar_types)-1);
        $this->sheet->getStyle($c.'2:'.$_c.'3')->applyFromArray($hd_style);
        $this->sheet->mergeCells($c.'2:'.$_c.'3');
        $this->sheet->getColumnDimension($c)->setAutoSize(1);
        $this->sheet->getStyle($c.'2:'.$_c.'3')->applyFromArray($hd_style);
        
        $c = $this->helper->_nextCell($_c, 1);
        $_c = $this->helper->_nextCell($c, count($lamp_types)-1);
        $this->sheet->getStyle($c.'2:'.$_c.'3')->applyFromArray($hd_style);
        $this->sheet->mergeCells($c.'2:'.$_c.'3');
        $this->sheet->getColumnDimension($c)->setAutoSize(1);
        $this->sheet->getStyle($c.'2:'.$_c.'3')->applyFromArray($hd_style);
        
        // tanah dan udara
        $hds = array();
        foreach ($network_types as $ntid => $nt) {
            $hds[$ntid] = array($nt, count($network_sizes[$ntid])-1);
        }
        $c = $this->helper->_nextCell('E', count($street_types));
        $sr = 3;
        foreach ($hds as $k => $v) {
            $n = 0;
            $_c = $c;
            if ( is_array($v) ) {
                $_c = $this->helper->_nextCell($c, $v[1]);
                $this->sheet->setCellValue($c.$sr, $v[0]);
                $this->sheet->mergeCells($c.$sr.':'.$_c.$sr);
                $n = $v[1];
            } else {
                $this->sheet->setCellValue($c.$sr, $v);
            }
            $this->sheet->getColumnDimension($c)->setAutoSize(1);
            $this->sheet->getStyle($c.$sr.':'.$_c.$sr)->applyFromArray($hd_style);
            
            $c = $this->helper->_nextCell($c, $n+1);
        }

        $hds = array_merge($street_types, $merged_network_sizes, array('Induk', 'Pembagi', 'Natrium'),
               $pillar_types, $lamp_types);
        $c = 'E';
        $hd_style = array_merge($border, $center, $blue_bg);
        $sr = 4;
        foreach ($hds as $k => $v) {
            $n = 0;
            $_c = $c;
            if ( is_array($v) ) {
                $_c = $this->helper->_nextCell($c, $v[1]);
                $this->sheet->setCellValue($c.$sr, $v[0]);
                $this->sheet->mergeCells($c.$sr.':'.$_c.$sr);
                $n = $v[1];
            } else {
                $this->sheet->setCellValue($c.$sr, $v);
            }
            $this->sheet->getColumnDimension($c)->setAutoSize(1);
            $this->sheet->getStyle($c.$sr.':'.$_c.$sr)->applyFromArray($hd_style);
            
            $c = $this->helper->_nextCell($c, $n+1);
        }

        //pr($this->data); die;
        $row = 5;
        $no = 1;
        $row_style = array_merge($center, $border);
        foreach ($this->data as $key => $v):
            // no
            $this->sheet->setCellValue($sc.$row, $no);
            $this->sheet->getStyle($sc.$row)->applyFromArray($row_style);
            $c = $this->helper->_nextCell($sc);
            
            // relay
            $this->sheet->setCellValue($c.$row, $v['Relay']['name']);
            $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
            $c = $this->helper->_nextCell($c);
            
            // subdistrict
            $this->sheet->setCellValue($c.$row, $v['Subdistrict']['name']);
            $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
            $c = $this->helper->_nextCell($c);
            
            // street name
            $this->sheet->setCellValue($c.$row, $v['Street']['name']);
            $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
            $c = $this->helper->_nextCell($c);
            
            // Street type
            foreach ($street_types as $stid => $st) {
                if ( $v['Street']['street_type_id'] == $stid ) {
                    $this->sheet->setCellValue($c.$row, 'X');
                }
                $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                $c = $this->helper->_nextCell($c);
            }
            
            // network sizes
            foreach ($_mns as $mnsid => $mns) {
                if ( $v['NetworkSize']['name'] == $mns ) {
                    $this->sheet->setCellValue($c.$row, 'X');
                }
                $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                $c = $this->helper->_nextCell($c);
            }
            
            // panels
            if ( !empty($v['Panel']['parent_id']) ) {
                $this->sheet->setCellValue($c.$row, 'X');
            }
            $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
            $c = $this->helper->_nextCell($c);
            if ( empty($v['Panel']['parent_id']) ) {
                $this->sheet->setCellValue($c.$row, 'X');
            }
            $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
            $c = $this->helper->_nextCell($c);
            
            $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
            $c = $this->helper->_nextCell($c);
            
            // pillar types
            foreach ($pillar_types as $ptid => $pt) {
                if ( $v['Lamp']['pillar_type_id'] == $ptid ) {
                    $this->sheet->setCellValue($c.$row, 'X');
                }
                $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                $c = $this->helper->_nextCell($c);
            }
            
            // lamp types
            foreach ($lamp_types as $ltid => $lt) {
                if ( $v['Lamp']['lamp_type_id'] == $ltid ) {
                    $this->sheet->setCellValue($c.$row, 'X');
                }
                $this->sheet->getStyle($c.$row)->applyFromArray($row_style);
                $c = $this->helper->_nextCell($c);
            }
            
            
            $row++;
            $no++;
        endforeach;
        //$this->xls->setActiveSheetIndex(0);
    }
}
