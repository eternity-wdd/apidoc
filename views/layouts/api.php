<?php

/* @var $this \yii\web\View */
/* @var $content string */
$this->registerCssFile('/css/product.css');
$this->registerCssFile('/css/api.css');
?>
<!-- 先引用main.php布局文件， -->
<?php $this->beginContent('@app/views/layouts/frontend.php');?>

<div class="content"><?= $content; ?></div>
<?php $this->endContent();?>