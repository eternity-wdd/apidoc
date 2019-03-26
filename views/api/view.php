<?php
use app\models\Api;
use yii\helpers\Url;
use yii\helpers\Html;
?>
<!--名称-->
<style>
div#bodyContent table.t{
	    margin-bottom: 50px;
}
div#bodyContent table.t td, table.t th{
	height:30px;
	padding-left:10px;
}
</style>
<div class="contentSub">
	<div id="bodyContent">
		
		<!-- <div class="">
			<h3 class="">基本信息</h3>
			<a class="jbxx_title">接口名称：< = $api->name;?></a>
			<a class="jbxx_title">接口说明：<= $api->label;?></a>
			<a class="jbxx_title">调用说明：http://[域名]/<= $api->name;?></a>
			<a class="jbxx_title">请求方式：</a>
			<a class="jbxx_title">返回格式：JSON </a><br/>
			<a class="jbxx_title">请求事例：
				
			</a><br/>
			<div class="jbxx_title">各个参数请进行URL 编码，编码时请遵守：<a href="http://tools.ietf.org/html/rfc1738" class="external" title="http://tools.ietf.org/html/rfc1738" target="_blank">RFC 1738</a> </div><br/>
			<div class="jbxx_title">公共参数（发送请求时必须传入）：<a></a> </div><br/>
			<div class="jbxx_title">公共返回码说明：<a></a> </div>
		</div> -->
	
		<table class="t">
			<tbody>
				<tr>
					<th width="20%"><b>基本信息</b></th>
					<th><b>描述</b></th>
				</tr>
				<tr> 
					<td> <b>接口名称</b></td>
					<td> <?= $api->name;?></td>
				</tr>
				<tr> 
					<td> <b>接口说明</b></td>
					<td> <?= $api->label;?></td>
				</tr>
				<tr> 
					<td> <b>调用说明</b></td>
					<td> http://[域名]/<?= $api->name;?></td>
				</tr>
				<tr> 
					<td> <b>请求方式</b></td>
					<td> <?= Api::methodLabel($api->method);?></td>
				</tr>
				<tr> 
					<td> <b>返回格式</b></td>
					<td> JSON</td>
				</tr>
				<tr> 
					<td> <b>请求事例</b></td>
					<td> 
						<?php if(empty($api->request_sample)):?>
                			http://<?= Yii::$app->params['api'][$api->module_id]['domain']?>/<?= $api->name?>?<?= $api->example?>
                		<?php  else:?>
                			<?= $api->request_sample?>
                		<?php endif;?>
					</td>
				</tr>
				<tr> 
					<td> <b>各个参数请进行URL 编码，编码时请遵守</b></td>
					<td> <a href="http://tools.ietf.org/html/rfc1738" class="external" title="http://tools.ietf.org/html/rfc1738" target="_blank">RFC 1738</a></td>
				</tr>
				<tr> 
					<td> <b>公共参数（发送请求时必须传入）</b></td>
					<td> <a href="<?=Url::to('public')?>" title="公共参数说明">公共参数说明</a></td>
				</tr>
				<tr> 
					<td> <b>返公共返回码说明</b></td>
					<td> <a href="<?=Url::to('code')?>" title="公共返回码说明">公共返回码说明#OpenAPI V3.0 返回码</a></td>
				</tr>
			</tbody>
		</table>

		<h3 class="">请求参数</h3>
		<table class="t">
			<tbody>
				<tr>
					<th width="10%"><b>参数名称</b></th>
					<th width="10%"><b>是否必须</b></th>
					<th width="10%"><b>类型</b></th>
					<th> <b>描述</b></th>
				</tr>
				<?php foreach ($api->inParams as $param):?>
				<tr>
					<td> <b><?= $param->name;?></b></td>
					<td><font color="red"><?= $param->request ? '是' : ''?></font></td>
					<td> <?= $param->pt->name;?></td>
					<td>  <?=/*  $param->label.'<br />'. */$param->desc;?>
					</td>
				</tr>
				<?php endforeach;?>
			</tbody>
		</table>
		
		<h3> <span class="mw-headline">响应数据</span></h3>
		<table class="t">
			<tbody>
				<tr>
					<th width="20%"><b>参数名称</b></th>
					<th><b>描述</b></th>
				</tr>
				<tr> 
					<td> <b>code</b></td>
					<td> 返回码。详见<a href="<?=Url::to('code')?>" title="公共返回码说明">公共返回码说明#OpenAPI V3.0 返回码</a>。</td>
				</tr>
				<?php foreach ($api->outputParams as $param):?>
				<tr>
					<td> <b><?= $param->name?></b></td>
					<td><?= $param->desc?></td>
				</tr>
				<?php endforeach;?>
			</tbody>
		</table>

		<h3> <span class="mw-headline">正确返回示例</span><span style="color:#888;font-size:14px;"> JSON示例:</span></h3>
		
		<div class="code">
			<pre><?= $api->response ? : '{
            "ret":0
            }'?>
            </pre>
		</div>
		<a target="_blank" href="<?= Url::toRoute(['sandbox/'.$api->module_id,'id'=>$api->id])?>" class="y-btn-blue">接口测试</a>
		
		<!-- 
		<h2> <span class="mw-headline">3 示例代码</span></h2>
		<p>您可以直接下载并使用腾讯开放平台提供的SDK，并参考SDK里面的给出的示例代码进行接口调用。<br>
			详见：
			<a href="/wiki/SDK%E4%B8%8B%E8%BD%BD#OpenAPI_V3.0_SDK.E4.B8.8B.E8.BD.BD" title="SDK下载">SDK下载#OpenAPI V3.0 SDK下载</a>。
		</p>
		 -->

	</div>
</div>
