<?php $SRC_PATH = './__main-page__'; ?>
<?php $VER = '2.1.0'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>frity</title>
  <link rel="stylesheet" href="<?= $SRC_PATH ?>/css/index.css?ver=<?= $VER ?>">
  
  <meta name="yandex-verification" content="f91eaee938f631cb" />
  
  <style>body { color: white; }</style>
</head>

<body>

  <header>
    <h1>
      frity<small>corp</small>
    </h1>
    <div class="search">
      <input type="text" id="search-input" placeholder="Какой проект искать?..">
    </div>
    <div class="whoami">
        <span class="whoami__repo">
            github: <a href="https://github.com/fritylo/">https://github.com/fritylo/</a>
        </span>
        <span class="whoami__copyright">
            frity &copy; 2016-<?= date('Y') ?>
        </span>
    </div>
  </header>

  <main>
    <?php
    $dir = scandir('.');
    ?>

    <?php
    function get_style_str($style_part, $dirname) {
        $str = '';
        foreach ($style_part as $prop => $val) {
            $str .= "$prop: $val;";
        }
        $str = str_replace('$path', "$dirname/__info__", $str);
        return $str;
    }
    ?>

    <?php
    $manifest_list = [];
    foreach ($dir as $dirname) {
        if (!is_dir($dirname)) continue;
        if (!file_exists("$dirname/__info__/manifest.json")) continue;
        if ($dirname == 'tpl-__info__') continue;

        $manifest = json_decode(file_get_contents("$dirname/__info__/manifest.json"));
        $manifest->dirname = $dirname;

        if ($manifest->is_hidden) continue;

        array_push($manifest_list, $manifest);
    }

    // sort by priority
    usort($manifest_list, function ($a, $b) { return -1 * ($a->priority <=> $b->priority); });
    ?>

    <?php foreach ($manifest_list as $manifest) : ?>
        <?php
        $dirname = $manifest->dirname;

        $style_preview = get_style_str($manifest->style->preview, $dirname);
        $content = get_style_str($manifest->style->content, $dirname);
        $title = get_style_str($manifest->style->title, $dirname);
        
        $meta_style = property_exists($manifest->style, 'meta') ? $manifest->style->meta : 'light';
        ?>

        <div class="card-wrapper">
            <a href="<?= $dirname ?>" class="card" data-priority="<?= $manifest->priority ?>">
                <div class="card__header meta_<?= $meta_style ?>">
                    <div class="card__creation-date" data-tippy-content="Дата создания: <?= $manifest->creation_date ?>"><?= $manifest->creation_date ?></div>
                </div>
                <div class="card__image" style="<?= $style_preview ?>">
                </div>
                <div class="card__content" style="<?= $content ?>">
                    <div class="card__title" style="<?= $title ?>"><?= $manifest->title ?></div>
                </div>
                <div class="card__footer meta_<?= $meta_style ?>">
                    <div class="card__project-management">
                        <?php if ($manifest->is_supported) : ?>
                        <div class="card__has-maintain"></div>
                        <?php endif; ?>
                    </div>
                    <div class="card__adaptivity">
                        <?php if (in_array('mobile', $manifest->adaptive)) : ?>
                        <div class="card__is-mobile"></div>
                        <?php endif; ?>
                        <?php if (in_array('pc', $manifest->adaptive)) : ?>
                        <div class="card__is-pc"></div>
                        <?php endif; ?>
                    </div>
                </div>
            </a>
        </div>

    <?php endforeach; ?>
  </main>

  <!-- jquery -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

  <!-- tippy -->
  <script src="https://unpkg.com/@popperjs/core@2"></script>
  <script src="https://unpkg.com/tippy.js@6"></script>

  <script type="module" src="<?= $SRC_PATH ?>/js/index.js?ver=<?= $VER ?>"></script>
</body>

</html>
