<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
 "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
   <title>
        <?php echo $session->read('Site.site_name'); ?>
		<?php echo ' :: ' . $title_for_layout; ?>
   </title>
   <?php
        echo $html->meta('icon');
		echo $html->css('rfg');        
		echo $html->css('style');        
        echo $html->script('jquery');
        echo $html->script('jquery.scrollto.min');
        echo $html->script('global');
        echo $scripts_for_layout;
    ?>
</head>
<body>
<div class="tophdw">
    <div id="tophd" class="tophdc">
        <?php
            echo $html->image('logo');
        ?>
        <h1>
            <?php echo $html->link($session->read('Site.site_name'), '/');?>
        </h1>
        <div id="tophdnav">&nbsp;</div>
        <div class="clear">&nbsp;</div>
    </div>
</div>
<div class="tophdw" id="subtophdw">
    <div id="subtophd" class="tophdc">&nbsp;</div>
</div>
<div id="custom-doc" class="yui-t2">
    <div id="bd" role="main">
        <?php echo $content_for_layout;?>
	</div>
    <div id="ft" role="contentinfo">
        <div id="ftl">
            <p>
                <strong><?php echo $session->read('Site.site_name');?></strong>
                <br/>
                <?php echo $session->read('Site.site_address1');?><br />
                <?php echo $session->read('Site.site_address2');?>
                <br />
                <?php echo $session->read('Site.site_email');?> &mdash Telp. : <?php echo $session->read('Site.site_phone');?>
            </p>
        </div>
        <div id="ftr">
            <p>
                Copyright &copy; <?php echo date('Y');?>, <?php echo $session->read('Site.site_name');?>,<br />
                All Rights Reserved
            </p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="loading"></div>
<?php echo $this->element('sql_dump'); ?>
</body>
</html>
