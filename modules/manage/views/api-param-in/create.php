<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ApiParam */

$this->title = Yii::t('app', 'Create Api Param');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Api Params'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="api-param-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
