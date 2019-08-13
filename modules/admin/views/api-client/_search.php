<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\ApiClientSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="api-client-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'client_id') ?>

    <?= $form->field($model, 'secret') ?>

    <?= $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'system_id') ?>

    <?php // echo $form->field($model, 'env') ?>

    <?php // echo $form->field($model, 'from') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
