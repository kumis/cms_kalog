<form accept-charset="utf-8" action="/parking_new/services/authenticate" method="post" id="UserLoginForm">
			<?php echo $form->input('username', array('class' => 'inputText'));?>
            <?php echo $form->input('password', array('class' => 'inputText'));?>
            <?php echo $form->input('remember_me', array('type' => 'checkbox', 'class' => 'inputText'));?>
            <?php echo $form->submit('Login', array('class' => 'inputButton'));?>        
</form>
