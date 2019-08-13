<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\admin\models\ApiParamSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Api Output Params');
$this->params['breadcrumbs'][] = $model->name;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="api-param-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php  echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Api Param'), ['create', 'api'=>$api], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        /* 'filterModel' => $searchModel, */
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            /* 'id',
            'api_id', */
            'name',
            'pt_id',
            [
                'attribute' => 'request',
                'value' => function ($model) {
                $state = [
                    '0' => '否',
                    '1' => '是',
                ];
                return $state[$model->request];
                },
                ],
            [
                'attribute' => 'out',
                'value' => function ($model) {
                    $state = [
                        '0' => '输入',
                        '1' => '输出',
                    ];
                    return $state[$model->out];
                },
                ],
            // 'desc',
            // 'success:ntext',
            // 'priority',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
