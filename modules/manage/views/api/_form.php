<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Api;
use yii\gii\components\ActiveField;
use app\models\ApiGroup;
use app\models\ApiClientPlatform;
use benben\helpers\MathHelper;
use yii\web\View;
use app\models\ApiModule;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\Api */
/* @var $form yii\widgets\ActiveForm */
$model->platforms = MathHelper::bitOrToArr($model->platforms);
$model->method = MathHelper::bitOrToArr($model->method);
 $res = ApiGroup::find()->select(['id','name'])->asArray()->all();
/* $result = ApiClientPlatform::find()->select(['name'])->all();
$client = []; */
$options = [];
foreach ($res as $k=>$v){
    $options[$v['id']] = $v['name'];
}
/* foreach ($result as $k=>$v){
    $client[$k+1] = $v['name'];
}  */

?>

<style>
.api-form {
	width:80%;
	margin:0 auto;
}
.xiala{
    height:34px;
	width:400px;
	padding:0 10px;
}
#api-platforms,#api-method{
	display:inline-block;
}
.control-label{
	width:80px;
}
.field-api-response label{
	width:150px
}
.cs_box{
	overflow:hidden;
	margin-bottom:20px; 
	
}
.control-label2{
	width:100px;
	border-top:1px solid #ccc;
	border-bottom:1px solid #ccc;
	border-left:1px solid #ccc;
	float:left;
	margin-bottom: 0px;
	width:100px;
	height:41px;
	text-align:center;
	line-height:41px;
}

.cs_input{
	height:30px;
	width:100%;
	padding:0px 3px;
}
.cs_checkbox{
	height:20px;
	width:20px;
	
}
.cs_btn{
	width:100px;
	height:30px;
}
.cs_box table .cs_first{
	width:200px;
}
.cs_box table td{
	padding: 0px 10px;
}
.cs_box table th,.cs_box table td{
	height:40px;
	width:350px;
	text-align:center;
}
.cs_box table th.cs_th,.cs_box table td.cs_th{
	width:120px;
}
.cs_th span{
	position:relative;
	top:-3px;
}
.combo-input{
	padding-top:8px;
	padding-bottom:8px;
	width:400px;
	border-radius: 0px;
}
.combo-select{
	display:inline-block;
	margin-bottom: 3px;
	width:400px;
}
.cs_box table td.button_td{
	width:100px;
}

</style>

