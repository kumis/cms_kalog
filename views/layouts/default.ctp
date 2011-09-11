<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<?php echo $this->Html->charset(); ?>
		<title><?php echo 'AppCore :: ' . $title_for_layout; ?></title>
		<?php
			echo $html->meta('icon');		       
			echo $html->css('960-12gridFluid');        
			 
			echo $html->css('layout');    
			echo $html->css('text');
			echo $html->css('form');
			echo $html->css('jquery-ui-1.8.16.custom');
			echo $html->css('ui.jqgrid');
			echo $html->css('jquery-simpleTreeMenu-1.0.0');
			
			echo $html->script('jquery-1.6.1.min');
			echo $html->script('jquery-ui-1.8.16.custom.min');
			echo $html->script('jquery.formalize');
			echo $html->script('jquery-fluid16');
			echo $html->script('jquery-simpleTreeMenu-1.0.0');
			echo $html->script('i18n/grid.locale-en');
			echo $html->script('jquery.jqGrid.src');
			
			echo $scripts_for_layout;
			echo "<script type='text/javascript'>\n";
				echo "$(function(){\n";
					if ($session->check('Message.flash')):
						echo "$(window).load(function(){".
							 "setTimeout(function(){".
								"$('#flashMessage').fadeOut('slow');".
							 "}, 3600);".
						"});";
					endif;
				echo "\n});";
			echo "</script>";
		?>
	</head>
	<body>
		<div class="tophdw">
                <div id="tophd" class="tophdc">
                <?php
                    echo $html->image('logo', array('height' => 40, 'weight' => 20));
                ?>
                <h1>
                    <?php echo $html->link($session->read('Site.site_name'), '/');?>
                </h1>
                <div id="tophdnav">
                    <nobr>
                        <span>Welcome back, </span><strong><?php echo $profile['name'];?></strong>
                        |
                        <span><?php echo $html->link(__('Home', true), '/');?></span> |
                        <span><?php echo $html->link(__('Preferences', true), '/users/preferences');?></span> |
                        <span><?php echo $html->link(__('Help', true), '#');?></span> |
                        <span><?php echo $html->link(__('Logout', true), '/users/logout');?></span>
                    </nobr>
                </div>
                <div class="clear"></div>
            </div>
        </div>
		<div class="container_12">
			
			<div class="grid_12">

				<?php 
					echo $session->flash(); 
					echo $session->flash('auth');
				?>
			</div>
			<div class="clear"></div>
			<div class="grid_3">
				<div class="box"> 
					 
					<div class="block" id="right-menu"> 
						<div class="sidebar">
                            <div class="sidebarc">                       
                                <div class='sidebarch'>
                                    <h2> 
                                    Application Menu
                                    </h2>
                                </div>
                                <div class='sidebarcb'>
                                    <ul class="Tree" id="DemoTree"> 
                                        <li> 
                                            <span>System and Utility</span>
                                            <ul>
                                                <li>
                                                    <span>Master Data</span>
                                                    <ul>
                                                        <li><a href="Carriages/index">Carriage</a></li> 
                                                        <li><a href="Schedules/index">Schedule</a></li> 
                                                        <li><a href="Locomotives/index">Locomotive</a></li> 
                                                        <li><a href="Freights/index">Freight</a></li> 
                                                    </ul> 
                                                </li> 
                                            </ul> 
                                        </li> 
                                    </ul>
                                    </div>
                               </div>             
						</div>
                         <?php echo $this->element('menu.sidebar', array(
                                    'cache' => array('time'=> "+14 days", 'key' => 'group_id_' . $profile['group_id'])
                            ));
                        ?>		
					</div> 
				</div> 
			</div>
			<div class="grid_9"> 
				<?php echo $content_for_layout; ?>
			</div>
			<div class="clear"></div>
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
            <?php
                if ( isset($profile['last_login']) ) {
                    echo 'Anda login terakhir kali ' . $time->format('d/m/Y H:i', $profile['last_login']);
                }
            ?>
        </div>
        <div class="clear"></div>
    </div>
    <div id="loading"></div>
        <?php echo $this->element('sql_dump'); ?>
       
	</body>
</html>
<script>
	$(document).ready(function() {
		$('.Tree').simpleTreeMenu();
	});
</script>
