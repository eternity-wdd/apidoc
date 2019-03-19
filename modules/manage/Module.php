<?php

namespace app\modules\manage;

class Module extends \yii\base\Module
{
    public $controllerNamespace = 'app\modules\manage\controllers';

    public function init()
    {
        parent::init();
        $this->layout = '//main';
        // custom initialization code goes here
    }
}
