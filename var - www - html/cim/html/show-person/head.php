<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?=$title?></title>
    <style>
        * {
            box-sizing: border-box;
        }
    
        body {
            padding: 0 1em;
            line-height: 150%;
        }
        body * {
            line-height: 150%;
            text-align: justify;
        }
        center {
            text-align: center;
        }
        center * {
            text-align: center;
        }
        nav a {
            display: block;
            padding: 0.5em;
            margin-bottom: 0.25em;
            text-align: center;
        }
        
        .gallery {
  			margin: auto;
  			display: flex;
  			justify-content: center;
  			align-items: flex-start;
  			flex-wrap: wrap;
  			width: fit-content;
  			width: -moz-fit-content;
  			max-width: 100%;
  			text-align: center;
  			overflow: hidden;
  			padding: 10px;
		}

		.gallery > div {
  			margin-right: 1em;
  			margin-bottom: 1em;
  			min-width: 200px;
  			max-width: 500px;
		}
		
		.gallery > div img {
		    width: 100%;
		    box-shadow: 1px 2px 5px #00000035;
		}

		p {
  			text-align: justify;
		}
    </style>
</head>

<body>
    <nav>
        <a href="./">Назад</a>
    </nav>
    <center><h3><?=$region_name?> / <?=$type_name?></h3></center>
    <center><h1><?=$title?></h1></center>