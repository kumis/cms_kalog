<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<?php echo $html->charset(); ?>
	<title>
		<?php __(APP_NAME); ?>
		<?php echo ' :: ' . $title_for_layout; ?>
	</title>
	<?php
		echo $html->meta('icon');
		echo $html->css('styles');        
        echo $javascript->link('jquery');
        echo $javascript->link('jquery.scrollto.min');
        echo $javascript->link('global');
        echo $scripts_for_layout;
        echo "<script type='text/javascript'>\n";
        echo "$(function(){\n";
            // for table grid
            /*
            if ( isset($form_js) && !empty($form_js) ) { 
                echo $form_js;
            }*/
            
            // flash message
            /*
            if ($session->check('Message.flash')):
                echo "$(window).load(function(){" .
                     "setTimeout(function(){" .
                     "$('.flash_box').fadeOut('slow');" .
                     "}, 700);" .
                "});";
            endif;
            */
        echo "\n});";
        echo "</script>";
	?>
</head>
<body>
	<div id="box">
	<div id="header">
		<h1><a href="#">Website title</a></h1> 
		<h2>Pendaftaran Mahasiswa Baru</h2>
		<menu>
			<?php echo $menus;?>
		</menu>
	</div>
	<div id="content">
		<div id="left-sidebar">
            <?php if ( !$showProfile && $showLoginForm ): ?>
		    <div id="loginBox">
                <?php echo $form->create('Student', array('action' => 'login'));?>
                <fieldset style="display: none;"><input type="hidden" value="POST" name="_method"/></fieldset>
                    <p>
                        <?php echo $form->input('registration_no', array('div' => false, 'class' => 'inputText', 'maxlength' => 20, 'size' => 14, 'label' => 'Kode Pendaftaran'));?>
                    </p>
                    <p>
                        <?php echo $form->input('password', array('div' => false, 'class' => 'inputText', 'maxlength' => 20, 'size' => 14, 'label' => 'Password'));?>
                    </p>
                    <p>
                        <input type="submit" class="inputButton" value="Login" />
                        <input type="reset" class="inputButton" value="Reset" />
                    </p>
                    <p id="regInfo">Untuk pendaftaran, silahkan klik <a href="<?php echo 'http://' . $_SERVER['HTTP_HOST']. '/' . BASE_URL . '/students/home'; ?>">disini</a></p>
                </form>
            </div>
            <?php else: // we show profile ?>
            <?php if ($showProfile): ?>
            <div id="profileBox">
                <p>Selamat datang <strong><?php echo $profile['name'];?></strong></p>
                <p>Kode pendaftaran Anda : <strong><?php echo $profile['registration_no'];?></strong></p>
                <p>Email Anda : <strong><?php echo $profile['email'];?></strong></p>
                <p id="regInfo">Untuk mengupdate profile Anda, silahkan klik <a href="<?php echo 'http://' . $_SERVER['HTTP_HOST']. '/' . BASE_URL . '/students/dashboard'; ?>">disini</a>. Untuk keluar dari sistem ini, silahkan klik <a href="<?php echo 'http://' . $_SERVER['HTTP_HOST']. '/' . BASE_URL . '/students/logout'; ?>">disini</a>.</p>
            </div>
            <?php endif;?>
            <?php endif;?>
			<span>Links</span>
			<ul>
				<li><a href="http://paramadina.ac.id/">Paramadina</a></li>
				<li><a href="#">Staff Web Mail</a></li>
				<li><a href="#">Student Web Mail</a></li>
				<li><a href="#">E-Learning</a></li>
				<li><a href="#">Library</a></li>
				<li><a href="#">Wiki</a></li>
				<li><a href="#">Knowledge</a></li>
				<li><a href="#">Helpdesk</a></li>
				<li><a href="#">Gallery</a></li>
				<li><a href="#">Mirror</a></li>
			</ul>
		</div>
		
		<div id="right-sidebar">
		<?php
            echo $content_for_layout;
        ?>	
		</div>
	</div>
	
	<div id="footer">
		<p class="footer-text1">© 2009 by <a href="#">Website title</a> | All rights reserved | <a href="#header" id="b2top">To the top</a></p>
		<p class="footer-text2"><strong>Developed:</strong> <a href="http://gedex.web.id">Gedex</a></p>
	</div>

</div>
<?php echo $cakeDebug; ?>
</body>
</html>
