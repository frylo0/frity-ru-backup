<?php
require_once './state.queries.php';

$req = $_POST;
$req['pass'] = $req['pass0'];

if (insert_state('regular', $req)) {
  $id = login_state($req['login'], $req['pass']);
  update_change_time($id);
  if (insert_state('rest_list', [
    'id' => $id,
    'list' => '["Занятия,", "на которые надо", "тратить меньше времени."]',
  ]))
    echo insert_state('work_list', [
      'id' => $id,
      'list' => '["Дела, которые", "нужно делать больше,", "например, уборка или работа"]',
    ]);
}

//print_r($req);
