﻿<?php
App::import('Vendor', 'pData', array('file' => 'chart' . DS . 'pData.class') );
App::import('Vendor', 'pChart', array('file' => 'chart' . DS . 'pChart.class') );
App::import('Vendor', 'pCache', array('file' => 'chart' . DS . 'pCache.class') );
class ChartHelper extends AppHelper {
    var $imageSize = array(
        'width' => 1200,
        'height' => 460
    );
    var $font = array(
        'family' => '',
        'size' => 8
    );
    var $graphArea = array(
        'x1' => 60, 'y1' => 30,
        'x2' => 1130, 'y2' => 300,
        'r' => 255, 'g' => 255, 'b' => 255, 'strip' => true
    );
    var $roundedBorder = array(
        'x1' => 5, 'y1' => 5, 'x2' => 1148, 'y2' => 455,
        'radius' => 5,
        'r' => 230, 'g' => 230, 'b' => 230
    );
    var $rounded = array(
        'x1' => 7, 'y1' => 7, 'x2' => 1146, 'y2' => 453,
        'radius' => 5,
        'r' => 240, 'g' => 240, 'b' => 240
    );
    var $scale = array(
        'r' => 150, 'g' => 150, 'b' => 150,
        'thick' => true,
        'angle' => 45,
        'decimal' => 2,
        'rightScale' => 1
    );
    var $grid = array(
        'dashed' => 4,
        'mosaic' => true,
        'r' => 220, 'g' => 220, 'b' => 220,
        'alpha' => 50
    );
    var $treshold = array(
        'value' => 0,
        'r' => 0, 'g' => 0, 'b' => 0,
        'showLabel' => true, 'right' => true, 'width' => 4,
        'caption' => 'Caption'
    );
    
    // property for labeling max and min $data[values]
    // see setup() and setLabel()
    var $label = array( 'max' => false, 'min' => false );
    var $labels = array(
        'max' => array('r' => 221, 'g' => 230, 'b' => 174),
        'min' => array('r' => 239, 'g' => 194, 'b' => 194)
    );
    
    // property for plot. See addPlot()
    var $plot = array(
        'show' => true,
        'r' => 255, 'g' => 255, 'b' => 255,
        'smallRadius' => 2, 'bigRadius' => 3
    );
    
    // basic setup var
    var $validType = array('line' => 'line', 'bar' => 'bar', 'pie' => 'pie');
    
    // hold object
    var $data;
    var $chart;
    
    var $errors = array();
    
