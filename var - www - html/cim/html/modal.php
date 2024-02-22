<div id="modal" class="modal-hide" style="display: none">
    <div class="modal_background flex-column flex-centrify whf" style="justify-content: flex-start;">
        <div class="modal_content flex-column flex-centrify">
            <div class="modal_content_person-type-choise">
                <center><div class="modal_region"></div></center>
                <div class="modal_title">Выберите род деятельности</div>
                <div class="modal_content_person-types flex-row flex-centrify">
                    <?php
                        require_once 'mysql_info.php';
                        $mysqli_modal = new mysqli($host, $user, $pass, $db_name);
                        $mysqli_modal->set_charset('utf8');
                        
                        $types = $mysqli_modal->query('SELECT * FROM cim_type');
                        while ($type = $types->fetch_assoc()): ?>
                    <div class="person-type-choise" 
                         data-person-type-id="<?=$type['id_type']?>">
                        <img src="img/icon/<?=$type['type_image']?>" 
                             alt="<?=$type['type_name']?>" 
                             title="<?=$type['type_name']?>"
                             data-person-type-id="<?=$type['id_type']?>">
                    </div>
                    <?php endwhile; ?>
                    <!--<div class="person-type-choise persont-type-choise_poet">
                        <img src="img/book-icon.png" alt="Поэзия" data-person-type="poet">
                        <div data-person-type="poet">Поэзия</div>
                    </div>-->
                </div>
            </div>
            <div class="modal_update-content flex-column flex-centrify">

            </div>
        </div>
    </div>
</div>