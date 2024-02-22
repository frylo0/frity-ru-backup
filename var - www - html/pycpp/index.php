<!-- INCLUDES -->
<?php
require_once './php/db.php';
require_once './php/api.php';

$page_title = 'PYCPP';

php_root('./php');
require_once $php_root . '/head.php';
?>

<header>
  <h1>
    Бомбим программирование, PYCPP <br>
    <small><em><a href="/"><span style="color: blue;">frity corp.</span></a></em></small>
  </h1>
</header>

<a href="./php/room/">В комнату</a> <a href="./chrome-fti-progsolve.zip">Плагин</a> <a href="./chrome-fti-progsolve-selection.zip">Плагин Ctrl+C</a> <a href="https://youtu.be/dSAHrLUPE80">Как че установить блин</a>

<main>
  <?php query('SELECT * FROM pycpp_test ORDER BY test_priority DESC;', function ($row) {
    echo <<<HTML
      <div class="test mt1">
        <a href="./php/test?id={$row['id_test']}">
          {$row['test_name']}
        </a>
        <br>
        <small style="font-weight: normal">
          Дата создания: <time>{$row['test_creation_date']}</time>
        </small>
      </div>
HTML;
  }); ?>
  <button class="new-test-button mt1">Добавить тест</button>
</main>

<?php require_once './php/foot.php'; ?>
