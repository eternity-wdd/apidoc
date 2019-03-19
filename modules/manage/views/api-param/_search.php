<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ApiParamSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="api-param-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'api_id') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'pt_id') ?>

    <?= $form->field($model, 'request') ?>

    <?php // echo $form->field($model, 'out') ?>

    <?php // echo $form->field($model, 'desc') ?>

    <?php // echo $form->field($model, 'success') ?>

    <?php // echo $form->field($model, 'priority') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
