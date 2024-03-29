<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\ApiClient */

$this->title = Yii::t('app', 'Create Api Client');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Api Clients'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="api-client-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
