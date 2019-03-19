<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AdminLTEAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        '/static/plugins/daterangepicker/daterangepicker-bs3.css',
        '/static/plugins/font-awesome/css/font-awesome.min.css?v=2',
        '/static/css/AdminLTE.css?v=1',
        '/static/plugins/iCheck/flat/_all.css',
        '/static/css/app.css?v=2',
        '/static/css/dropdown.css?1',
        '/static/css/messageCenter.css?1',
    ];
    public $js = [
        '/js/comm.js',
        '/js/jquery.combo.select.js',
        '/static/js/const.js',
        '/static/jquery-ui/jquery-ui.js',
        '/static/js/AdminLTE.min.js',
        ["https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js", 'condition'=>'lt IE 9'],
        ["https://oss.maxcdn.com/respond/1.4.2/respond.min.js", 'condition'=>'lt IE 9']
    ];
    public $depends = [
        'yii\web\JqueryAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
