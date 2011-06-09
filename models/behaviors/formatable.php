<?php
/**
 * Formatable behavior class.
 *
 * Enables a model field to be easily formatted
 * by its field type or name
 */
class FormatableBehavior extends ModelBehavior {
/**
 * Errors
 *
 * @var array
 */
	var $errors = array();
/**
 * Defaults
 *
 * @var array
 * @access protected
 */
	var $_defaults = array(
		'parent' => 'parent_id', 'left' => 'lft', 'right' => 'rght',
		'scope' => '1 = 1', 'type' => 'nested', '__parentChange' => false, 'recursive' => -1
	);
/**
 * Initiate Tree behavior
 *
 * @param object $Model instance of model
 * @param array $config array of configuration settings.
 * @return void
 * @access public
 */
	function setup(&$Model, $config = array()) {
		if (!is_array($config)) {
			$config = array('type' => $config);
		}
		$settings = array_merge($this->_defaults, $config);

		if (in_array($settings['scope'], $Model->getAssociated('belongsTo'))) {
			$data = $Model->getAssociated($settings['scope']);
			$parent =& $Model->{$settings['scope']};
			$settings['scope'] = $Model->alias . '.' . $data['foreignKey'] . ' = ' . $parent->alias . '.' . $parent->primaryKey;
			$settings['recursive'] = 0;
		}
		$this->settings[$Model->alias] = $settings;
	}
/**
 * After save method. Called after all saves
 *
 * Overriden to transparently manage setting the lft and rght fields if and only if the parent field is included in the
 * parameters to be saved.
 *
 * @param AppModel $Model Model instance.
 * @param boolean $created indicates whether the node just saved was created or updated
 * @return boolean true on success, false on failure
 * @access public
 */
	function afterSave(&$Model, $created) {
		extract($this->settings[$Model->alias]);
		if ($created) {
			if ((isset($Model->data[$Model->alias][$parent])) && $Model->data[$Model->alias][$parent]) {
				return $this->_setParent($Model, $Model->data[$Model->alias][$parent], $created);
			}
		} elseif ($__parentChange) {
			$this->settings[$Model->alias]['__parentChange'] = false;
			return $this->_setParent($Model, $Model->data[$Model->alias][$parent]);
		}
	}

/**
 * Before save method. Called before all saves
 *
 * Overriden to transparently manage setting the lft and rght fields if and only if the parent field is included in the
 * parameters to be saved. For newly created nodes with NO parent the left and right field values are set directly by
 * this method bypassing the setParent logic.
 *
 * @since         1.2
 * @param AppModel $Model Model instance
 * @return boolean true to continue, false to abort the save
 * @access public
 */
	function beforeSave(&$Model) {
		extract($this->settings[$Model->alias]);

		if (isset($Model->data[$Model->alias][$Model->primaryKey])) {
			if ($Model->data[$Model->alias][$Model->primaryKey]) {
				if (!$Model->id) {
					$Model->id = $Model->data[$Model->alias][$Model->primaryKey];
				}
			}
			unset($Model->data[$Model->alias][$Model->primaryKey]);
		}

		$this->_addToWhitelist($Model, array($left, $right));
		if (!$Model->id) {
			if (array_key_exists($parent, $Model->data[$Model->alias]) && $Model->data[$Model->alias][$parent]) {
				$parentNode = $Model->find('first', array(
					'conditions' => array($scope, $Model->escapeField() => $Model->data[$Model->alias][$parent]),
					'fields' => array($Model->primaryKey, $right), 'recursive' => $recursive
				));
				if (!$parentNode) {
					return false;
				}
				list($parentNode) = array_values($parentNode);
				$Model->data[$Model->alias][$left] = 0; //$parentNode[$right];
				$Model->data[$Model->alias][$right] = 0; //$parentNode[$right] + 1;
			} else {
				$edge = $this->__getMax($Model, $scope, $right, $recursive);
				$Model->data[$Model->alias][$left] = $edge + 1;
				$Model->data[$Model->alias][$right] = $edge + 2;
			}
		} elseif (array_key_exists($parent, $Model->data[$Model->alias])) {
			if ($Model->data[$Model->alias][$parent] != $Model->field($parent)) {
				$this->settings[$Model->alias]['__parentChange'] = true;
			}
			if (!$Model->data[$Model->alias][$parent]) {
				$Model->data[$Model->alias][$parent] = null;
				$this->_addToWhitelist($Model, $parent);
			} else {
				list($node) = array_values($Model->find('first', array(
					'conditions' => array($scope,$Model->escapeField() => $Model->id),
					'fields' => array($Model->primaryKey, $parent, $left, $right ), 'recursive' => $recursive)
				));

				$parentNode = $Model->find('first', array(
					'conditions' => array($scope, $Model->escapeField() => $Model->data[$Model->alias][$parent]),
					'fields' => array($Model->primaryKey, $left, $right), 'recursive' => $recursive
				));
				if (!$parentNode) {
					return false;
				}
				list($parentNode) = array_values($parentNode);

				if (($node[$left] < $parentNode[$left]) && ($parentNode[$right] < $node[$right])) {
					return false;
				} elseif ($node[$Model->primaryKey] == $parentNode[$Model->primaryKey]) {
					return false;
				}
			}
		}
		return true;
	}
}
?>