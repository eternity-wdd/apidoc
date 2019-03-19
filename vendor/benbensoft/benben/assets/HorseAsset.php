<?php
/**
 * @link http://www.2ddbb.com/
 * @copyright Copyright (c) 2016 ddbb Software LLC
 * @license http://www.2ddbb.com/license/
 */

namespace benben\assets;

use yii\web\AssetBundle;

/**
 * Asset bundle for the Horse js files.
 *
 * @author Shu Lin <ldjbenben@sina.com>
 */
class HorseAsset extends AssetBundle
{
    public $sourcePath = '@benben/assets/dist/horse';
    public $js = [
        'horse.js',
        'horse.slider.card.js',
    ];
    public $depends = [
        'yii\web\JqueryAsset',
    ];
}
