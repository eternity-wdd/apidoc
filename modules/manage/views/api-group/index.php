<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ApiGroupSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '接口分组管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="api-group-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新增分组', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            'module_id',
            'desc',
            'priority',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
