<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
        'static/css/tabs.css',
        'css/common.css',
        'css/combo.select.css',

    ];
    public $js = [
        'js/xmfusion.js',
        '/static/js/jquery-migrate.js',
        '/static/js/AdminLTE.min.js',
        'js/comm.js',
        'js/jquery.combo.select.js',

    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
        'yii\web\JqueryAsset',
        'app\assets\VueAsset',
        /* 'app\assets\AdminLTEAsset', */

    ];
    
    
    public function publicImg($url)
    {
        return '/'.$url;
    }
}
