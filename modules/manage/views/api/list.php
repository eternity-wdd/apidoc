<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\web\View;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ApiSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */


// $module_name = $_GET['module_id'];
// $this->title = Yii::t('app', $module_name);
$this->params['breadcrumbs'][] = $this->title.'接口管理';
?>
<div class="api-index">
	<input type="hidden" value="<?php echo $search['module_id'] ?>" name="search" id="search">
    <h1><?= Html::encode($this->title) ?></h1>
    <?php  echo $this->render('_search', ['model' => $searchModel,'options'=>$options,'module' =>$module]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Api'), ['create','module_id' => $module], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        /* 'filterModel' => $searchModel, */
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//             'id',
            'name',
            'label',
            'group_id',
            ['label' => Yii::t('app', 'Group'), 'attribute' => 'name',  'value' => 'group.name' ],
           /*  'module_id', */
            ['label' => Yii::t('app', 'Module'), 'attribute' => 'module_id',  'value' => 'module.label' ],
            // 'priority',
            // 'description',

            ['class' => 'yii\grid\ActionColumn',
/*                'template' => '{params} {view} {update} {delete}',
               'buttons'=>[
                   'params'=>function ($url, $model, $key) {
               
                       $options = array_merge([
                           'title' => \Yii::t('app', 'Api Params'),
                           'aria-label' => \Yii::t('app', 'Api Params'),
                           'data-pjax' => '0',
                       ]);
                       return Html::a('<span class="glyphicon glyphicon-list"></span>', ['api-param/index','api'=>$model->id], $options);
                   
                    },
                ] */
           ],
        ],
    ]); ?>

</div>

<script type="text/javascript">
<?php $this->registerJs('domReady();', View::POS_READY);?>


function domReady()
{

	$('#apisearch-module_id').change(function(){
		var zhi  = $(this).val();
		if(zhi){
			$.ajax({
	            type:"POST",
	            url:"<?php echo Url::toRoute('api/gettag'); ?>",
	            data:{"zhi":zhi},
	            async:false,
	            error:function(data){
	            	alert('有误');
	            },
	            success:function(data){

	            	$('#api-selector').html(data);
	            }
	        });
		}
	})


	var search = $('#search').val();
	if(search!=''){
		$('#apisearch-module_id').trigger("change");
		var a = '<?php echo $search['group_id']?>';
		if(a != 'empty'){
			$('#api-selector').val(<?php echo $search['group_id']?>);
		}
	}
	

// 	$('select').comboSelect();
}

</script>

