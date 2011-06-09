<?php
class City extends AppModel {
    var $validate = array(
        'province_id' => array(
            'rule' => array('vProvince'),
            'message' => 'Choose based on available option'
        ),
        'name' => array(
            'required' => array(
                'allowEmpty' => false,
                'rule' => array('nonEmpty'),
                'message' => 'This field cannot be empty'
            ),
            'maxlength' => array(
                'rule' => array('maxlength', 60),
                'message' => 'Maximum character is 60 characters'
            ),
        ),
        'other_name' => array(
            'required' => array(
                'allowEmpty' => false,
                'rule' => array('nonEmpty'),
                'message' => 'This field cannot be empty'
            ),
            'maxlength' => array(
                'rule' => array('maxlength', 255),
                'message' => 'Maximum character is 255 characters'
            )
        )
    );
    var $belongsTo = array('Province');
    
/**
 * Methods with v prefix are custom validation
 * rule
 */
    function vProvince($field) {
        return $this->Province->find('count', array(
            'conditions' => array(
                'Province.id' => $field["province_id"]
            ),
            'recursive' => -1
        )) > 0;
    }
}
?>