    /* if not null will always pudir2 */
    var $specific;
    
/**
 * Prepare chart and its data
 * @param array $data array of data. See $this->__checkData() to see an example of valid data.
 * @param string $type. Type of chart, available types: 'line', 'bar' and 'pie'
 * @param bool $month. If set to true $data threated as monthly, if values of data consists more than
 *                     12, values will be chunked into 12 values. If set to false, data is not threated
 *                     as monthly or annual data.
 * @param array $options. Additional parameter, see $this->__checkData()
 */
    function setup($data, $type = 'line', $month = true, $options, $specific = null) {
        $this->font['family'] = WWW_ROOT . DS . 'files' . DS . 'fonts' . DS . 'tahoma.ttf';
        
        // init data
        $this->data = new pData;
        $this->specific = $specific;
        
        if ( !array_key_exists($type, $this->validType) ) {
            $type = 'line';
        }
        
        // validate data
        $data = $this->__checkData($data, $type, $month, $options);
        if ( !$data ) {
            return $this->error();
        }
        
        // init chart
        if ( $type !== 'pie' ) {
            $this->chart = new pChart($this->imageSize['width'], $this->imageSize['height']);
            
            // set font
            $this->chart->setFontProperties( $this->font['family'], $this->font['size'] );
            // set graph area of the chart
            $this->chart->setGraphArea(
                $this->graphArea['x1'], $this->graphArea['y1'], $this->graphArea['x2'], $this->graphArea['y2']
            );
            
            // draw outer / border rounded rectangle
            $this->chart->drawRoundedRectangle(
                $this->roundedBorder['x1'], $this->roundedBorder['y1'], 
                $this->roundedBorder['x2'], $this->roundedBorder['y2'],
                $this->roundedBorder['radius'],
                $this->roundedBorder['r'], $this->roundedBorder['g'], $this->roundedBorder['b']
            );
            
            // draw inner rounded rectangle
            $this->chart->drawFilledRoundedRectangle(
                $this->rounded['x1'], $this->rounded['y1'], $this->rounded['x2'], $this->rounded['y2'],
                $this->rounded['radius'],
                $this->rounded['r'], $this->rounded['g'], $this->rounded['b']
            );
            // draw graph area
            $this->chart->drawGraphArea(
                $this->graphArea['r'], $this->graphArea['g'], $this->graphArea['b'],
                $this->graphArea['strip']
            );
            // draw scale or X axe
            $this->chart->drawScale(
                $this->data->GetData(), $this->data->GetDataDescription(), SCALE_NORMAL,
                $this->scale['r'], $this->scale['g'], $this->scale['b'], $this->scale['thick'],
                $this->scale['angle'], $this->scale['decimal'], $this->scale['rightScale']
            );
            // draw grid
            $this->chart->drawGrid(
                $this->grid['dashed'], $this->grid['mosaic'],
                $this->grid['r'], $this->grid['g'], $this->grid['b'],
                $this->grid['alpha']
            );
            
        } else {
            $this->chart = new pChart(420, 250);
            $this->chart->drawFilledRoundedRectangle(7,7,413,243,5,240,240,240);
            $this->chart->drawRoundedRectangle(5,5,415,245,5,230,230,230);
            $this->chart->createColorGradientPalette(195,204,56,223,110,41,5);
            $this->chart->AntialiasQuality = 0;
        }
         
        // Draw the 0 line
        // adding treshold can be called from $this->addTreshold()
        $this->chart->setFontProperties( $this->font['family'], $this->font['size'] );
        if ( !array_key_exists('title', $options) ) {
            $options['title'] = 'Chart';
        }
        // Draw the graph, depend on the $type
        if ( $type === 'pie' ) {
            $this->chart->drawPieGraph($this->data->GetData(), $this->data->GetDataDescription(),180,130,110,PIE_PERCENTAGE_LABEL,FALSE,50,20,5);
            $this->chart->drawPieLegend(330,15,$this->data->GetData(),$this->data->GetDataDescription(),250,250,250);
            // draw chart's title
            $this->chart->setFontProperties( $this->font['family'], 10);
            $this->chart->drawTitle(10, 20, $options['title'], 100, 100, 100);
        } else if ( $type === 'bar' ) {
            if ( array_key_exists('shadow', $options) ) {
                $shadow = $options['shadow'];
            }
            $this->chart->drawBarGraph( $this->data->GetData(), $this->data->GetDataDescription(), $shadow);
            $this->chart->drawLegend(1020,30,$this->data->GetDataDescription(), 255, 255, 255);
            
            // draw chart's title
            $this->chart->setFontProperties( $this->font['family'], 8);
            //$this->chart->drawTitle(70, 22, $options['title'], 50, 50, 50, 585);
        } else { // default to line
            $this->chart->drawLineGraph($this->data->GetData(), $this->data->GetDataDescription());
            $this->chart->drawLegend(620,30,$this->data->GetDataDescription(), 255, 255, 255);
            
            // draw chart's title
            $this->chart->setFontProperties( $this->font['family'], 10);
            $this->chart->drawTitle(60, 22, $options['title'], 50, 50, 50, 585);
        }
        
        // draw plot can be called from $this->addPlot(), make sure called after setup(),
        // also see $this->plot property
        //$this->chart->drawPlotGraph($this->data->GetData(),$this->data->GetDataDescription(),3,2,255,255,255);
        
        
        // draw labels
        foreach ( $data as $content ) {
            foreach ( $content['values'] as $key => $val ) {
                /*
                if ($content['name'] == 'Anggaran' ) {
                    $this->chart->setLabel($this->data->GetData(), $this->data->GetDataDescription(), $content['name'], $key, number_format($val,2,'.',','), $this->labels['max']['r'], $this->labels['max']['g'], $this->labels['max']['b']);
                } else {
                    $this->chart->setLabel($this->data->GetData(), $this->data->GetDataDescription(), $content['name'], $key, number_format($val,2,'.',','), $this->labels['min']['r'], $this->labels['min']['g'], $this->labels['min']['b']);
                }
                */
                
                // Write values on Serie1 & Serie2
                $this->chart->setFontProperties( $this->font['family'], 10);
                $this->chart->writeValues($this->data->GetData(),$this->data->GetDataDescription(), $content['name'], $this->specific);
            }
        }
        
        
        // Optionally you can call setLabel() before calling $this->setup() to
        // set label property (see $this->labels) and their visibility (see $this->label)
        if ( ($this->label['max'] || $this->label['min']) && $type !== 'pie' ) {
            // labeling max. and min. order for each data
            $this->chart->setFontProperties( $this->font['family'], $this->font['size'] );
            foreach ( $data as $content ) {
                if ( $this->label['max'] ) {
                    $this->chart->setLabel($this->data->GetData(), $this->data->GetDataDescription(), $content['name'], $content['max'], "Max. " . $content['name'] , $this->labels['max']['r'], $this->labels['max']['g'], $this->labels['max']['b']);
                }
                
                if ( $this->label['min'] ) {
                    $this->chart->setLabel($this->data->GetData(), $this->data->GetDataDescription(), $content['name'], $content['min'],"Min. " . $content['name'], $this->labels['min']['r'], $this->labels['min']['g'], $this->labels['min']['b']);
                }
            }
        }
        
    }

/**
 * Render the chart
 * @param string $filename. Name of chart's image if $stroke is set to false
 * @param bool $stroke
 */    
    function output($filename = 'chart.png', $stroke = false, $buildCache = false) {
        if ( $this->chart && empty($this->errors)) {
            // rendering method based on stroke
            if ( !$stroke ) {
                $this->chart->Render( WWW_ROOT . DS . 'files' . DS . 'images' . DS . $filename);
                return ($buildCache) ? $this->base . '/files/images/' . $filename : '<img src="' . $this->base . '/files/images/' . $filename . '" alt="" />';
            } else {
                return $this->chart->Stroke();
            }
        } else { // failed to render
            return $this->error();
        }
    }

/**
 * setup label max / min on the chart
 * @param array $visibility See $this->label
 * @param array $options See $this->labels
 */ 
    function setLabel($visibilty, $options) {
        if ( $this->chart ) {
            $this->errors[] = 'This just a notice. To avoid unwanted result, please make sure $chart->setLabel() is called before $chart->setup().';
        } else {
            $this->label  = $this->__checkOptions($visibilty, $this->label);
            $this->labels = $this->__checkOptions($options, $this->labels);
        }    
    }    
    
/**
 * Add treshold on the chart
 * @param array $options See $this->treshold
 */ 
    function addTreshold($options) {
        $this->treshold = $this->__checkOptions($options, $this->treshold);
        
        if ( $this->chart ) {
            $this->chart->setFontProperties( $this->font['family'], 6 );
            $this->chart->drawTreshold(
                $this->treshold['value'],
                $this->treshold['r'], $this->treshold['g'], $this->treshold['b'],
                $this->treshold['showLabel'], $this->treshold['right'],
                $this->treshold['width'], $this->treshold['caption']
            );
        } else {
            $this->errors[] = 'Chart is not initialized yet, you must call $chart->setup first';
        }
    }

/**
 * Draw plot on the chart
 * @params array $options See $this->plot
 */ 
    function addPlot($options = null) {
        $this->plot = $this->__checkOptions($options, $this->plot);
        
        if ( $this->plot['show'] ) {
            if ( $this->data ) {
                $this->chart->drawPlotGraph(
                    $this->data->GetData(), $this->data->GetDataDescription(),
                    $this->plot['bigRadius'], $this->plot['smallRadius'],
                    $this->plot['r'], $this->plot['g'], $this->plot['b']
                );
            } else { // $this->data is not initialized yet, give error
                $this->errors[] = 'Data is not initialized yet, you must call $chart->setup first.';
            }
        }
    }
 
/**
 * Check and compare $options with default options
 * @param array $options options to be checked
 * @param array $default default to compare with
 * @return array $options valid options according to $default
 */
    function __checkOptions( $options, $default ) {
        if ( is_array($options) && !empty($options) ) {
            // intersec $options with default treshold options
            $options = array_intersect_key( $options, $default );
            
            if ( !empty($options) ) { // we get intersection
                foreach ( $default as $param => $defaultOptionValue ) {
                    // make sure default key exists in $options
                    if ( array_key_exists( $param, $options ) && !empty($options[$param]) ) {
                    } else {
                        $options[$param] = $defaultOptionValue;
                    }
                }
            } else { // no intersection, set $options to default
                $options = $default;
            }
            
        } else {
            $options = $default;
        }
        
        return $default;
    }

/**
 * Check data passed to setup, make sure it's valid.
 * Valid data is an array which contains: 'values' => array_of_values, 'name' => 'string_of_name'
 * Example:
 * $Cust1 = array( 'values' => array(1,4,3,4,3,3,2,1,0,7,4,3), 'name' => 'Cust1' );
 * $Cust2 = array( 'values' => array(1,4,2,6,2,3,0,1,5,1,2,4), 'name' => 'Cust2' );
 * $Cust3 = array( 'values' => array(1,5,7,6,2,6,0,1,0,4,5,4), 'name' => 'Cust3' );
 * $Cust4 = array( 'values' => array(2,5,4,4,4,3,4,3,4,2,4,3), 'name' => 'Cust4' );
 * $Cust5 = array( 'values' => array(3,5,1,6,2,3,0,1,5,1,2,4), 'name' => 'Cust5' );
 * $Customers = array($Cust1, $Cust2, $Cust3, $Cust4, $Cust5, $Cust6);
 *
 * Above is a valid data which can be passed to setup $this->setup($Customers, 'line', true);
 * @param array $data Array of data
 * @param string $type Type of chart, available types: 'line', 'bar' and 'pie'
 * @param bool $month If set to true $data threated as montly, if values of data consists more than
 *                     12, values will be chunked into 12 values. If set to false, data is not threated
 *                     as monthly or annual data.
 * @param array $options. Additional parameters, available as:
 *      - 'x' => label for x axe
 *      - 'y' => label for y axe
 *      - 'shadow' => if chart type is bar then if shadow set to true, give bars shadow.
 *        See $this->setup() when calling draw chart method, that this key is checked
 *      - 'title' => title of the chart
 * @return mixed return false if not valid, if valid it will give valid $data back
 */ 
    function __checkData( $data, $type, $month, $options ) {
        // make sure data is array, not empty and less than 9
        if ( is_array($data) && ( count($data) > 0 ) && ( count($data) < 9 ) ) {
            
            // make sure $this->data is already initialized
            if ( !$this->data ) {
                $this->errors[] = '$chart->__checkData is called before $this->data is initialized. Make sure call $chart->setup() first';
                return false;
            }
            
            if ($month) {
                // prepare for setting the data which has the most values elements
                // This is related if monthly type and see iterated $data for setting
                // $this->data->Data[$i]['Name'] to set x axis label
                $mostData = 0; // index key of element data which has the most elements
                $mostDataElements = count($data[$mostData]['values']); // quantity of its elements
            }
            
            // Add point to data
            foreach( $data as $key => $content ) {
                // if monthly, trim elements which key is higher than 11
                if ( $month ) {
                    if (count($content['values']) > 12) {
                        $content['values'] = array_slice($content['values'], 0, 12);
                    }
                    
                    if ( count( $content['values'] ) > $mostDataElements ) {
                        $mostData = $key;
                        $mostDataElements = count( $content['values'] );
                    }
                }
                
                $this->data->AddPoint( $content['values'], $content['name'] );
                if ( $type === 'pie' ) {
                    $this->data->AddPoint( $content['pieValues'], $content['pieName'] );
                }
                
                // set point, max and min of values for each data
                // this is related to $this->label and $this->labels
                // if monthly type make sure index is refence to month name
                if ( $month ) {
                    $data[$key]['max'] = $this->__numToMonth(array_search(max($content['values']), $content['values']));
                    $data[$key]['min'] = $this->__numToMonth(array_search(min($content['values']), $content['values']));
                } else { // not a month type, then use key index
                    $data[$key]['max'] = array_search(max($content['values']), $content['values']);
                    $data[$key]['min'] = array_search(min($content['values']), $content['values']);
                }
            }
            $this->data->AddAllSeries();
            
            if ( $type === 'pie' ) {
                $this->data->SetAbsciseLabelSerie($content['pieName']);
            } else {
                $this->data->SetAbsciseLabelSerie();
            }
            
            foreach ( $data as $content ) {
                $this->data->SetSerieName( $content['name'], $content['name'] );
            }
            
            // set label on y and x axis
            if ( array_key_exists('x', $options) ) {
                //$this->data->SetXAxisName( $options['x'] );
            }
            
            if ( array_key_exists('y', $options) ) {
                $this->data->SetYAxisName($options['y']);
                $this->data->SetYAxisFormat('hide');
            }
            
            /* set x axis label to be months name */
            if ( $month ) {
                for ($i = 0; $i < $mostDataElements; $i++) {
                    $this->data->Data[$i]['Name'] = $this->__numToMonth($i);
                }
            } else {
                $i = 0;
                foreach ($data[0]['values'] as $_keyC => $_valC) {
                    $this->data->Data[$i]['Name'] = $_keyC;
                    $i++;
                }
            }
            
            return $data;
        } else {
            $this->errors[] = 'Data passed to $chart->setup() is not valid.';
            return false;
        }
    }
 
/**
 * Convert number to month (0 to Jan, 1 to Feb, 11 to Dec etc)
 * @param int $num acceptable 0-11
 * @return string of Month Name
 */
    function __numToMonth($num) {
        switch ($num) {
            case 0: 
                return 'Jan';
            case 1:
                return 'Feb';
            case 2: 
                return 'Mar';
            case 3:
                return 'Apr';
            case 4: 
                return 'May';
            case 5:
                return 'Jun';
            case 6: 
                return 'Jul';
            case 7:
                return 'Aug';
            case 8: 
                return 'Sep';
            case 9:
                return 'Oct';
            case 10: 
                return 'Nov';
            case 11:
                return 'Dec';
            default:
                return '';
        }
    }
/**
 * Check wether has an error or not
 * @param array $error array of errors
 * @return mixed of errors or false when $this->erros is empty
 */ 
    function error() {
        if ( !empty( $this->errors) ) {
            return array('ChartHelper Error' => $this->errors);
        } else {
            return false;
        }
    }
    
    function cleanup() {
        unset($this->data);
        unset($this->chart);
    }
}
?>