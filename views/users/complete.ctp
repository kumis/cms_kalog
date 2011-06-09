<h1>Terima Kasih telah mendaftar di Universitas Paramadina</h1>
<p id="welcome">
Berikut adalah informasi kode pendaftaran dan password yang dapat Anda gunakan untuk login:
<div class="flash_box success regCompleteBox">
    <ul>
        <li>
            <span class="trans-label label-required">Kode pendaftaran</span>
            <span class="trans-val regComplete" style="min-width: 300px"><?php echo $student[0]['Student']['registration_no'];?></span>
        </li>
        <li>
            <span class="trans-label label-required">Password</span>
            <span class="trans-val regComplete" style="min-width: 300px"><?php echo $student[0]['Student']['password_real'];?></span>
        </li>
        <li>
            <span class="trans-label label-required">Email yang digunakan</span>
            <span class="trans-val regComplete" style="min-width: 300px"><?php echo $student[0]['Student']['email'];?></span>
        </li>
    </ul>
</div>
</p>
