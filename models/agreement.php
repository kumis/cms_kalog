<?php
class Agreement extends AppModel{
    var $belongsTo = array('Customer');
    
    var $hasMany = array('AgreementsPacket');
}
?>
