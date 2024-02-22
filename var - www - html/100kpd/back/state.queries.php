<?php
require_once './mysql.connect.php';

$queries = [
  'get' => [
    'regular' => function (int $id) {
      return "SELECT user_state FROM 100kpd_user WHERE id_user='$id';";
    },
    'rest_list' => function (int $id) {
      return "SELECT rli_list FROM 100kpd_rest_list WHERE rli_id_user='$id'";
    },
    'work_list' => function (int $id) {
      return "SELECT wli_list FROM 100kpd_work_list WHERE wli_id_user='$id'";
    },
  ],
  'update' => [
    'regular' => function (int $id, string $data) {
      return "UPDATE 100kpd_user SET user_state='$data' WHERE id_user='$id';";
    },
    'rest_list' => function (int $id, string $data) {
      return "UPDATE 100kpd_rest_list SET rli_list='$data' WHERE rli_id_user='$id';";
    },
    'work_list' => function (int $id, string $data) {
      return "UPDATE 100kpd_work_list SET wli_list='$data' WHERE wli_id_user='$id';";
    },
  ],
  'login' => function ($login, $pass) {
    return "SELECT id_user FROM 100kpd_user WHERE user_login='$login' AND user_pass=MD5('$pass');";
  },
  'insert' => [
    'regular' => function ($data) {
      return "INSERT INTO 100kpd_user (
        id_user, 
        user_login, 
        user_pass,
        user_state) 
      VALUES (
        NULL, 
        '" . $data['login'] . "',
        MD5('" . $data['pass'] . "'),
        '{" .
        '"mode": "work",' .
        '"rest": {' .
        '  "max": ' . $data['rest-time'] . ',' .
        '  "value": 0,' .
        '  "valueBeforeChange": 0' .
        '},' .
        '"work": {' .
        '  "max": ' . $data['work-time'] . ',' .
        '  "value": 0,' .
        '  "valueBeforeChange": 0' .
        '},' .
        '"sleep": {' .
        '  "time": 0,' .
        '  "begin": 0,' .
        '  "restStep": 0,' .
        '  "prevRestOk": true' .
        '},' .
        '"interval": 17,' .
        '"lastChange": 0 }' . "'
      );";
    },
    'rest_list' => function (array $data) {
      return "INSERT INTO `100kpd_rest_list` (
        `id_rli`, 
        `rli_id_user`, 
        `rli_list`) 
      VALUES (
        NULL, 
        '" . $data['id'] . "',
        '" . $data['list'] . "'
      );";
    },
    'work_list' => function (array $data) {
      return "INSERT INTO `100kpd_work_list` (
        `id_wli`, 
        `wli_id_user`, 
        `wli_list`) 
      VALUES (
        NULL, 
        '" . $data['id'] . "', 
        '" . $data['list'] . "'
      );";
    },
  ],
];

function use_state(string $query, callable $map_res_callback)
{
  global $db;
  $db->open();
  $res = $db->query($query);
  $res = $map_res_callback($res);
  $db->close();
  return $res;
}

function date_now()
{
  return round(microtime(true) * 1000);
}

function update_change_time($id)
{
  $state = json_decode(get_state('regular', $id), true);
  $state['lastChange'] = date_now();
  update_state('regular', $id, json_encode($state));
}

function get_state(string $queryType, int $userId)
{
  global $queries;

  return use_state(
    $queries['get'][$queryType]($userId),
    function ($res) {
      return $res->fetch_row()[0];
    }
  );
}

function update_state(string $queryType, int $userId, string $data)
{
  global $queries;
  return use_state(
    $queries['update'][$queryType]($userId, $data),
    function ($res) {
      return $res;
    }
  );
}

function login_state($login, $pass)
{
  global $queries;
  return use_state(
    $queries['login']($login, $pass),
    function ($res) {
      return $res->fetch_row()[0];
    }
  );
}

function insert_state(string $queryType, $data)
{
  global $queries;
  if (isset($data['id']))
    update_change_time($data['id']);
  return use_state(
    $queries['insert'][$queryType]($data),
    function ($res) {
      return $res;
    }
  );
}
