<?php
class User extends AppModel {
	var $name = 'User';
    var $validate = array(
        'name' => array(
            'required' => array(
                'required' => true,
                'allowEmpty' => false,
                'rule' => '/^[\w\s]+$/',
                'message' => 'This field is required',
                'last' => true
            ),
            'max' => array(
                'rule' => array('maxLength', 30),
                'message' => 'Maximum character is 30 characters'
            )
        ),
        'username' => array(
            'required' => array(
                'required' => true,
                'allowEmpty' => false,
                'rule' => 'alphaNumeric',
                'message' => 'This field is required',
                'last' => true
            ),
            'max' => array(
                'rule' => array('maxLength', 10),
                'message' => 'Maximum character is 10 characters'
            ),
            'unique' => array(
                'rule'=>array('unique', 'username'),
                'message' => 'This username is already registered'
            )
        ),
        'group_id' =>  array(
            'required' => true,
            'allowEmpty' => false,
            'rule' => array('vGroup'),
            'message' => 'Choose based on available option'
        ),
        'password_real' => array(
            'required' => array(
                'required' => true,
                'allowEmpty' => false,
                'rule' => 'alphaNumeric',
                'message' => 'This field is required',
                'last' => true
            ),
            'max' => array(
                'rule' => array('maxLength', 20),
                'message' => 'Maximum character is 20 characters'
            ),
            'confirm' => array(
                'rule' => array('vPasswdConfirm'),
                'message' => "Password doesn't match with you typed below"
            )
        ),
        'email' => array(
            'valid' => array(
                'required' => true,
                'allowEmpty' => false,
                'rule' => array('email'),
                'message' => 'Fill with valid email'
            ),
            'unique' => array(
                'rule'=>array('unique', 'email'),
                'message' => 'This email is already registered'
            )
        ),
        'sex' => array(
            'required' => false,
            'allowEmpty' => true,
            'rule' => array('inList', array('P', 'L', '')),
            'message' => 'Choose based on available option'
        ),
        'unit_code_id' =>  array(
            'required' => false,
            'allowEmpty' => true,
            'rule' => array('vUnit'),
            'message' => 'Choose based on available option'
        ),
        'province_id' =>  array(
            'required' => false,
            'allowEmpty' => true,
            'rule' => array('vProvince'),
            'message' => 'Choose based on available option'
        ),
        'city_id' =>  array(
            'required' => false,
            'allowEmpty' => true,
            'rule' => array('vCity'),
            'message' => 'Choose based on available option'
        ),
        'handphone' => array(
            'required' => false,
            'allowEmpty' => true,
            'rule' => 'vPhone',
            'message' => 'Fill with valid handphone or homephone'
        ),
        'homephone' => array(
            'required' => false,
            'allowEmpty' => true,
            'rule' => 'vPhone',
            'message' => 'Fill with valid handphone or homephone'
        )
    );
    
 	var $belongsTo = array(
        'Group',
        'Province',
        'City',
        'UnitCode',
        'CreatedBy' => array(
            'className' => 'User',
            'foreignKey' => 'created_by'
        ),
    );
    
    var $hasMany = array(
        'UserPreference'
    );
    
    function beforeSave() {
        if ( isset($this->data[$this->name]['password_real']) ) {
            // real password
            $this->data[$this->name]['password'] = sha1($this->data[$this->name]['password_real']);
        }
        return true;
    }
/**
 * Methods with v prefix are custom validation
 * rule
 */
    function vGroup($field) {
        return $this->Group->find('count', array(
            'conditions' => array(
                'Group.id' => $field["group_id"]
            ),
            'recursive' => -1
        )) > 0;
    }
    
    function vUnit($field) {
        return $this->UnitCode->find('count', array(
            'conditions' => array(
                'UnitCode.id' => $field["unit_code_id"]
            ),
            'recursive' => -1
        )) > 0;
    }
    
    function vProvince($field) {
        return $this->Province->find('count', array(
            'conditions' => array(
                'Province.id' => $field["province_id"]
            ),
            'recursive' => -1
        )) > 0;
    }
    
    function vCity($field) {
        $exist = $this->City->find('count', array(
            'conditions' => array(
                'City.id' => $field["city_id"],
                'City.province_id' => $this->data['User']["province_id"]), 
            'recursive' => -1)
        );
        return $exist > 0;
    }
    
    function vPhone() {
        $phone = '';
        if ( (isset($this->data['User']['handphone']) && !empty($this->data['User']['handphone'])) ) {
            $phone = $this->data['User']['handphone'];
        } else if ( (isset($this->data['User']['homephone']) && !empty($this->data['User']['homephone'])) ) {
            $phone = $this->data['User']['homephone'];
        }
        if (!empty($phone) && preg_match('|^\(?\d{3,}\)?\s?-?\s?\d{3,}$|', $phone)) {
            return true;
        }
        
        return false;
    }
    
    function vPasswdConfirm() {
        if ( isset($this->data['User']['password_real']) && isset($this->data['User']['password_confirm']) ) {
            
            if ( $this->data['User']['password_real'] == $this->data['User']['password_confirm'] ) {
                return true;
            }
        }
        
        return false;
    }
    
    
    function hashPasswords($data) {
        if (isset($data['User']['password'])) {
            $data['User']['password'] = sha1($data['User']['password']);
            return $data;
        }
        return $data;
    }
}
?>
