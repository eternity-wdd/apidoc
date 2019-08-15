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
#host input[type='text']
{
    width: 200px;
    height: 27px;
}
#env input[type='text']
{
    width: 200px;
    height: 27px;
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
    <div id = 'api-system'>
        <label>中台系统:</label>
        <select id="api-system-selector" name="system_id">
            <option>选择系统</option>
            <?php foreach ($systems as $i=>$system):?>
                <option value="<?= $system['system_id']; ?>" <?php if($system['system_id'] == $system_id){?>selected<?php }?>><?= $system['name']; ?></option>
            <?php endforeach;?>
        </select>
        <input name="content_type" id="contentype" type="hidden" value=<?= $type; ?> >
        <span  id="contentypes" style="font-weight: bold"><?= "（".$type."）"; ?></span>
    </div>
    <div id="api-service">
        <input type="hidden" id="old-service-id" value="<?= $service_id; ?>">
        <label>服务模块:</label>
        <select id="api-service-selector" type="select" name="service_id">
            <option>选择服务</option>
            <?php foreach ($services as $i=>$service):?>
                <option value="<?= $service['service_url']; ?>" <?php if($service['name'] == $service_id){?>selected<?php }?>><?= $service['label']; ?></option>
            <?php endforeach;?>
        </select>
    </div>

    <div id = 'api-client'>
        <label>应用系统:</label>
        <select id="api-client-selector" name="app_id">
            <option>选择应用</option>
            <?php foreach ($clients as $i=>$client):?>
                <option value="<?= $client['from']; ?>" ><?= $client['name']; ?></option>
            <?php endforeach;?>
        </select>
    </div>

    <div id = 'api-env'>
        <label>环境配置:</label>
        <select id="api-env-selector" name="env">
            <option>选择环境</option>
            <option value="dev" >env</option>
            <option value="online" >online</option>
        </select>
    </div>
<!--    <div id="account-info">-->
<!--        <div>-->
<!--            <label>TOKEN:</label>-->
<!--            <input type="text" name="param[access_token]" value="" />-->
<!--        </div>-->
<!--    </div>-->
    <div>
    	<input type="hidden" name="m_id" value="<?php echo $_GET['id']?>"/>
<!--        <div id="http"><label>协议名称：</label>  <input type="text" name="http" placeholder="比如: https://," value="http://" />&nbsp;&nbsp;&nbsp;(非必填)</div>-->
<!--        <div id="env"><label>域名前缀：</label>  <input type="text" name="env" placeholder="比如: dev-" value="" />&nbsp;&nbsp;&nbsp;(非必填)</div>-->
<!--        <div id="host"><label>域名：</label>  <input type="text" name="domain" readonly="true" value=--><?//= $apis[0]['domain']; ?><!-- />&nbsp;&nbsp;&nbsp;(生产地址)</div>-->
        <label>接口：</label>
        <select id="api-selector" name="api_url">
            <option>选择测试接口</option>
        <?php foreach ($apis as $i=>$api):?>
            <option value="<?= $api['id']; ?>" <?php if($api['id'] == $_GET['id']){?>selected<?php }?>><?= $api['label']; ?></option>
        <?php endforeach;?>
        </select>

    </div>
    <div>
        <div id="system-auth">
            <?php
            if($system_id=='AUTH_WEB001')
            {
                echo "<div>
	<label>client_id：</label> 
	<input type=\"text\" id='client_id' name=\"param[client_id]\" value=\"xxx\" />　(必填)
	<span style=\"font-weight: bold\">（client_id）</span>
</div>

<div>
	<label>client_secret：</label> 
	<input type=\"text\" id=\"client_secret\" name=\"param[client_secret]\" value=\"xxx\" />　(必填)
	<span style=\"font-weight: bold\">（client_secret）</span>
</div>";
            }
            ?>
        </div>
    <div id = "params">

    </div>
    </div>
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
				   url: "<?= Url::toRoute('dc-sandbox/gethtml')?>",
				   data:{"zhi":a, "system":system, "service":service},
				   dataType: "html",
				   error:function(data){
		            	alert('有误');
		            },
				   success: function(response){
				       // console.log(response)
				       $('#params').html();
					   $('#params').html(response);
				   }
				});

	}
	$('#api-selector').change(function(){
		
		var a= $(this).val();

		$.ajax({
			   type: "POST",
			   url: "<?= Url::toRoute('dc-sandbox/gethtml')?>",
                data:{"zhi":a},
			   dataType: "html",
			   error:function(data){
	            	alert('有误');
	            },
			   success: function(response){
			       $('#params').html();
				   $('#params').html(response);
			   }
			});
	})
    $('#api-system-selector').change(function(){
        var system= $(this).val();
        var old_service_id = $('#old-service-id').val();
        var service_id = $('#api-system-selector').val();

        if(system != 'AUTH_WEB001')
        {
            $('#system-auth').empty();
        }else
        {
            var client = $('#api-client-selector').val();
            var env = $('#api-env-selector').val();
            $('#system-auth').empty();
            if(client && env)
            {
                // TODO 重新选择client_id
                $.ajax({
                    type: "POST",
                    url: "<?= Url::toRoute('dc-sandbox/getclientid')?>",
                    data:{"system":system,"service":service_id, "client":client, "env":env},
                    dataType: "Json",
                    error:function(response){
                        alert('有误:getclientid');
                    },
                    success: function(response){
                        // $("#client_id").val();
                        // $("#client_secret").val(response.secret);
                        $('#system-auth').html("<div id='api-client-id'>\n        <label>client_id:</label>\n        <input type=\"text\" id='client_id' name=\"client_id\" value="+response.client_id+" />\n    </div>\n    <div id='api-client-secret'>\n        <label>client_secret:</label>\n        <input type=\"text\" id='client_secret' name=\"client_secret\" value="+response.secret+" />\n    </div>");
                    }
                });
            }else
            {
                $('#system-auth').html("<div id='api-client-id'>\n        <label>client_id:</label>\n        <input type=\"text\" id='client_id' name=\"client_id\" value=\"请确认配置\" />\n    </div>\n    <div id='api-client-secret'>\n        <label>client_secret:</label>\n        <input type=\"text\" id='client_secret' name=\"client_secret\" value=\"请确认配置\" />\n    </div>");
            }
        }
        $.ajax({
            type: "POST",
            url: "<?= Url::toRoute('dc-sandbox/gettype')?>",
            data:{"system_id":system},
            dataType: "Json",
            error:function(response){
                alert('有误:content-type');
            },
            success: function(response){
                $('#contentype').html();
                $('#contentypes').html('('+response.type+')');
                $('#contentype').val(response.type);
            }
        });
        $.ajax({
            type: "POST",
            url: "<?= Url::toRoute('dc-sandbox/getservice')?>",
            data:{"system_id":system,"service_id":old_service_id},
            dataType: "html",
            error:function(data){
                alert('有误:system');
            },
            success: function(response){
                $('#api-service').empty();
                $('#api-service').html(response);
            }
        });
    })
	$('#api-env-selector').change(function () {
        var system = $('#api-system-selector').val();
        var service = $('#api-service-selector').val();
        var client = $('#api-client-selector').val();
        if(!system || !client)
        {
            alert("请填写正确的配置！")
            return false;
        }
        if(system == 'AUTH_WEB001')
        {
            var env = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?= Url::toRoute('dc-sandbox/getclientid')?>",
                data:{"system":system,"service":service, "client":client, "env":env},
                dataType: "Json",
                error:function(response){
                    alert('有误:getclientid');
                },
                success: function(response){
                    $("#client_id").val(response.client_id);
                    $("#client_secret").val(response.secret);
                }
            });
        }

    });
	
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