<?php
/**
 * @link http://www.2ddbb.com/
 * @copyright Copyright (c) 2016 ddbb Software LLC
 * @license http://www.2ddbb.com/license/
 */

namespace benben\assets;

use yii\web\AssetBundle;

/**
 * Asset bundle for the Masonry js file.
 *
 * @author Ldj <ldjbenben@sina.com>
 */
class MasonryAsset extends AssetBundle
{
    public $sourcePath = '@benben/assets/dist';
    public $js = [
        'masonry.pkgd.min.js',
    ];
    public $depends = [
        'yii\web\JqueryAsset',
    ];
}
