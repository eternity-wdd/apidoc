<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\ApiDomain */

$this->title = Yii::t('app', $model->id.'-'.$model->system_id.' - '.$model->env.': ', [
    'modelClass' => 'Api Domain',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Api Domains'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id.'-'.$model->system_id.' - '.$model->env, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="api-domain-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
