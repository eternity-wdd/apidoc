<style>
.wrap > .container {
	font-size: 14px;
}
.wrap > .container label{
	width: 155px;
    height: 30px;
    line-height: 30px;
	
}
.wrap > .container input[type='text']{
	height: 27px;
	width: 200px;
}
.wrap > .container #params select{
	width: 200px;
	height: 24px;
}
.combo-select{
	display: inline-block;
	border: 1px solid #999;;
	box-sizing: border-box;
	border-radius: 0;
}
.mytext{
	width:250px;
	height:50px;
}
.mylabel{
	position:relative;
	top:-30px;
}
</style>
<?php
use app\models\Api;
use yii\helpers\Url;
use yii\web\View;
use benben\widgets\JsonView;
use yii\base\Widget;
use app\models\Order;
use benben\assets\JQueryFormAsset;

/* @var $this yii\web\View */

JQueryFormAsset::register($this, View::POS_READY);

?>
<div class="wrap">
<div class="container">
<form method="post" action="<?= Url::toRoute('request');?>" id="testForm" autocomplete="off">
<!--    <div>-->
<!--        <label>APPID:</label>-->
<!--        <input type="text" name="appid" value="2100001" />-->
<!--    </div>-->
<!--    <div>-->
<!--        <label>SECRET:</label>-->
<!--        <input type="text" name="secret" value="hh8bf094169a40a3bd188ba37ebe872v" />-->
<!--    </div>-->
    <div id="account-info">
        <div>
            <label>UID:</label>
            <input type="text" name="param[uid]" value="" />
        </div>
        <div>
            <label>TOKEN:</label>
            <input type="text" name="param[token]" value="" />
        </div>
    </div>
    <div>
    	<input type="hidden" name="m_id" value="<?php echo $_GET['id']?>"/>
        <label>接口</label>
        <select id="api-selector" name="param[api]">
            <option>选择测试接口</option>
        <?php foreach ($apis as $i=>$api):?>
            <option value="<?= $api['id']; ?>" <?php if($api['id'] == $_GET['id']){?>selected<?php }?>><?= $api['label']; ?></option>
        <?php endforeach;?>
        </select>
    </div>
    <div id="params"></div>
    <div><input class="btn btn-primary" type="button" onclick="formSubmit()" value="测试"/></div>
</form>

<div id="jsonview" style="margin-top: 20px"><?php JsonView::widget();?></div>
<div id="result"></div>
</div>
</div>

<script type="text/javascript">

<?php $this->registerJs('domReady();', View::POS_READY);?>


function domReady()
{
	$('select').comboSelect();
	
 	api_id = $('#api-selector').val();

//  	if(api_id!=''){
//  		$('#api-selector').trigger("change");
//  	 }

 	$('body').on("myEvent", function(){ 
 		$('#api-selector').trigger("change");
	});
	$('body').trigger("myEvent");

	var a = $('#api-selector').val();
	if(a){
			$.ajax({
				   type: "POST",
				   url: "<?= Url::toRoute('sandbox/gethtml')?>",
				   data:{"zhi":a},
				   dataType: "html",
				   error:function(data){
		            	alert('有误');
		            },
				   success: function(response){
					  $('#params').html();
				     console.log(response);
					 $('#params').html(response);
				   }
				});

	}
	$('#api-selector').change(function(){
		
		var a= $(this).val();
		$.ajax({
			   type: "POST",
			   url: "<?= Url::toRoute('sandbox/gethtml')?>",
			   data:{"zhi":a},
			   dataType: "html",
			   error:function(data){
	            	alert('有误');
	            },
			   success: function(response){
				  $('#params').html();
			     console.log(response);
				 $('#params').html(response);
			   }
			});
	})
	
	
}

function apiSelect(obj)
{
	var refid = jQuery(obj.options[obj.selectedIndex]).attr("refid");
	if(refid == 'userLogin' || refid == 'getBusiness' || refid == 'signUp')
	{
		//jQuery("#account-info").hide();
		//jQuery("#account-info").remove();
	}
	else
	{
		jQuery("#account-info").show();
	}
	
	if(refid == null)
	{
		jQuery("#params").html('');
	}
	else
	{
		jQuery("#params").html(paramsHtml[refid+"Html"]);
	}
}

function formSubmit()
{
	$("#testForm").ajaxSubmit({
		dataType:'text',
		success:function(data){
			$("#result").html(data);
			$("#jsontext").val($("#result pre").html());
			g_jsonviewer.format();
	}});
}

</script>