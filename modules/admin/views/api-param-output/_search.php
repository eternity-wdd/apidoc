<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\ApiParamSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="api-param-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

   

    <?= $form->field($model, 'api_id')->input('text',['style'=>'width:250px']) ?>

    <?= $form->field($model, 'name')->input('text',['style'=>'width:250px']) ?>

    <?= $form->field($model, 'pt_id')->input('text',['style'=>'width:250px']) ?>

    <?= $form->field($model, 'request')->radioList(['1'=>'是','0'=>'否']) ?>

    <?= $form->field($model, 'out')->radioList(['1'=>'输出','0'=>'输入']) ?>

    <?php // echo $form->field($model, 'desc') ?>

    <?php // echo $form->field($model, 'success') ?>

    <?php // echo $form->field($model, 'priority') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', '搜索'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', '重置'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
