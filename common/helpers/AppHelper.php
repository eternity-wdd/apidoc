<?php
namespace common\helpers;

use common\models\Settings;
class AppHelper
{
    public static function imgRealUrl($url)
    {
        return Settings::get('img_server').$url;
    }
    
    public static function issueModuleSearchForm()
    {
        $modules = \Yii::$app->params['issueModules'];
        
        if($modules)
        {
            foreach ($modules as $module)
            {
                
            }
        }
    }
}