<?php 
    $menus = $this->requestAction(
        array(
            'controller' => 'menus', 'action' => 'menu'
        )
    );
?>
<?php foreach ($menus['names'] as $menu): ?>
<div class="sidebar">
    <div class="sidebarc">
        <div class="sidebarch">
            <h2><?php echo $menu['name'];?></h2>
        </div>
        <div class="sidebarcb">
            <?php
                echo $tree->generate($menus['lists'][$menu['id']], array(
                    'class' => 'sidebar_menus',
                    'model' => 'Menu',
                    'alias' => 'name'
                ));
            ?>
        </div>
    </div>
</div>
<?php endforeach; ?>