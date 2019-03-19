
<?php

use yii\bootstrap\ActiveForm;
use yii\helpers\Html;

?>
<div class="cont">
	<div class="breadcrumb">
		
	</div>
	<div class="edit">
		<h2><?php echo '用户登入'; ?></h2>
			<?php
            if (Yii::$app->session->hasFlash('info')) {
                echo Yii::$app->session->getFlash('info');
            }
         ?>
         <div class="f14 textContent c333">
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
</div>