<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\ApiGroup */

$this->title = '新增分组';
$this->params['breadcrumbs'][] = ['label' => '分组管理', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="api-group-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