<div class="api-form">
	
    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'label')->textInput(['maxlength' => true]) ?>
    
    <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'module_id')->radioList(ApiModule::loadOptions())?>

    <?php
    if($model->module_id){
        ?>
    <?= $form->field($model, 'platforms')->checkboxList(ApiClientPlatform::loadBitOptions($model->module_id)) ?>
    <?php }else{ ?>

    <?php }?>
    
    <?= $form->field($model, 'group_id')->dropDownList($options, ['prompt'=>'请选择','class'=>"xiala"]) ?>

    <?= $form->field($model, 'version')->input('number',['class'=>"xiala"]) ?>
    
    <?= $form->field($model, 'priority')->textInput(['class'=>"xiala"]) ?>  
    
    <?= $form->field($model, 'method')->checkboxList(Api::methodOptions()) ?>

    <?= $form->field($model, 'publish')->checkbox() ?>
    
    <?= $form->field($model, 'need_login')->checkbox() ?>
    
     <div class="cs_box">
     	<label class="control-label2">请求参数</label>
     	<table border="1" style="border:1px solid #ccc">
          <tr>
            <th class="cs_first">参数名称</th>
            <th>参数说明</th>
            <th>详细描述</th>
            <th>测试数据</th>
            <th class="cs_th">参数类型</th>
            <th class="cs_th">优先级</th>
            <th class="cs_th">是否必填</th>
            <th class="cs_th">前台展现形式</th>
            <th class="cs_th"><button type="button"  class="btn btn-success cs_add">新增参数</button></th>
          </tr>
          <?php if($params_model){ ?>
          	<?php foreach ($params_model as $k=>$v): ?>
          		<?php if($v['out'] =='0'){ ?>
          			<tr data-tr="<?php echo $k+1?>">
                        <td class="cs_first"><input name="cs_name[]" value="<?php echo $v['name']?>" class="cs_input first_input" type="text"/></td>
                        <td><input name="cs_label[]" value="<?php echo $v['label']?>" class="cs_input" type="text"/></td>
                        <td><input name="cs_desc[]" value="<?php echo $v['desc']?>" class="cs_input" type="text"/></td>
                        <td><input name="cs_val[]" value="<?php echo $v['val']?>" class="cs_input" type="text"/></td>
                        <td class="cs_th">
                        	<select name="cs_pt[]" class="cs_input">
                        	  <?php foreach ($params_type as $v2):?>
                              <option value ="<?php echo $v2['id']?>" <?php if($v['pt_id']==$v2['id']){ ?> selected <?php } ?> ><?php echo $v2['name']?></option>
                              <?php endforeach;?>                              
                            </select>
                        </td>
                        <td class="cs_th"><input name="cs_priority[]" value="<?php echo $v['priority']?>" class="cs_input" type="number"/></td>
                        <td class="cs_th">           	
                        	<input name="cs_request[<?php echo $k?>]" value="1" class="cs_checkbox" type="radio" <?php if($v['request']=='1'){ ?>checked <?php }?>/><span>是</span>
                        	<input name="cs_request[<?php echo $k?>]" value="0" class="cs_checkbox" type="radio" <?php if($v['request']=='0'){ ?>checked <?php }?>/><span>否</span>
                        </td>
                        <td class="cs_th">
                        	<select name="cs_showtype[]" class="cs_input showtype">
                              <option value ="1" <?php if($v['showtype']=='1'){ ?> selected <?php } ?> >input</option>
                              <option value ="2" <?php if($v['showtype']=='2'){ ?> selected <?php } ?> >textarea</option>
                              <option value="3" <?php if($v['showtype']=='3'){ ?> selected <?php } ?> >checkbox</option>
                              <option value ="4" <?php if($v['showtype']=='4'){ ?> selected <?php } ?> >radio</option>
                              <option value="5" <?php if($v['showtype']=='5'){ ?> selected <?php } ?> >select</option>
                            </select>
                        </td>
                        <td class="cs_th"><button type="button" class="btn btn-danger cs_del">删除</button></td>
         			</tr>
         			<?php if($v['showtype']=='3' || $v['showtype']=='4' ||$v['showtype']=='5'){ ?>
         				<?php $num=0;?>
         				<?php foreach (json_decode($v['param_cont']) as $key=>$val):?>
         				<?php if($num==0){?>
             				<tr class='cs_detail data-tr<?php echo $k+1?>'>
                            	<td colspan='2'> 参数值（value）:<input name='showval[]' class='cs cs_val' value='<?php echo $key?>'></td>
                            	<td colspan='2'> 参数名（label）:<input name='showlabel[]' class='cs cs_label' value='<?php echo $val?>'> </td>
                            	<td class='button_td'><button class='btn btn-success add_detail' type='button'>增加参数详情</button></td>
                            </tr>
                        <?php }else{?>
                        	<tr class='cs_detail data-tr<?php echo $k+1?>'>
                            	<td colspan='2'> 参数值（value）:<input name='showval[]' class='cs cs_val' value='<?php echo $key?>'></td>
                            	<td colspan='2'> 参数名（label）:<input name='showlabel[]' class='cs cs_label' value='<?php echo $val?>'> </td>
                            	<td class='button_td'><button class='btn btn-danger del_detail' type='button'>删除</button>
                            </tr>
                        <?php }?>
                        <?php $num++;?>
                        <?php endforeach;?>
         			<?php } ?>
                   
          		<?php } ?>
          	<?php endforeach; ?>
          <?php } ?>
           
        </table>
      </div>
      
      <div class="cs_box">
        <label class="control-label2">返回参数</label>
        <table border="1" style="border:1px solid #ccc">
          <tr>
            <th class="cs_first">参数名称</th>
            <th>参数说明</th>
            <th>详细描述</th>
            <th class="cs_th">参数类型</th>
            <th class="cs_th">优先级</th>
            <th class="cs_th">是否必填</th>
            <th class="cs_th"><button type="button"  class="btn btn-success cs_add2">新增参数</button></th>
          </tr>
          <?php if($params_model){ ?>
          	<?php foreach ($params_model as $key=>$val): ?>
          		<?php if($val['out'] =='1'){ ?>
                     <tr>
                        <td class="cs_first"><input name="re_name[]" value="<?php echo $val['name']?>" class="cs_input first_input" type="text"/></td>
                        <td><input name="re_label[]" value="<?php echo $val['label']?>" class="cs_input" type="text"/></td>
                        <td><input name="re_desc[]" value="<?php echo $val['desc']?>" class="cs_input" type="text"/></td>
                        <td class="cs_th">
                        	<select name="re_pt[]" class="cs_input">
                              <?php foreach ($params_type as $v3):?>
                              <option value ="<?php echo $v3['id']?>" <?php if($v['pt_id']==$v3['id']){ ?> selected <?php } ?> ><?php echo $v3['name']?></option>
                              <?php endforeach;?> 
                            </select>
                        </td>
                        <td class="cs_th"><input name="re_priority[]" value="<?php echo $val['priority']?>" class="cs_input" type="number"/></td>
                        <td class="cs_th">           	
                        	<input name="re_request[<?php echo $key?>]" value="1" class="cs_checkbox" type="radio" <?php if($val['request']=='1'){ ?>checked <?php }?>/><span>是</span>
                        	<input name="re_request[<?php echo $key?>]" value="0" class="cs_checkbox" type="radio" <?php if($val['request']=='0'){ ?>checked <?php }?>/><span>否</span>
                        </td>
                        <td class="cs_th"><button type="button" class="btn btn-danger cs_del">删除</button></td>
                     </tr>
          		<?php } ?>
          	<?php endforeach;?>
		  <?php } ?>
        </table>
    </div>
	
	<?= $form->field($model, 'request_sample')->textArea(['rows'=>5])  ?>
    <?php /* echo  $form->field($model, 'example')->textArea(['rows'=>8])  */?>

    <?= $form->field($model, 'response')->textArea(['rows'=>8]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<script type="text/javascript">
<?php $this->registerJs('domReady();', View::POS_READY);?>
function domReady(){

	$('input[name="Api[module_id]"]').click(function(){
		var zhi  = $(this).val();
		if(zhi){
			$.ajax({
	            type:"POST",
	            url:"<?php echo Url::toRoute('api/getplatforms'); ?>",
	            data:{"zhi":zhi},
	            async:false,
	            error:function(data){
	            	alert('有误');
	            },
	            success:function(data){
	            	$('#api-platforms').html(data);
	            }
	        });
		}
	})
	
	var num = $('input[name="cs_name[]"]').length;
	var num2 = $('input[name="re_name[]"]').length;

	$('.cs_add').click(function(){
		num++;
		$(this).parents('table').append("<tr data-tr='"+num+"'><td class='cs_first'><input name='cs_name[]' value='' class='cs_input first_input' type='text'/></td><td><input name='cs_label[]' value='' class='cs_input' type='text'/></td><td><input name='cs_desc[]' value='' class='cs_input' type='text'/></td><td><input name='cs_val[]' value='' class='cs_input' type='text'/></td><td class='cs_th'><select name='cs_pt[]' class='cs_input'><option value ='1'>string</option><option value ='2'>int</option><option value='3'>float</option><option value='4'>varchar</option><option value='5'>number</option></select></td><td class='cs_th'><input name='cs_priority[]' value='5' class='cs_input' type='number'/></td><td class='cs_th'><input name='cs_request["+num+"]' value='1' class='cs_checkbox' type='radio' checked/><span>是</span><input name='cs_request["+num+"]' value='0' class='cs_checkbox' type='radio'/><span>否</span></td><td class='cs_th'><select name='cs_showtype[]' class='cs_input showtype'><option value ='1'>input</option><option value ='2'>textarea</option><option value='3'>checkbox</option><option value ='4'>radio</option><option value='5'>select</option></select></td><td class='cs_th'><button type='button' class='btn btn-danger cs_del'>删除</button></td></tr>");
		
	})
	
	$('.cs_add2').click(function(){
		num2++;
		$(this).parents('table').append("<tr><td class='cs_first'><input name='re_name[]' value='' class='cs_input first_input' type='text'/></td><td><input name='re_label[]' value='' class='cs_input' type='text'/></td><td><input name='re_desc[]' value='' class='cs_input' type='text'/></td><td class='cs_th'><select name='re_pt[]' class='cs_input'><option value ='1'>string</option><option value ='2'>int</option><option value='3'>float</option><option value='4'>varchar</option><option value='5'>number</option></select></td><td class='cs_th'><input name='re_priority[]' value='5' class='cs_input' type='number'/></td><td class='cs_th'><input name='re_request["+num2+"]' value='1' class='cs_checkbox' type='radio' checked/><span>是</span><input name='re_request["+num2+"]' value='0' class='cs_checkbox' type='radio'/><span>否</span></td><td class='cs_th'><button type='button' class='btn btn-danger cs_del'>删除</button></td></tr>");
		
	})
	
	//删除整行
	$("body").on("click",".cs_del",function(data){
		var datatr = $(this).parents('tr').attr('data-tr');
		$('.data-tr'+datatr).remove();
		$(this).parents('tr').remove();
	});

	$('#api-group_id').comboSelect();

	//选择前台展示形式 出现详细参数表格
	$('body').on('change','.showtype',function(){
		var zhi = $(this).val();
		var name = $(this).parent().siblings('.cs_first').children('.cs_input').val();
		var datatr = $(this).parent().parent().attr('data-tr');
// 		console.log('aaaa'+datatr);
// 		console.log(name);
// 		console.log(zhi);

		if(zhi!='1' && zhi!='2'){			
			var a = $(this).parent().parent().next('.cs_detail').find('input').html();
			if(a == undefined){
				$(this).parent().parent().after("<tr class='cs_detail data-tr"+datatr+"'><td colspan='2'> 参数值（value）:<input name='showval["+name+"][]' class='cs cs_val' value=''></td><td colspan='2'> 参数名（label）:<input name='showlabel["+name+"][]' class='cs cs_label' value=''> </td> <td class='button_td'><button class='btn btn-success add_detail' type='button'>增加参数详情</button></td></tr>")
			}
		}else{
		    var dataclass = 'data-tr'+datatr;
		    $('.'+dataclass).remove();
		}
	})

	//点击添加详情参数
	$('body').on('click','.add_detail',function(){
		var datatr = $(this).parent().parent().prev().attr('data-tr');
		var name = $(this).parent().parent().prev().find('.first_input').val();
		$(this).parent().parent().after("<tr class='cs_detail data-tr"+datatr+"'><td colspan='2'> 参数值（value）:<input name='showval["+name+"][]' class='cs cs_val' value=''></td><td colspan='2'> 参数名（label）:<input name='showlabel["+name+"][]' class='cs cs_label' value=''> </td> <td class='button_td'><button class='btn btn-danger del_detail' type='button'>删除</button></td></tr>")
	})
	
	//点击删除参数详情
	$('body').on('click','.del_detail',function(){
		$(this).parent().parent().remove();
	})
	
	//监听input输入 name,修改对应详情参数属性
	$('body').on('blur','.first_input',function(){
		var val = $(this).val();
		var datatr = $(this).parents('tr').attr('data-tr');
		$('.data-tr'+datatr).find('.cs_val').attr('name','showval['+val+'][]');
		$('.data-tr'+datatr).find('.cs_label').attr('name','showlabel['+val+'][]');

    }); 

	//自动触发input丧失焦点 给参数详情赋name值
	$('body').on("myEvent", function(){ 
		 $('.first_input').blur();
	});
	$('body').trigger("myEvent");

	$('body').on('click','button[type=submit]',function(){
		if($('.cs_input').val() =='' || $('.cs').val()==''){
			alert('请将数据添加完整');
			return false;
		}else{
			return true;
		}
	})
}
</script>
