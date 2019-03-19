<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Api */

$this->title = Yii::t('app', '修改接口:', [
    'modelClass' => 'Api',
]) . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Apis'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="api-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'module' =>$module,
        'params_model'=> $params_model,
        'params_type'=>$params_type,//参数所有类型
    ]) ?>

</div>
