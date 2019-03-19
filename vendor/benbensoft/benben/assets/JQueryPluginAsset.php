<?php
/**
 * @link http://www.2ddbb.com/
 * @copyright Copyright (c) 2016 ddbb Software LLC
 * @license http://www.2ddbb.com/license/
 */

namespace benben\assets;

use yii\web\AssetBundle;

/**
 * Asset bundle for the JQuery Form plugin js file.
 *
 * @author Qiang Xue <ldjbenben@sina.com>
 */
class JQueryPluginAsset extends AssetBundle
{
    public $sourcePath = '@vendor/benbensoft/benben/assets/dist/jquery-plugins';
    public $js = [
        'jquery.form.js',
    ];
    public $depends = [
        'yii\web\JqueryAsset',
    ];
}