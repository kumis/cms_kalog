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
        echo $scripts_for_layout;
    ?>
</head>
<body>
<div id="custom-doc" class="yui-t2">
    <div id="bd" role="main">
        <?php echo $content_for_layout;?>
	</div>
</div>
<?php //echo $javascrip->link('jquery');?>
<script type="text/javascript">
    $(function() {
        //window.print();
    });
</script>
</body>
</html>