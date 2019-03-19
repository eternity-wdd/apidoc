<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\MemberSearch */
/* @var $form yii\widgets\ActiveForm */
?>
<style>
.form-group{
	display:inline-block;
	width:400px;
}
.form-group .control-label{
	float:left;
	margin-right:10px;
	margin-top:5px;
}


</style>
<div class="member-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'email')->input('text',['style'=>'width:300px;']) ?>


    <?php // echo $form->field($model, 'nickname') ?>

    <?php // echo $form->field($model, 'last_logintime') ?>

    <div class="form-group">
        <?= Html::submitButton('搜索', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('重置', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
