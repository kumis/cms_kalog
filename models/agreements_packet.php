<?php
class AgreementsPacket extends AppModel{
    var $hasMany = array();
    var $belongsTo = array('Agreement','Packet');
}
?>
