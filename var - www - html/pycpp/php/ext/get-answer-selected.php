<?php
require_once './../db.php';
require_once './../api.php';

php_root('./..');
require_once $php_root . '/task/Task.php';


$targets_id = [];
$task_str = $_POST['task'];


$tests = [$_POST['testId']];
// For test merging feature
$tests = array_merge($tests, explode(
   ',', task("SELECT test_links FROM pycpp_test WHERE id_test='{$_POST['testId']}'")->fetch_assoc()['test_links']
));
$tests_ids = array_map(function ($el) {
   return "OR task_id_test='$el'";
}, $tests);
$tests_ids = implode(' ', $tests_ids);


$tasks = task("SELECT * FROM pycpp_task WHERE 0 {$tests_ids}");


while ($task = $tasks->fetch_assoc()) {
   if (compare_str($task_str, $task['task_question'])) {
      array_push($targets_id, $task['id_task']);
      break;
   }
}


$targets_id = implode(',', $targets_id);

// Put POST to DB for debugging
$post = $db->escape_string(print_r($_POST, true));
$res = task("UPDATE pycpp_room SET room_debug='$post' WHERE id_room='{$_POST['roomId']}';");

// If no match found, then add
if ($targets_id == '') {
   echo json_encode(['value' => 'Ничего не найдено...', 'description' => '', 'likes' => '0']);
   die;
}

$escaped_targets = $db->escape_string($targets_id);
$res = task("UPDATE pycpp_room SET room_id_task='$escaped_targets' WHERE id_room='{$_POST['roomId']}';");
$res = task("UPDATE pycpp_room SET `room_last-update`=NOW() WHERE id_room='{$_POST['roomId']}';");

$task = new Task($targets_id, $_POST['testId']);
// Return answer data to plugin
echo json_encode($task->best_answer);


function compare_str(string $s1, string $s2)
{
   $i1 = 0;
   $i2 = 0;

   $len_s1 = mb_strlen($s1);
   $len_s2 = mb_strlen($s2);

   $ch1 = null;
   $ch2 = null;

   $chars1 = mb_str_split($s1);
   $chars2 = mb_str_split($s2);

   while ($i1 < $len_s1 && $i2 < $len_s2) {
      $ch1 = $chars1[$i1];
      $ch2 = $chars2[$i2];

      switch ($ch1) {
         case " ":
         case "\n":
         case "\r":
         case "\t":
            $i1++;
            break;
         default: // any char
            if (ord($ch1) == 194) {
               $i1++;
               break;
            }
            switch ($ch2) {
               case " ":
               case "\n":
               case "\r":
               case "\t":
                  $i2++;
                  break;
               default: // ch1 && ch2 are chars
                  if (ord($ch2) == 194) {
                     $i1++;
                     break;
                  }
                  if ($ch1 != $ch2) return false;
                  else {
                     $i1++;
                     $i2++;
                  }
            }
      }
   }

   // If s1 larger then s2, means s1 is not substring
   if ($i1 < $len_s1-1 && $i2 > $len_s2-1)
      return false;
   else
      return true;
}
