<?php $javascript->link('jquery.validate', false);?>
<?php echo $javascript->codeBlock($ajaxURL);?>
<?php $javascript->link('register', false);?>
<h1>Informasi</h1>
<div class="dashBoardInfo">
    <ul>
        <li>
            <span class="trans-label">Tanggal Mendaftar</span>
            <span class="trans-val"><?php echo $this->data['Student']['created'];?></span>
        </li>
        <?php if ($this->data['Student']['created'] != $this->data['Student']['modified']):?>
        <li>
            <span class="trans-label">Terakhir diupdate</span>
            <span class="trans-val"><?php echo $this->data['Student']['modified'];?></span>
        </li>
        <?php endif;?>
        <li>
            <span class="trans-label">Status Pembayaran</span>
            <span class="trans-val">Belum membayar</span>
        </li>
        <li>
            <span class="trans-label">Jadwal interview</span>
            <span class="trans-val">Belum ada</span>
        </li>
    </ul>
</div>

<h1>Profil</h1>
<?php echo $form->create('Student',array('action'=>'dashboard'));?>
<div class="registration-page" id="section-student">
    <div id="message-summary">
    <?php
        if ($session->check('Message.flash')):
            $session->flash();
            echo $javascript->codeBlock('$(function(){$.scrollTo( "#message-summary", 1000);});');
        endif;
    ?>
    </div>
    <h1>Student Candidate Data <span class="go-arrow"><a href="#section-education" class="go-down" title="Go down">Go down</a><a href="#formSubmit" class="go-bottom" title="Go to bottom">Go to bottom</a></span></h1>
    <ul>
        <li>
            <span class="trans-label label-required">Name</span>
            <span class="trans-val">
                <?php
                    echo $form->input('name', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Gender</span>
            <span class="trans-val">
                <?php
                    $option_gender = array(
                        "" => "- Select one -",
                        "P" => "Perempuan", 
                        "L" => "Laki - laki"
                    );
                    echo $form->select("sex", $option_gender, null, array("class" => "inputText"), false);
                    echo ($form->isFieldError('sex')) ? $form->error('sex') : '';
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Place Of Birth</span>
            <span class="trans-val">
                <?php
                    echo $form->input('pob', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Date Of Birth</span>
            <span class="trans-val">
                <?php
                    echo $form->input('dob', array(
                        'div'=>false, 'label'=>false, 'class'=>'inputText',
                        'minYear' => '1960', 'maxYear' => date('Y')-10
                        )
                    );
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Home Address</span>
            <span class="trans-val">
                <?php
                    echo $form->input('address1', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label"></span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('address2', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label"></span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('address3', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));		
                ?>
            </span>
            </form>
        </li>
        <li>
            <span class="trans-label label-required">Zip Postal Code</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('zipcode', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'10'));
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Province</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_provinces[''] = '- Select One -';
                foreach($provinces as $province){
                    $option_provinces[$province['Province']['id']] = $province['Province']['name'];
                }

                echo $form->select('setup_province_id', $option_provinces, null, array(
                    'class' => 'inputText ajax_select', 
                    'rel' => '#StudentSetupCityId', 'ref' => 'setup_province_id'
                ), false);
                echo ($form->isFieldError('setup_province_id')) ? $form->error('setup_province_id') : '';
            ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">City</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_city = array();
                foreach($cities as $city){
                    $option_city[$city['City']['id']] = $city['City']['name'];
                }
                
                echo $form->select('setup_city_id', $option_city, $this->data['Student']['setup_city_id'], array(
                    'class' => 'inputText',
                    'model' => 'City', 'field' => 'name'
                ), false);
                echo ($form->isFieldError('setup_city_id')) ? $form->error('setup_city_id') : '';
            ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Handphone</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('handphone', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Homephone</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('homephone', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Email</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('email', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
            </span>
        </li>        
        <li>
            <span class="trans-label label-required">Citizenship</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    $option_citizenship = array(
                        '' => "- Select One -", "WNI" => "Warga Negara Indonesia", 
                        "WNIK" => "Warga Negara Indonesia Keturunan", "WNA"=>"Warga Negara Asing"
                    );
                    echo $form->select("citizenship", $option_citizenship, null, array('class'=>'inputText'), false);
                    echo ($form->isFieldError('citizenship')) ? $form->error('citizenship') : '';
                ?>
            </span>
            </form>
        </li>
        <li>
            <span class="trans-label label-required">Religion</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    $option_religions = array(
                        "" => "- Select One -", "ISLAM" => "ISLAM",
                        "KATOLIK" => "KRISTEN KATOLIK", "PROTESTAN"=>"KRISTEN PROTESTAN",
                        "HINDU"=>"HINDU", "BUDDHA"=>"BUDDHA", "KONGHUCU"=>"KONGHUCU"
                    );
                    echo $form->select("religion", $option_religions, null, array('class'=>'inputText'), false);
                    echo ($form->isFieldError('religion')) ? $form->error('religion') : '';
                ?>
            </span>
        </li>        
        <li>
            <span class="trans-label label-required">Marital Status</span>
            <span class="trans-val">
                <?php
                    $option_marital = array(
                        "" => "- Select One -", 
                        "Y" => "Married", 
                        "N" => "Not Married"
                    );
                    echo $form->select("marital_status", $option_marital, null, array('class'=>'inputText'), false);
                    echo ($form->isFieldError('marital_status')) ? $form->error('marital_status') : '';
                ?>
            </span>
        </li>        
    </ul>
</div>

<div class="registration-page" id="section-education">
    <h1>Student Candidate Education <span class="go-arrow"><a href="#section-student" class="go-top" title="Go to top">Go Top</a><a href="#section-student" class="go-up" title="Go up">Go up</a><a href="#section-work" class="go-down" title="Go down">Go down</a><a href="#formSubmit" class="go-bottom" title="Go to bottom">Go to bottom</a></span></h1>
    <div id="message-summary"></div>
    <ul>
        <li>
            <span class="trans-label label-required">High School Name</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('shs_name', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));								
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">High School Province</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_shsprovinces[''] = '- Select One -';
                foreach($shsprovinces as $shsprovince){
                    $option_shsprovinces[$shsprovince['Province']['id']] = $shsprovince['Province']['name'];
                }

                echo $form->select('setup_shs_province_id', $option_shsprovinces, null, array(
                    'class' => 'inputText ajax_select',
                    'rel' => '#StudentSetupShsCityId', 'ref' => 'setup_province_id'
                ), false);
                echo ($form->isFieldError('setup_shs_province_id')) ? $form->error('setup_shs_province_id') : '';
            ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">High School City</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_shscity = array();
                foreach($shs_cities as $shs_city){
                    $option_shscity[$shs_city['CityShs']['id']] = $shs_city['CityShs']['name'];
                }
                echo $form->select('setup_shs_city_id', $option_shscity, $this->data['Student']['setup_shs_city_id'], array(
                    'class' => 'inputText ajax_select', 
                    'model' => 'City', 'field' => 'name'
                ), false);
                echo ($form->isFieldError('setup_shs_city_id')) ? $form->error('setup_shs_city_id') : '';
            ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Zip Postal Code</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('shs_zipcode', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'10'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">High School Course</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_shscourses[''] = '- Select One -';
                foreach($shscourses as $shscourse){
                    $option_shscourses[$shscourse['ShsCourse']['id']] = $shscourse['ShsCourse']['name'].' ('.$shscourse['ShsCourse']['desc'].')';
                }

                echo $form->select('setup_shs_course_id', $option_shscourses, null, array("class"=>"inputText"), false);
                echo ($form->isFieldError('setup_shs_course_id')) ? $form->error('setup_shs_course_id') : '';
            ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">STTB No</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('sttb_no', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">STTB Date</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('sttb_date', array(
                        'div' => false, 'label' => false,
                        'minYear' => '1960', 'maxYear' => date('Y')
                    ));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">STTB Value</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('sttb_value', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'5'));		
                ?>
            </span>
        </li>
    </ul>
</div>

<div class="registration-page" id="section-work">
    <h1>Student Candidate Work <span class="go-arrow"><a href="#section-student" class="go-top" title="Go to top">Go Top</a><a href="#section-education" class="go-up" title="Go up">Go up</a><a href="#section-parent" class="go-down" title="Go down">Go down</a><a href="#formSubmit" class="go-bottom" title="Go to bottom">Go to bottom</a></span></h1>
    <ul>
        <li>
            <span class="trans-label">Work Status</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->select("work_status", array("" => "- Select One -", "N" => "No", "Y" => "Yes"), '', array('class'=>'inputText'), false);
                    echo ($form->isFieldError('work_status')) ? $form->error('work_status') : '';
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label">Profession</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_professions[''] = '- Select One -';
                foreach($professions as $profession) {
                    $option_professions[$profession['Profession']['id']] = $profession['Profession']['name'];
                }
                echo $form->select('setup_profession_id', $option_professions, null, array("class"=>"inputText"), false);
                echo ($form->isFieldError('setup_profession_id')) ? $form->error('setup_profession_id') : '';
            ?>
            </span>
        </li>          
        <li>
            <span class="trans-label">Company Name</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('work_company_name', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label">Position</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('work_position', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label">Address</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->textarea('work_position', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'cols'=>'46'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label">Work Province</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_workprovinces[''] = '- Select One -';
                foreach($workprovinces as $workprovince){
                    $option_workprovinces[$workprovince['Province']['id']] = $workprovince['Province']['name'];
                }

                echo $form->select('setup_work_province_id', $option_workprovinces, null, array(
                    'class' => 'inputText ajax_select',
                    'rel' => '#StudentSetupWorkCityId', 'ref' => 'setup_province_id'
                ), false);
            ?>
            </span>
        </li>
        <li>
            <span class="trans-label">Work City</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_workcity = array();
                 foreach($work_cities as $work_city){
                    $option_workcity[$work_city['CityWork']['id']] = $work_city['CityWork']['name'];
                }
                echo $form->select('setup_work_city_id', $option_workcity, $this->data['Student']['setup_work_city_id'], array(
                    'class' => 'inputText ajax_select',
                    'model' => 'City', 'field' => 'name'
                ), false);
            ?>
            </span>
        </li>
        <li>
            <span class="trans-label">Work Phone</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('work_phone', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
            </span>
        </li>
    </ul>
</div>
<div class="registration-page" id="section-parent">
    <h1>Student Candidate Parent <span class="go-arrow"><a href="#section-student" class="go-top" title="Go to top">Go Top</a><a href="#section-work" class="go-up" title="Go up">Go up</a><a href="#section-info" class="go-down" title="Go down">Go down</a><a href="#formSubmit" class="go-bottom" title="Go to bottom">Go to bottom</a></span></h1>
    <ul>
        <li>
            <span class="trans-label label-required">Name</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('parent_name', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));								
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Address</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->textarea('parent_address', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'cols'=>'46'));
                    echo ($form->isFieldError('parent_address')) ? $form->error('parent_address') : '';
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Province</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_workprovinces[''] = '- Select One -';
                foreach($workprovinces as $workprovince){
                    $option_workprovinces[$workprovince['Province']['id']] = $workprovince['Province']['name'];
                }

                echo $form->select('setup_parent_province_id', $option_workprovinces, null, array(
                    'class' => 'inputText ajax_select',
                    'rel' => '#StudentSetupParentCityId', 'ref' => 'setup_province_id'
                ), false);
                echo ($form->isFieldError('setup_parent_province_id')) ? $form->error('setup_parent_province_id') : '';
            ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">City</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_workcity[''] = 'Select Province first';
                echo $form->select('setup_parent_city_id', $option_workcity, null, array(
                    'class' => 'inputText ajax_select',
                    'model' => 'City', 'field' => 'name'
                ), false);
                echo ($form->isFieldError('setup_parent_city_id')) ? $form->error('setup_parent_city_id') : '';
            ?>
            </span>
        </li>
        
        <li>
            <span class="trans-label label-required">Zip Code</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('parent_zipcode', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'10'));								
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label label-required">Phone</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('parent_phone', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label">Work Phone</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('parent_work_phone', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
            </span>
        </li>
        <li>
            <span class="trans-label">Profession</span>
            <span class="trans-val" style="min-width: 300px">
            <?php
                $option_professions[''] = '- Select One -';
                foreach($professions as $profession){
                    $option_professions[$profession['Profession']['id']] = $profession['Profession']['name'];
                }
                echo $form->select('setup_parent_profession_id', $option_professions, null, array("class"=>"inputText"), false);
            ?>
            </span>
        </li>          
        <li>
            <span class="trans-label">Company Name</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('parent_company_name', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'40'));		
                ?>
            </span>
        </li>        
        <li>
            <span class="trans-label">Position</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->input('parent_position', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'size'=>'20'));		
                ?>
            </span>
        </li>
    </ul>
</div>
<div class="registration-page" id="section-info">
    <h1>Infornation <span class="go-arrow"><a href="#section-student" class="go-top" title="Go Top">Go Top</a><a href="#section-parent" class="go-up" title="Go up">Go up</a></span></h1>
    <ul>
        <li>
            <span class="trans-label">Information</span>
            <span class="trans-val" style="min-width: 300px">
                <?php
                    echo $form->textarea('information', array('div'=>false, 'label'=>false, 'class'=>'inputText', 'cols'=>'46'));								
                ?>
            </span>
        </li>
    </ul>
    <p id="formSubmit">
        <input type="submit" class="inputButton" value="Update" />
    </p>
</div>
</form>
