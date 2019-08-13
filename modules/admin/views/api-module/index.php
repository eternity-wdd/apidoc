<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\admin\models\ApiServiceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '服务管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="api-module-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('创建', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],s
            'name',
            'label',
            'service_url',
            'system_id',
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
