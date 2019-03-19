<?php 
define('ROOT', __DIR__ . '/../');
Yii::setAlias('@web', dirname(__DIR__).'/web');
Yii::setAlias('@root', ROOT);
Yii::setAlias('@agent', dirname(__DIR__).'/projects/agent');
Yii::setAlias('@platform', dirname(__DIR__).'/projects/platform');
Yii::setAlias('@platformWeb', 'http://wbb.platform.xunmall.com');