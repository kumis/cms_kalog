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
		echo $html->css('rfg', 'stylesheet', array(
            'media' => 'print, screen'
        ));
		echo $html->css('print', 'stylesheet', array(
            'media' => 'print, screen'
        ));
        echo $scripts_for_layout;
    ?>
</head>
<body>
<div id="custom-doc" class="yui-t2">
    <div id="bd" role="main">
        <div id="printhtml">
        <?php echo $content_for_layout;?>
        </div>
	</div>
</div>
<script type="text/javascript">
    //window.print();
</script>
</body>
</html>