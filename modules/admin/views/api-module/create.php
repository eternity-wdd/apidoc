<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\ApiService */

$this->title = '新增服务模块';
$this->params['breadcrumbs'][] = ['label' => '服务管理', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="api-module-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
