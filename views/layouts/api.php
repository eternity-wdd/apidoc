<?php

/* @var $this \yii\web\View */
/* @var $content string */
$this->registerCssFile('/css/product.css');
$this->registerCssFile('/css/api.css');
?>
<!-- 先引用main.php布局文件， -->
<?php $this->beginContent('@app/views/layouts/frontend.php');?>
<!-- <div class="menu">
	<div class="all y-clear" id="J_menu">
		全部产品
		<i class="icon-menu"></i>
		<div class="goods y-clear">
			<div class="y-left">
				<span>弹性计算</span>
				<ul>
					<li><a href="">云服务器 ECS </a></li>
					<li><a href="">弹性伸缩</a></li>
					<li><a href="">云引擎 ACE</a></li>
					<li><a href="">容器服务</a></li>
					<li><a href="">高性能计算 HPC</a></li>
				</ul>
	  			<span>数据库</span>
				<ul>
	  		  		<li><a href="">云数据库 RDS</a></li>
	  		  		<li><a href="">云数据库 OceanBase</a></li>
	  		  		<li><a href="">PB 级云数据库 PetaData</a></li>
	  		  	</ul>
	  	
   			</div>
			<div class="y-left">
		  		<span>会员服务</span>
				<ul>
	  		  		<li><a href="">会员账号&amp;实名认证</a></li>
	  		  		<li><a href="">财务</a></li>
	  		  		<li><a href="">备案</a></li>
	  		  	</ul>
	  			<span>更多</span>
				<ul>
	  		  		<li><a href="">持续交付平台</a></li>
	  		  		<li><a href="">云市场</a></li>
	  		  	</ul>
    		</div>
	 </div>
 </div>
 	<span class="menu-title">云服务器 ECS </span>
	<ul>
        <li class="level1 open "><a href="javascript:void(0);" title="产品简介">产品简介<i class="up"></i></a>
        	<ul>
          		<li class="level2 action"><a href="" title="API文档">API列表</a></li>
            	<li class="level2 "><a href="javascript:void(0);" title="实例（Instance）">实例（Instance）<i class="up"></i></a>
				 	<ul>
						<li class="level3 "><a href="" title="概述">概述</a></li>
						<li class="level3 "><a href="" title="地域">地域</a></li>

         			</ul>
				</li> 
			</ul>
		</li>   
		<li class="level1 "><a href="" title="视频专区">视频专区</a></li> 
     </ul>
</div> -->
<div class="content"><?= $content; ?></div>
<?php $this->endContent();?>