<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Api */

$this->title = Yii::t('app', 'Create Api');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Apis'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
echo $options;
?>
<div class="api-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'module' =>$module,
        'params_model'=> $params_model,
        'params_type'=>$params_type,//参数所有类型
    ]) ?>

</div>
