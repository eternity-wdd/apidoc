<?php
//phpinfo();exit;
error_reporting(E_ALL ^ E_NOTICE);
// comment out the following two lines when deployed to production
defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'dev');

require(__DIR__ . '/../vendor/autoload.php');
require(__DIR__ . '/../vendor/yiisoft/yii2/Yii.php');
require(__DIR__ . '/../config/bootstrap.php');

$config = yii\helpers\ArrayHelper::merge(
    //     require(__DIR__ . '/../../common/config/main-local.php'),
    require(__DIR__ . '/../config/common.php'),
    require(__DIR__ . '/../config/web.php')
    //     require(__DIR__ . '/../config/main-local.php')
);

(new yii\web\Application($config))->run();
