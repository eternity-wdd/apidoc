<?php
use yii\helpers\Url;
use app\models\ApiClientPlatform;
use app\models\Api;

$platforms = ApiClientPlatform::loadBitOptions($module);
// echo '<pre>';
// print_r($platforms);exit;
?>
<h2 class="fixmt">
	API列表		
</h2>

<div class="contentSub">
	<div id="bodyContent">
		<table class="t">
			<tbody>
			<?php foreach ($rows as $i=>$group):?>
			<?php if($i % 4 === 0):?>
				<tr>
			<?php endif;?>
					<th width="25%"><b><a href="<?= Url::to('#group'.$group->name)?>" title="<?= $group->name;?>"><?= $group->name;?></a></b></th>
			<?php if($i % 4 === 3):?>
				</tr>
			<?php endif;?>
			<?php endforeach;?>
			</tbody>
		</table>
		<p><br><br></p>
		<?php foreach ($rows as $i=>$group):?>
		
		<a name="group<?= $group->name;?>" id="group<?= $group->name;?>"></a>
		<h3> <span class="mw-headline"><?= $group->name;?>API</span></h3>
		<p>
			<b>主要使用场景：</b>
		</p>
		
		<table class="t2">
			<tbody>
				<tr>
					<th width="30%"><b>接口功能说明</b></th>
					<th width="20%"> <b>接口详细文档</b></th>
					<?php foreach ($platforms as $name):?>
					<th width="10%"> <b><?= $name; ?></b></th>
					<?php endforeach;?>
				</tr>
				<?php 
			    foreach ($apis as $api):
				    if($api->publish):
				    if($group->name == $api['service_id']):
				?>
				<tr>
					<td><?= $api->label;?></td>
					<td><a href="<?= Url::toRoute(['dc-api/view', 'id'=>$api->id])?>" title="<?= $api->name;?>"><?= $api->name;?></a></td>
					<?php foreach ($platforms as $bit=>$name):?>
					<td><?php if($api->platforms & $bit):?><img src="/images/API_legend_6.png" alt="API_legend_6.png"><?php endif;?></td>
					<?php endforeach;?>
				</tr>
				<?php 
				    endif;
				    endif;
				endforeach;
				?>
			</tbody>
		</table>
		<?php endforeach;?>
		<!-- <p>&gt;&gt;<a href="/wiki/API%E5%AF%BC%E8%88%AA%E5%9B%BE" title="API导航图">查看API导航图</a> -->
			<br><br><br>
		</p>
            <a target="_blank" href="<?= Url::toRoute(['sandbox/'.$module])?>" class="y-btn-blue">接口测试</a>
	</div>
</div>
