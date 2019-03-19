<?php

namespace app\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class VueAsset extends AssetBundle
{
    public $js = [
        '/js/vue.js',
        '/elementui/index.js',
    ];
    
    public $css = [
        '/elementui/index.css'    
    ];
    
    public function init()
    {
        parent::init();
    }
    
}
