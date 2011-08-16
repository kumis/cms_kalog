<?php
// vim: set ts=4 sts=4 sw=4 si noet:

$include_path = get_include_path();
$newpath = ($include_path . PATH_SEPARATOR . APP . 'vendors' . DS . 'phpexcel');
set_include_path($newpath);

App::import('Core', 'Helper');
App::import('Helper', 'Time');

App::import(array(
	'type' => 'Vendor',
	'name' => 'PHPExcel',
	'file' => 'PHPExcel.php'
));
App::import(array(
	'type' => 'Vendor',
	'name' => 'PHPExcel_IOFactory',
	'file' => 'PHPExcel/IOFactory.php'
));

class ExcelExporterComponent extends Object {

	function __construct() {
		$this->Time = new TimeHelper;
		parent::__construct();
	}

	function _writeHeaders(&$xls, $options) {
		$sheet = $xls->getActiveSheet();

		if (!empty($options['columnHeaders'])) {

			$columnHeaders = $options['columnHeaders'];

		} else {

			$columnHeaders = $options['fields'];
			foreach ($columnHeaders as &$header) {
				if (strstr($header, '.')) {
					$split = explode('.', $header, 2);
					$header = Inflector::humanize($split[1]);
				} else {
					$header = Inflector::humanize($header);
				}
			}
			unset($header);

		}

		$col = ord('A');
		for ($i = 0, $ii = count($columnHeaders); $i < $ii; $i++) {
			$header = $columnHeaders[$i];
			$cell = chr($col) . '1';
			$sheet->setCellValue ($cell, $header);
			$col++;
		}
	}

	/** Export $data into an Excel file
	 *
	 *  @param $data mixed data retrieved via Model->find operation
	 *  @param $options mixed array of options
	 *
	 */
	function export($modelName, $data, $options = array()) {

		$needHeader = true;
		$startRow = 2;
		$startCol = 'A';

		$options = Set::merge(array(
			'template' => array(
				'file' => null,
				'type' => 'Excel5',
				'startRow' => $startRow,
				'startCol' => $startCol,
				),
			'output' => array(
				'file' => 'export.xls',
				'type' => 'Excel5',
				),
			'columnHeaders' => array(),
			'fields' => array(),
			'format' => array(
				'date' => 'd/m/Y',
				'float' => '%.2f',
				)
			), $options
		);

		if (empty($data)) {
			trigger_error('No data to export');
			return;
		}

		if (!empty($options['template']['file'])) {
			$template = $options['template'];
			$startRow = $template['startRow'];
			$startCol = $template['startCol'];
			$reader = PHPExcel_IOFactory::createReader($template['type']);
			$xls = $reader->load(($template['file']));
			$needHeader = false;
		} else {
			$xls = new PHPExcel();
			$xls->setActiveSheetIndex(0);
		}
		$sheet = $xls->getActiveSheet();

		if ($needHeader) {
			$this->_writeHeaders($xls, $options);
		}

		$Model = ClassRegistry::init($modelName);

		for ($i = 0, $ii = count($data); $i < $ii; $i++) {
			$col = ord('A');
			$row = $i + $startRow;
			for ($c = 0, $cc = count($options['fields']); $c < $cc; $c++) {
				$currentField = $options['fields'][$c];
				$split = explode('.', $currentField, 2);
				$fieldModel = $split[0];
				$fieldName = $split[1];

				if (!isset($data[$i][$fieldModel][$fieldName])) {
					$fieldType = 'string';
					$fieldValue = '';
				} else {
					$cell = chr($col) . $row;
					$fieldType = $this->_getColumnType($Model, $fieldModel, $fieldName);
					$fieldValue = $data[$i][$fieldModel][$fieldName];
				}
				$this->_setCellValue($sheet, $cell, $fieldType, $fieldValue, $options);

				$col ++;
			}
		}

		$writer = PHPExcel_IOFactory::createWriter($xls, $options['output']['type']);
		$writer->save($options['output']['file']);
	}

	function _getColumnType($Model, $fieldModel, $fieldName) {
		if ($fieldModel == $Model->name) {
			$fieldType = $Model->getColumnType($fieldName);
		} else {
			if (property_exists($Model, $fieldModel)) {
				$fieldType = $Model->{$fieldModel}->getColumnType($fieldName);
			} else {
				$fieldType = 'string';
			}
		}
		return $fieldType;
	}

	/** Set cell value and format according to field type */
	function _setCellValue($sheet, $cell, $fieldType, $fieldValue, $options) {
		switch ($fieldType) {

		case 'timestamp':
		case 'date':
			$value = $this->Time->format($options['format']['date'], $fieldValue);
			$value = $value == '0000-00-00 00:00:00' ? '' : $value;

			if (strlen($value) == 19 && !preg_match('/00:00:00$/', $value)) {
				$format = 'dd/mm/yy hh:mm:ss';
			} else {
				$format = PHPExcel_Style_NumberFormat::FORMAT_DATE_DDMMYYYY;
			}
			$sheet->getStyle($cell)->getNumberFormat()->setFormatCode($format);
			$sheet->setCellValue($cell, $value);
			break;

		case 'float':
			$sheet->getStyle($cell)->getNumberFormat()->setFormatCode(
				PHPExcel_Style_NumberFormat::FORMAT_NUMBER_00
				);
			$sheet->setCellValue($cell, sprintf($options['format']['float'], $fieldValue));
			break;

		default:
			$sheet->setCellValue($cell, $fieldValue);
		}
	}

}

?>
