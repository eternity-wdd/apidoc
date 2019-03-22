<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\web\View;
use benben\widgets\JsonView;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $model app\models\ApiSearch */
/* @var $form yii\widgets\ActiveForm */
?>
<style>
.form-group{
    float:left;
}
.control-label{
	float:left;
	height:34px;
	line-height:34px;
	padding:0 5px;
}
.form-control{
	float:left;
}
.combo-select {
	float:left;
}
.combo-input{
	padding:8px;
}
#apisearch-module_id{
	width:200px;
}
#api-selector{
	width:150px;
	height:35px;
}

</style>

<div class="api-search">

    <?php $form = ActiveForm::begin([
//         'action' => ['list','module_id'=>$module],
        'method' => 'get',
    ]); ?>

    <?php //echo $form->field($model, 'id') ?>
    <?= $form->field($model, 'name')->input('text',['style'=>'width:200px;']) ?>

    <?= $form->field($model, 'label')->input('text',['style'=>'width:200px']) ?>
	<?= $form->field($model, 'module_id')->dropDownList(ArrayHelper::map($module,'name', 'label'),['prompt'=>'请选择']) ?>
	
	<div class="form-group">
        <label class="control-label">接口分类</label>
        <select id="api-selector" name="ApiSearch[group_id]" class="form-control">
			<option value="">请选择</option> 
        </select>
    </div>




    <!-- <?php echo  $form->field($model, 'module_id')->input('text',['style'=>'width:250px']) ?> -->

    <?php // echo $form->field($model, 'priority') ?>

    <?php // echo $form->field($model, 'description') ?>

    <div class="form-group" style="margin-left:50px;float:left;width:200px;">
        <?= Html::submitButton(Yii::t('app', '搜索'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', '重置'), ['class' => 'btn btn-default']) ?>
         <?php echo Html::a('返回列表',  ['api/list'], array( 'class' => 'btn btn-warning'))?>
    </div>

    <?php ActiveForm::end(); ?>

</div>


