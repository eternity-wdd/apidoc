<?php
namespace benben\assets;

use benben\assets\BenbenAsset;

class JQueryUIAsset extends BenbenAsset
{
    /* (non-PHPdoc)
     * @see \yii\web\AssetBundle::init()
     */
    public function init()
    {
        $this->sourcePath .= DIRECTORY_SEPARATOR . 'jquery-ui';
    }
    
    public $js = [
        'jquery-ui.min.js',
    ];
    
    public $css = [
        'jquery-ui.min.css',
    ];
    
    public $depends = [
        'yii\web\JqueryAsset',
    ];
}