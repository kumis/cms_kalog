<div id="loginBox">
    <?php echo $session->flash('auth');?>
    <div class="login">
    <h2>Login</h2>    
        <?php echo $form->create('User', array('action' => 'login'));?>
            <?php echo $form->input('username', array('class' => 'inputText'));?>
            <?php echo $form->input('password', array('class' => 'inputText'));?>
            <?php echo $form->input('remember_me', array('type' => 'checkbox', 'class' => 'inputText'));?>
            <?php echo $form->submit('Login', array('class' => 'inputButton'));?>
        <?php echo $form->end(); ?>
    </div>
</div>
