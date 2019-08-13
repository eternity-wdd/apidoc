<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\modules\admin\models\ApiService;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\Api */

$this->title = $model->name;
$module_name = $model->service_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', $module_name), 'url' => ['list','service_id'=>$module_name]];
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="api-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id,'service'=>$service['service_id']], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
        
    </p>
	
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'name',
            'label',
            [
              'label'=>'请求方法',
              'value'=>$model->service->getMethod($model->method),
            ],
            [
                 'label'=>Yii::t('app', 'Service'),
                 'value'=>$model->service->label,
            ],
            'priority',
            'description',
            [
                'label'=>'选择平台',
                'value'=>$model->service->getPlatforms($type_display),
            ],
            [
                'label'=>'是否前台显示',
                'value'=>ApiService::getpublish($model->publish),
            ],
            'version',
        ],
    ]) ?>

</div>
