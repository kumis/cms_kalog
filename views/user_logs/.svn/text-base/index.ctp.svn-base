<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array("fields" => array(
                "user_id" => array(
                    'title' => __("Nama", true), 
                    'sortable' => true
                ),
                "username" => array(
                    'title' => __("Username", true), 
                    'sortable' => false
                ),
                "ip_address" => array(
                    'title' => __("Alamat IP", true),
                    'sortable' => false
                ),
                "controller" => array(
                    'title' => __("Controller", true),
                    'sortable' => false
                ),
                "action" => array(
                    'title' => __("Action", true),
                    'sortable' => false
                ),
                "request_method" => array(
                    'title' => __("Metode Request", true),
                    'sortable' => false
                ),
                "referer" => array(
                    'title' => __("Referer", true),
                    'sortable' => false
                ),
                "url" => array(
                    'title' => __("URL", true),
                    'sortable' => false
                ),
                "user_agent" => array(
                    'title' => __("User-Agent", true),
                    'sortable' => false
                ),
                "created" => array(
                    'title' => __("Waktu log", true),
                    'sortable' => true
                )
              ),
              "editable"  => "name",
              "assoc" => array(
                'user_id' => array(
                    'field' => 'name',
                    'model' => 'User'
                ),
                'username' => array(
                    'field' => 'username',
                    'model' => 'User'
                )
              ),
              "displayedAs" => array(
                'created' => 'datetime'
              )
        ));
?>
</div>