<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;
use app\models\LoginForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<?php $this->beginPage() ?>
<?php $this->beginBody() ?>
<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<style>
body {
	width: 100%;
    height: 100%;
    background: #55ade1;
	overflow:hidden;
}
#loginform-verifycode{
	width: 58%;
	float: left;
}
#loginform-verifycode-image{
	float: right;
	width: 120px;
	margin-left: 2%;
	height: 40px;
}
.field-loginform-verifycode{
	overflow: hidden;
}
</style>
<div class="login-box">
	 <div class="login-logo">
        <b>API帮助文档</b>
      </div><!-- /.login-logo -->
   <div class="login-box-body">
		<p class="login-box-msg">Sign in to start your session</p>
<!--    <p>Please fill out the following fields to login:</p>--> 
            <?php $form = ActiveForm::begin([
                'id' => 'login-form',

            ]); ?>
			
            <?= $form->field($model, 'username')->textInput([]) ?>

            <?= $form->field($model, 'password')->passwordInput() ?>

            <?= $form->field($model, 'verifyCode')->widget(\yii\captcha\Captcha::className(), [
                'captchaAction' => ['/site/captcha'],
                'template' => '{input}{image}',
                'imageOptions'=>['style'=>'cursor:pointer'],
            ]) ?>

            <div class="form-group">
                <?= Html::submitButton('登 录', ['class' => 'btn btn-primary btn-block btn-flat', 'name' => 'login-button']) ?>
            </div>

            <?php ActiveForm::end(); ?>
    </div>
</div>
<?php $this->endBody() ?>
<?php $this->endPage() ?>