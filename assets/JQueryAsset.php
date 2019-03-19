<?php

namespace backend\assets;

use yii\web\AssetBundle;
use common\models\Settings;

/**
 * Main backend application asset bundle.
 */
class JqueryAsset extends AssetBundle
{
    public $js = [
        '/jquery/jquery.3.lastest.js',
    ];
    
    public function init()
    {
        $this->baseUrl = Settings::get('staticlib_server');
        parent::init();
    }
    
}
