<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\modules\admin\models\ApiParamType;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\ApiParam */
/* @var $form yii\widgets\ActiveForm */

?>

<div class="api-param-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= Html::activeHiddenInput($model, 'api_id') ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pt_id')->dropDownList(ApiParamType::loadOptions()) ?>

    <?= $form->field($model, 'request')->checkbox()?>
    
     <?= $form->field($model, 'out')->radioList(['1'=>'输出','0'=>'输入']) ?>

    <?= $form->field($model, 'label')->textArea(['rows'=>5]) ?>

    <?= $form->field($model, 'desc')->textArea(['rows'=>5]) ?>

    <?= $form->field($model, 'priority')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
