<?php
/**
 * Securimage-Driven Captcha Component
 * @author debuggeddesigns.com
 * @license MIT
 * @version 0.1
 */
 
App::import('Vendor', 'secureimage', array(
        'file' => 'securimage' .DS . 'securimage.php'
    )
);
//the local directory of the vendor used to retrieve files
define('CAPTCHA_VENDOR_DIR', ROOT . DS . APP_DIR . DS . 'vendors' . DS . 'securimage' . DS);

class CaptchaComponent extends Object {

    var $controller;
    
    function startup( &$controller ) {

        //add local directory name to paths
        $this->_ttf_file = CAPTCHA_VENDOR_DIR . 'AHGBold.ttf'; 
        $this->_gd_font_file = CAPTCHA_VENDOR_DIR . 'automatic.gdf';
        $this->_audio_path = CAPTCHA_VENDOR_DIR . 'audio' . DS;
        $this->_wordlist_file = CAPTCHA_VENDOR_DIR . 'words' . DS . 'words.txt';
        $this->_background_directory = CAPTCHA_VENDOR_DIR . 'backgrounds' . DS;
        
        
        //CaptchaComponent instance of controller is replaced by a securimage instance
        $controller->captcha =& new securimage();
        
        //Change some settings
        $controller->captcha->image_width = 250;
        $controller->captcha->image_height = 80;
        $controller->captcha->perturbation = 0.85;
        $controller->captcha->image_bg_color = new Securimage_Color(0xf6, 0xf6, 0xf6);
        $controller->captcha->multi_text_color = array(
            new Securimage_Color(0x33, 0x99, 0xff),
            new Securimage_Color(0x33, 0, 0xcc),
            new Securimage_Color(0x33, 0x33, 0xcc),
            new Securimage_Color(0x66, 0x66, 0xff),
            new Securimage_Color(0x99, 0xcc, 0xcc)
        );
        $controller->captcha->use_multi_text = true;
        $controller->captcha->text_angle_minimum = -5;
        $controller->captcha->text_angle_maximum = 5;
        $controller->captcha->use_transparent_text = true;
        $controller->captcha->text_transparency_percentage = 30; // 100 = completely transparent
        $controller->captcha->num_lines = 7;
        $controller->captcha->line_color = new Securimage_Color(0xea, 0xaea, 0xea);
        $controller->captcha->image_signature = 'paramadina.ac.id';
        $controller->captcha->signature_color = new Securimage_Color(rand(0, 64), rand(64, 128), rand(128, 255));
        $controller->captcha->use_wordlist = true;
        
        // path and files setting
        $controller->captcha->audio_path = $this->_audio_path;
        $controller->captcha->gd_font_file = $this->_gd_font_file;
        $controller->captcha->ttf_file = $this->_ttf_file;
        $controller->captcha->wordlist_file = $this->_wordlist_file;
        $controller->captcha->background_directory = $this->_background_directory;
        
        
        //$controller->set('captcha', $controller->captcha);
    }
}
?>