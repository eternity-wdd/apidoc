<?php

use yii\bootstrap\ActiveForm;
use yii\helpers\Html;

?>
<div class="cont">
	<div class="breadcrumb">
		
	</div>
	<div class="edit">
		<h2><?php echo '用户注册'; ?></h2>

         <div class="f14 textContent c333">
    		<?php $form = ActiveForm::begin([
    		    'id' => 'form-id',
    		    'enableAjaxValidation' => true,
    		    'method' => 'post',
            ]) ?>
            <?= $form->field($model, 'username')->textInput(['maxlength' => 20]); ?>
            <?= $form->field($model, 'email')->textInput(['maxlength' => 20]); ?>
            <?=  $form->field($model, 'password_hash')->passwordInput(['maxlength' => 20]); ?>
            <?= $form->field($model, 'repassword')->passwordInput(['maxlength' => 20]) ?>
            <?php /* $form->field($model, 'verifyCode')->widget(\yii\captcha\Captcha::className(), [
                'captchaAction' => ['/site/captcha'],
                'template' => '{input}{image}',
                'imageOptions'=>['style'=>'cursor:pointer'],
            ]) */?>
            <?=  Html::submitButton('提交', ['class' => 'btn btn-primary']); ?>
            <?php ActiveForm::end(); ?>
        </div>
	</div>
</div>