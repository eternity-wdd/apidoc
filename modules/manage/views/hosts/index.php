<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\HostsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Hosts');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="hosts-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Hosts'), ['create'], ['class' => 'btn btn-success']) ?>
        <botton><a href="http://dev-apidoc.klagri.com.cn:88/manage/hosts/deploy">部署hosts</a></botton>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'ip',
            'domain',
            'alias',
            'remark',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
