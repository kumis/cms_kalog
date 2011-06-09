<?php
/**
 * Money behavior class.
 *
 * Enables particular fields threaded as a money
 * 
 */
class MoneyBehavior extends ModelBehavior {
/**
 * Defaults
 *
 * @var array
 * @access protected
 */
	var $_defaults = array(
		'fields' => array('unit_amount', 'amount'),
        'thousands_separator' => ',',
        'decimal_separator' => '.'
	);
/**
 * Initiate Money behavior
 *
 * @param object $Model instance of model
 * @param array $config array of configuration settings.
 * @return void
 * @access public
 */
	function setup(&$Model, $config = array()) {
	    if (!is_array($config)) {
			$config = array('fields' => $config);
		}
		$settings = array_merge($this->_defaults, $config);

		$this->settings[$Model->alias] = $settings;
    }
    
/**
 * Before save method. Called after all saves
 *
 * Remove thousand-separator before saving
 *
 * @param AppModel $Model Model instance.
 * @param boolean $created indicates whether the node just saved was created or updated
 * @return boolean true on success, false on failure
 * @access public
 */
	function beforeSave(&$Model) {
        extract($this->settings[$Model->alias]);
        
        // remove thousand separator on fields
        // listed as money
        foreach ( $fields as $field ) {
            if ((isset($Model->data[$Model->alias][$field])) && 
                $Model->data[$Model->alias][$field]) {
                
                $Model->data[$Model->alias][$field] = str_replace( ',', '',
                    $Model->data[$Model->alias][$field] );
            }
        }
        
        return false;
	}

/**
 * After find method.
 *
 * Added thousand-separator after find
 *
 * @param AppModel $Model Model instance.
 * @param array $results
 * @param boolean $primary
 * @return array modified results
 * @access public
 */    
    function afterFind(&$Model, $results, $primary) {
        $this->runtime[$Model->alias]['fields'] = array();
		
		if (empty($results) || empty($this->runtime[$Model->alias]['beforeFind'])) {
			return $results;
		}
        
        $beforeFind = $this->runtime[$Model->alias]['beforeFind'];
        
    }
}
?>