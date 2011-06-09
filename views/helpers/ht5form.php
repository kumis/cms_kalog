<?php
class Ht5formHelper extends FormHelper{
	/**
	 * construct input class from cake/core form.php
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * */
	function input($fieldName, $options = array()) {
		$this->setEntity($fieldName);

		$options = array_merge(
			array('before' => null, 'between' => null, 'after' => null, 'format' => null),
			$this->_inputDefaults,
			$options
		);

		$modelKey = $this->model();
		$fieldKey = $this->field();
		if (!isset($this->fieldset[$modelKey])) {
			$this->_introspectModel($modelKey);
		}

		if (!isset($options['type'])) {
			$magicType = true;
			$options['type'] = 'text';
			if (isset($options['options'])) {
				$options['type'] = 'select';
			} elseif (in_array($fieldKey, array('psword', 'passwd', 'password'))) {
				$options['type'] = 'password';
			} elseif (isset($this->fieldset[$modelKey]['fields'][$fieldKey])) {
				$fieldDef = $this->fieldset[$modelKey]['fields'][$fieldKey];
				$type = $fieldDef['type'];
				$primaryKey = $this->fieldset[$modelKey]['key'];
			}

			if (isset($type)) {
				$map = array(
					'string'  => 'text',     'datetime'  => 'datetime',
					'boolean' => 'checkbox', 'timestamp' => 'datetime',
					'text'    => 'textarea', 'time'      => 'time',
					'date'    => 'date',     'float'     => 'text'
				);

				if (isset($this->map[$type])) {
					$options['type'] = $this->map[$type];
				} elseif (isset($map[$type])) {
					$options['type'] = $map[$type];
				}
				if ($fieldKey == $primaryKey) {
					$options['type'] = 'hidden';
				}
			}
			if (preg_match('/_id$/', $fieldKey) && $options['type'] !== 'hidden') {
				$options['type'] = 'select';
			}

			if ($modelKey === $fieldKey) {
				$options['type'] = 'select';
				if (!isset($options['multiple'])) {
					$options['multiple'] = 'multiple';
				}
			}
		}
		$types = array('checkbox', 'radio', 'select');

		if (
			(!isset($options['options']) && in_array($options['type'], $types)) ||
			(isset($magicType) && $options['type'] == 'text')
		) {
			$view =& ClassRegistry::getObject('view');
			$varName = Inflector::variable(
				Inflector::pluralize(preg_replace('/_id$/', '', $fieldKey))
			);
			$varOptions = $view->getVar($varName);
			if (is_array($varOptions)) {
				if ($options['type'] !== 'radio') {
					$options['type'] = 'select';
				}
				$options['options'] = $varOptions;
			}
		}

		$autoLength = (!array_key_exists('maxlength', $options) && isset($fieldDef['length']));
		if ($autoLength && $options['type'] == 'text') {
			$options['maxlength'] = $fieldDef['length'];
		}
		if ($autoLength && $fieldDef['type'] == 'float') {
			$options['maxlength'] = array_sum(explode(',', $fieldDef['length']))+1;
		}

		$divOptions = array();
		$div = $this->_extractOption('div', $options, true);
		unset($options['div']);

		if (!empty($div)) {
			$divOptions['class'] = 'input';
			$divOptions = $this->addClass($divOptions, $options['type']);
			if (is_string($div)) {
				$divOptions['class'] = $div;
			} elseif (is_array($div)) {
				$divOptions = array_merge($divOptions, $div);
			}
			if (
				isset($this->fieldset[$modelKey]) &&
				in_array($fieldKey, $this->fieldset[$modelKey]['validates'])
			) {
				$divOptions = $this->addClass($divOptions, 'required');
			}
			if (!isset($divOptions['tag'])) {
				$divOptions['tag'] = 'div';
			}
		}

		$label = null;
		if (isset($options['label']) && $options['type'] !== 'radio') {
			$label = $options['label'];
			unset($options['label']);
		}

		if ($options['type'] === 'radio') {
			$label = false;
			if (isset($options['options'])) {
				$radioOptions = (array)$options['options'];
				unset($options['options']);
			}
		}

		if ($label !== false) {
			$label = $this->_inputLabel($fieldName, $label, $options);
		}

		$error = $this->_extractOption('error', $options, null);
		unset($options['error']);

		$selected = $this->_extractOption('selected', $options, null);
		unset($options['selected']);

		if (isset($options['rows']) || isset($options['cols'])) {
			$options['type'] = 'textarea';
		}

		if ($options['type'] === 'datetime' || $options['type'] === 'date' || $options['type'] === 'time' || $options['type'] === 'select') {
			$options += array('empty' => false);
		}
		if ($options['type'] === 'datetime' || $options['type'] === 'date' || $options['type'] === 'time') {
			$dateFormat = $this->_extractOption('dateFormat', $options, 'MDY');
			$timeFormat = $this->_extractOption('timeFormat', $options, 12);
			unset($options['dateFormat'], $options['timeFormat']);
		}

		$type = $options['type'];
		$out = array_merge(
			array('before' => null, 'label' => null, 'between' => null, 'input' => null, 'after' => null, 'error' => null),
			array('before' => $options['before'], 'label' => $label, 'between' => $options['between'], 'after' => $options['after'])
		);
		$format = null;
		if (is_array($options['format']) && in_array('input', $options['format'])) {
			$format = $options['format'];
		}
		unset($options['type'], $options['before'], $options['between'], $options['after'], $options['format']);

		switch ($type) {
			case 'hidden':
				$input = $this->hidden($fieldName, $options);
				$format = array('input');
				unset($divOptions);
			break;
			case 'checkbox':
				$input = $this->checkbox($fieldName, $options);
				$format = $format ? $format : array('before', 'input', 'between', 'label', 'after', 'error');
			break;
			case 'radio':
				$input = $this->radio($fieldName, $radioOptions, $options);
			break;
			case 'text':
			case 'password':
			case 'file':
				$input = $this->{$type}($fieldName, $options);
			break;
			case 'select':
				$options += array('options' => array());
				$list = $options['options'];
				unset($options['options']);
				$input = $this->select($fieldName, $list, $selected, $options);
			break;
			case 'time':
				$input = $this->dateTime($fieldName, null, $timeFormat, $selected, $options);
			break;
			case 'date':
				$input = $this->dateTime($fieldName, $dateFormat, null, $selected, $options);
			break;
			case 'datetime':
				$input = $this->dateTime($fieldName, $dateFormat, $timeFormat, $selected, $options);
			break;
			case 'textarea':
				$input = $this->textarea($fieldName, $options + array('cols' => 30, 'rows' => 6));
			break;
			default:
				$input = $this->defaultInput($type, $fieldName, $options);
			break;
		}

		if ($type != 'hidden' && $error !== false) {
			$errMsg = $this->error($fieldName, $error);
			if ($errMsg) {
				$divOptions = $this->addClass($divOptions, 'error');
				$out['error'] = $errMsg;
			}
		}

		$out['input'] = $input;
		$format = $format ? $format : array('before', 'label', 'between', 'input', 'after', 'error');
		$output = '';
		foreach ($format as $element) {
			$output .= $out[$element];
			unset($out[$element]);
		}

		if (!empty($divOptions['tag'])) {
			$tag = $divOptions['tag'];
			unset($divOptions['tag']);
			$output = $this->Html->tag($tag, $output, $divOptions);
		}
		return $output;
	}
	
	/**
	* Creates a default input widget, whose type is determined by $options['type'].
	*
	* @param string $fieldName Name of a field, in the form "Modelname.fieldname"
	* @param array $options Array of HTML attributes.
	* @return string A generated HTML input element
	* @access public
	*/
	function defaultInput($type, $fieldName, $options = array()) {
			$options = $this->_initInputField($fieldName, array_merge(
					array('type' => $type), $options
			));
			return sprintf(
					$this->Html->tags['input'],
					$options['name'],
					$this->_parseAttributes($options, array('name'), null, ' ')
			);
	}
	
}
