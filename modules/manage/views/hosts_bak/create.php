<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\HostsBak */

$this->title = Yii::t('app', 'Create HostsBak');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'HostsBak'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="hosts-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
