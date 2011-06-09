<?php
App::import('Vendor','PHPExcel',array('file' => 'excel/PHPExcel.php'));
App::import('Vendor','PHPExcelWriter',array('file' => 'excel/PHPExcel/Writer/Excel5.php'));

class ExcelHelper extends AppHelper {
    
    var $xls;
    var $sheet;
    var $data;
    var $blacklist = array();
    
    function __construct() {
        $this->xls = new PHPExcel();
    }
                 
    function generate(&$data, $title = 'Report', $template = '') {
        $this->data =& $data;
        if ( !empty($template) ) {
            $tpl_class = $template . '_template';
            App::import('Vendor', 'interface_template', array('file' => 'excel/template/interface_template.php'));
            App::import('Vendor', $tpl_class, array('file' => 'excel/template/' . $template . '.php'));
            
            $tpl = new $tpl_class($this, &$data);
            $tpl->title($title);
            $tpl->headers();
            $tpl->rows();
        } else {
            $this->sheet = $this->xls->getActiveSheet();
            $this->sheet->getDefaultStyle()->getFont()->setName('Verdana');

            $this->_title($title);
            $this->_headers();
            $this->_rows();
        }
        $this->_output($title);
        return true;
    }
    
    function _title($title) {
        $this->sheet->setCellValue('A2', $title);
        $this->sheet->getStyle('A2')->getFont()->setSize(14);
        $this->sheet->getRowDimension('2')->setRowHeight(23);
    }

    function _headers() {
        $i=0;
        foreach ($this->data[0] as $field => $value) {
            if (!in_array($field,$this->blacklist)) {
                $columnName = Inflector::humanize($field);
                $this->sheet->setCellValueByColumnAndRow($i++, 4, $columnName);
            }
        }
        $this->sheet->getStyle('A4')->getFont()->setBold(true);
        $this->sheet->getStyle('A4')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
        $this->sheet->getStyle('A4')->getFill()->getStartColor()->setRGB('969696');
        $this->sheet->duplicateStyle( $this->sheet->getStyle('A4'), 'B4:'.$this->sheet->getHighestColumn().'4');
        for ($j=1; $j<$i; $j++) {
            $this->sheet->getColumnDimension(PHPExcel_Cell::stringFromColumnIndex($j))->setAutoSize(true);
        }
    }
        
    function _rows() {
        $i=5;
        foreach ($this->data as $row) {
            $j=0;
            foreach ($row as $field => $value) {
                if(!in_array($field,$this->blacklist)) {
                    $this->sheet->setCellValueByColumnAndRow($j++,$i, $value);
                }
            }
            $i++;
        }
    }
            
    function _output($title) {
        header("Content-type: application/vnd.ms-excel"); 
        header('Content-Disposition: attachment;filename="'.$title.'.xls"');
        header('Cache-Control: max-age=0');
        $objWriter = new PHPExcel_Writer_Excel5($this->xls);
        $objWriter->setTempDir(TMP);
        $objWriter->save('php://output');
    }
    
    function _nextCell($cell, $move = 1) {
        if ( $move == 0 ) {
            return $cell;
        }
        
        if ( strlen($cell) == 1 ) {
            $cell_ascii = ord($cell);
            $ret = '';
            
            if ($cell_ascii > 89) {
                $ret = 'AA';
            } else {
                $ret = chr($cell_ascii+1);
            }
        } else {
            $cell_len = strlen($cell);
            $ret = '';
            $cn = false;
            
            for ($i = $cell_len-1; $i >= 0; $i--) {
                $cell_ascii = ord($cell[$i]);
                
                if ($cell_ascii > 89) {
                    $cell[$i] = 'A';
                    if ( $i == 0 ) {
                        $cell = 'A' . $cell;
                    }
                } else {
                    $cell[$i] = chr($cell_ascii+1);
                    break;
                }
            }
            $ret = $cell;
        }
        
        if ( $move > 1 ) {
            return $this->_nextCell($ret, $move-1);
        } else {
            return $ret;
        }
    }
    
    function _prevCell($cell, $move = 1) {
        if ( strlen($cell) == 1 ) {
            $cell_ascii = ord($cell);
            $ret = '';
            
            if ($cell_ascii > 65) {
                $ret = chr($cell_ascii-1);
            }
        } else {
            $cell_len = strlen($cell);
            $ret = '';
            $cn = false;
            
            for ($i = $cell_len-1; $i >= 0; $i--) {
                $cell_ascii = ord($cell[$i]);
                
                if ($cell_ascii > 65) {
                    $cell[$i] = chr($cell_ascii-1);
                    break;
                    
                } else {
                    $cell[$i] = 'Z';
                    if ( $i == 0 ) {
                        $cell[$i] = '';
                    }
                }
            }
            $ret = $cell;
        }
        
        if ( $move > 1 ) {
            return $this->_nextCell($ret, $move-1);
        } else {
            return $ret;
        }
    }
}
