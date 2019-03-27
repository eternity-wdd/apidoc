<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * @author Ldj <coder_lizheng@163.com>
 * @since 2.0
 */
class FrontendAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
//         'css/site.css',
        'css/common.css',
    	'css/combo.select.css',
        'css/frontapidetails.css',
    ];
    public $js = [
        'js/comm.js',
    	'js/jquery.combo.select.js'
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
    
    public function publicImg($url)
    {
        return '/'.$url;
    }
}
