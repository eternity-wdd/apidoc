<?php 
define('ROOT', __DIR__ . '/../');
Yii::setAlias('@web', dirname(__DIR__).'/web');
Yii::setAlias('@root', ROOT);
Yii::setAlias('@manage', dirname(__DIR__).'/modules/manage');
Yii::setAlias('@common', dirname(__DIR__).'/common');
Yii::setAlias('@platform', dirname(__DIR__).'/projects/platform');
Yii::setAlias('@platformWeb', 'http://wbb.platform.xunmall.com');