<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\ApiModule;

/* @var $this yii\web\View */
/* @var $model app\models\ApiGroup */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="api-group-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
    
    <?= $form->field($model, 'module_id')->radioList(ApiModule::loadOptions())?>

    <?= $form->field($model, 'desc')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'priority')->Input('number') ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '新增' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
