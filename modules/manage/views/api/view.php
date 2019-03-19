<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\ApiModule;

/* @var $this yii\web\View */
/* @var $model app\models\Api */

$this->title = $model->name;
$module_name = $model->module_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', $module_name), 'url' => ['list','module_id'=>$module_name]];
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="api-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id,'module'=>$module['module_id']], ['class' => 'btn btn-primary']) ?>
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
              'value'=>$model->module->getMethod($model->method),
            ],
            [
              'label'=>'所属分组',
              'value'=>$model->module->getGroup($model->group_id),
            ],
            [
                 'label'=>Yii::t('app', 'Module'),
                 'value'=>$model->module->label,                
            ], 
            'priority',
            'description',
            [
                'label'=>'选择平台',
                'value'=>$model->module->getPlatforms($type_display),
            ],
            [
              'label'=>'是否需要登录才可调用',
              'value'=>$model->module->getNeedlogin($model->need_login),
            ],
            [
                'label'=>'是否前台显示',
                'value'=>ApiModule::getpublish($model->publish),
            ],
            'version',
        ],
    ]) ?>

</div>
