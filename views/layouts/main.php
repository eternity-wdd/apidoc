<?php
/* @var $this yii\web\View */

use common\helpers\MenuHelper;
use yii\helpers\Url;
use app\assets\AppAsset;
use yii\helpers\Html;
use yii\widgets\Breadcrumbs;
use yii\bootstrap\Alert;
use app\assets\AdminLTEAsset;
use app\models\ApiModule;
use app\models\ApiMenus;

$menuData = ApiMenus::getMenuTree(1);
AppAsset::register($this);
?>
<?php $this->beginPage() ?>
    <!DOCTYPE html>
    <!--
    This is a starter template page. Use this page to start your new project from
    scratch. This page gets rid of all links and provides the needed markup only.
    -->
    <html>
    <head>
        <meta charset="UTF-8">
        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="format-detection"content="telephone=no, email=no" />
        <!-- 忽略页面中的数字识别为电话，忽略email识别-->
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <!-- 删除苹果默认的工具栏和菜单栏 -->
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <!-- 设置苹果工具栏颜色 -->
        <meta name="format-detection" content="telphone=no, email=no" />
        <!-- 启用360浏览器的极速模式(webkit) -->
        <meta name="renderer" content="webkit">
        <!-- 避免IE使用兼容模式 -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- 针对手持设备优化，主要是针对一些老的不识别viewport的浏览器，比如黑莓 -->
        <meta name="HandheldFriendly" content="true">
        <!-- 微软的老式浏览器 -->
        <meta name="MobileOptimized" content="320">
        <!-- uc强制竖屏 -->
        <meta name="screen-orientation" content="portrait">
        <!-- QQ强制竖屏 -->
        <meta name="x5-orientation" content="portrait">
        <!-- UC强制全屏 -->
        <meta name="full-screen" content="yes">
        <!-- QQ强制全屏 -->
        <meta name="x5-fullscreen" content="true">
        <!-- UC应用模式 -->
        <meta name="browsermode" content="application">
        <!-- QQ应用模式 -->
        <meta name="x5-page-mode" content="app">
        <!-- windows phone 点击无高光 -->
        <meta name="msapplication-tap-highlight" content="no">
        <!-- 适应移动端end -->
        <!-- Bootstrap 3.3.4 -->
        <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="/static/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome Icons -->
        <link href="/static/plugins/font-awesome/css/font-awesome.min.css?v=2" rel="stylesheet" type="text/css" />
        <!--
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
         -->
        <!-- Ionicons -->
        <!--
        <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
         -->
        <!-- Theme style -->
        <link href="/static/css/AdminLTE.css?v=1" rel="stylesheet" type="text/css" />
        <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
              page. However, you can choose any other skin. Make sure you
              apply the skin class to the body tag so the changes take effect.
        -->
        <link href="/static/css/skins/skin-blue.min.css" rel="stylesheet" type="text/css" />
        <!-- iCheck plugin Flat skin -->
        <link href="/static/plugins/iCheck/flat/_all.css" rel="stylesheet" type="text/css" />
        <link href="/static/css/app.css?v=2" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="/static/jquery-ui/jquery-ui.css" />
        <link href="/static/css/dropdown.css?1" rel="stylesheet" type="text/css" />
        <link href="/static/css/messageCenter.css?1" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <!--
    BODY TAG OPTIONS:
    =================
    Apply one or more of the following classes to get the
    desired effect
    |---------------------------------------------------------|
    | SKINS         | skin-blue                               |
    |               | skin-black                              |
    |               | skin-purple                             |
    |               | skin-yellow                             |
    |               | skin-red                                |
    |               | skin-green                              |
    |---------------------------------------------------------|
    |LAYOUT OPTIONS | fixed                                   |
    |               | layout-boxed                            |
    |               | layout-top-nav                          |
    |               | sidebar-collapse                        |
    |               | sidebar-mini                            |
    |---------------------------------------------------------|
    -->
    <body class="skin-blue sidebar-mini">
    <div class="wrapper">

        <!-- Main Header -->
        <header class="main-header">

            <!-- Logo -->
            <a href="index2.html" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini">京蓝科技</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg">京蓝科技API</span>
            </a>

            <!-- Header Navbar -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">
                            <!-- Menu toggle button -->
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope-o"></i>
                                <span class="label label-success">0</span>
                            </a>
                            <ul class="dropdown-menu" style="display:none;">
                                <li class="header">You have 0 messages</li>
                                <li>
                                    <!-- inner menu: contains the messages -->
                                    <ul class="menu">
                                        <li><!-- start message -->
                                            <a href="#">
                                                <div class="pull-left">
                                                    <!-- User Image -->

                                                    <img src="<?php !empty(Yii::$app->user->identity->portrait)?Yii::$app->user->identity->portrait:Yii::$app->params['portrait_default']?>" class="img-circle" alt="User Image"/>
                                                </div>
                                                <!-- Message title and timestamp -->
                                                <h4>
                                                    Support Team
                                                    <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                </h4>
                                                <!-- The message -->
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li><!-- end message -->
                                    </ul><!-- /.menu -->
                                </li>
                                <li class="footer"><a href="#">See All Messages</a></li>
                            </ul>
                        </li><!-- /.messages-menu -->

                        <!-- Notifications Menu -->
                        <li class="dropdown notifications-menu">
                            <!-- Menu toggle button -->
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-bell-o"></i>
                                <span class="label label-warning">0</span>
                            </a>
                            <ul class="dropdown-menu" style="display:none;">
                                <li class="header">You have 0 notifications</li>
                                <li>
                                    <!-- Inner Menu: contains the notifications -->
                                    <ul class="menu">
                                        <li><!-- start notification -->
                                            <a href="#">
                                                <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                            </a>
                                        </li><!-- end notification -->
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">View all</a></li>
                            </ul>
                        </li>
                        <!-- Tasks Menu -->
                        <li class="dropdown tasks-menu">
                            <!-- Menu Toggle Button -->
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-flag-o"></i>
                                <span class="label label-danger">0</span>
                            </a>
                            <ul class="dropdown-menu" style="display:none;">
                                <li class="header">You have 0 tasks</li>
                                <li>
                                    <!-- Inner menu: contains the tasks -->
                                    <ul class="menu">
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <!-- Task title and progress text -->
                                                <h3>
                                                    Design some buttons
                                                    <small class="pull-right">20%</small>
                                                </h3>
                                                <!-- The progress bar -->
                                                <div class="progress xs">
                                                    <!-- Change the css width attribute to simulate progress -->
                                                    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="#">View all tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account Menu -->
                        <li class="dropdown user user-menu">
                            <!-- Menu Toggle Button -->
                            <a style='width: 65px;height:50px'  href="/manage/default/userout"  class="dropdown-toggle" data-toggle="dropdown" onclick="return confirm('确认退出吗？')">
                                <!-- The user image in the navbar-->
                                <img src="<?php echo !empty(Yii::$app->user->identity->portrait)?Yii::$app->user->identity->portrait:Yii::$app->params['portrait_default']?>" class="user-image" alt="User Image"/>
                                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                <span class="hidden-xs"><?php /* echo CompanyIdentity::getName(); */?></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- The user image in the menu -->
                                <li class="user-header">
                                    <img src="/static/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                                    <p>

                                        <?php echo !empty(Yii::$app->user->identity->username)?Yii::$app->user->identity->username:''; ?>
                                        <small><!-- Member since Nov. 2012 --></small>
                                    </p>
                                </li>
                                <!-- Menu Body -->
                                <!--
                                <li class="user-body">
                                  <div class="col-xs-4 text-center">
                                    <a href="#">Followers</a>
                                  </div>
                                  <div class="col-xs-4 text-center">
                                    <a href="#">Sales</a>
                                  </div>
                                  <div class="col-xs-4 text-center">
                                    <a href="#">Friends</a>
                                  </div>
                                </li>
                                 -->
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <!-- <a href="<?php echo Url::to('/company/info')?>" class="btn btn-default btn-flat">个人资料</a> -->
                                    </div>
                                    <div class="pull-right">
                                        <a href="<?php /* echo Url::to(Yii::$app->user->logoutUrl) */?>" class="btn btn-default btn-flat">退出</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!-- Control Sidebar Toggle Button -->
                        <li>
                            <!-- <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a> -->
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">

            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">

                <!-- Sidebar user panel (optional) -->
                <div class="user-panel">
                    <div class="pull-left image">
                         <img src="<?php echo !empty(Yii::$app->user->identity->portrait)?Yii::$app->user->identity->portrait:Yii::$app->params['portrait_default']?>" class="img-circle" alt="User Image" />
                    </div>
                    <div class="pull-left info">
                        <p style="font-size: 18px;margin-left: 15px"><?= Yii::$app->user->identity->username?></p>
                        <!-- Status -->
                         <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                    </div>
                </div>

                <!-- search form (Optional) -->
                <form action="#" method="get" class="sidebar-form" style="display: none">
                    <div class="input-group">
                        <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
                    </div>
                </form>
                <!-- /.search form -->

                <!-- Sidebar Menu -->
                
                <ul class="sidebar-menu">
                    <li>
                        <a href="<?=Url::toRoute(['/manage/default/index'])?>">
                            <i class="fa fa-paper-plane"></i> <span>主面板</span>
                        </a>
                    </li>
				<?php
                    $i = 0;
                    if($menuData):
                        foreach($menuData as $key => $val):
                            $j = 0;
                          //  var_dump(!\Yii::$app->user->can($val['url']));exit;
                            /* if(\Yii::$app->user->id!=1&&!\Yii::$app->user->can(substr($val['url'],1))&&!\Yii::$app->user->can('总管理员')&&$val['url']!='#'){
                                continue;
                            } */
                            ?>
                            <li class="treeview">
                                <a href="<?= Url::to($val['url']);?>">
                                    <i class="<?php echo $val['icon_class']?>"></i> <span><?php echo $val['name'];?></span> <?php if(isset($val['children'])):?><i class="fa fa-angle-left pull-right"></i><?php endif; ?>
                                </a>
                                <?php if(isset($val['children'])):?>
                                    <ul class="treeview-menu">
                                        <?php foreach($val['children'] as $k => $rs):
                                            if(Yii::$app->user->id!=1&&!Yii::$app->user->can(substr($rs['url'],1))&&!\Yii::$app->user->can('总管理员')){
                                                continue;
                                            }?>
                                            <li id="<?php echo 'menuitem-'.$i.'-'.$j;?>" class=""><a href="<?php echo $rs['url'];?>"><?php if ($rs['icon']){?><i class="<?php echo $rs['icon'];?>"></i><?php }else{?><i class="fa fa-circle-o"></i> <?php } echo $rs['name'];?></a></li>
                                            <?php
                                            $j++;
                                        endforeach;
                                        ?>
                                    </ul>
                                <?php endif;?>
                            </li>
                            <?php
                            $i++;
                        endforeach;
                    endif;
                    ?>		

                </ul>
                <!-- /.sidebar-menu -->
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <!-- 添加 class  viewFramework-product-col-1，显示三级菜单 -->
        <div class="content-wrapper viewFramework-product viewFramework-product-col-1">
            <?php if(isset($this->menus)):?>
            <div class="viewFramework-product-navbar ng-scope">
                <div class="product-nav-stage ng-scope product-nav-stage-main">
                    <div class="product-nav-scene product-nav-main-scene">

                        <div class="product-nav-title ng-binding" id="nav-title" ng-bind="config.title"><?= $this->title;?></div>

                        <div class="product-nav-list sidebar">
                            <ul class="sidebar-menu">
                                <?php
                                foreach ($this->menus as $key=>$menu):
                                    ?>
                                    <?php if(isset($menu['children'])):?>
                                    <li class=" treeview">
                                        <a href="#">
                                            <i class="fa fa-angle-right nav-icon"></i>
                                            <div class="nav-title"><?= $key?></div>
                                            <div class="nav-extend">
             							<span class="ng-isolate-scope">
             								<span class="total-unread-count ng-scope ng-binding"><?= isset($menu['tip']) ? $menu['tip']:''?></span>
             							</span>
                                            </div>
                                        </a>
                                        <ul class="treeview-menu ">
                                            <?php foreach ($menu['children'] as $ckey=>$child):?>
                                                <li>
                                                    <div class="ng-isolate-scope">
                                                        <a href="" class="ng-scope">
                                                            <div class="nav-icon"></div>
                                                            <div class="nav-title ng-binding"><?= $ckey?></div>
                                                            <?php if(isset($child['tip'])):?>
                                                                <div class="nav-extend">
             										<span class="ng-isolate-scope">
             											<span class="total-unread-count ng-scope ng-binding"><?= $child['tip']?></span>
             										</span>
                                                                </div>
                                                            <?php endif;?>
                                                        </a>
                                                    </div>
                                                </li>
                                            <?php endforeach;?>
                                        </ul>
                                    </li>
                                <?php else:?>
                                    <li>
                                        <div class="ng-isolate-scope">
                                            <a href="" class="ng-scope">
                                                <div class="nav-icon"></div>
                                                <div class="nav-title ng-binding"><?= $key?></div>
                                                <?php if(isset($menu['tip'])):?>
                                                    <div class="nav-extend">
             										<span class="ng-isolate-scope">
             											<span class="total-unread-count ng-scope ng-binding"><?= $menu['tip']?></span>
             										</span>
                                                    </div>
                                                <?php endif;?>
                                            </a>
                                        </div>
                                    </li>
                                <?php endif;?>
                                <?php endforeach;?>
                            </ul>
                        </div>

                    </div>

                </div>
            </div>
            <div class="viewFramework-product-navbar-collapse ng-scope">
                <div class="product-navbar-collapse-inner">
                    <div class="product-navbar-collapse-bg"></div>
                    <div class="product-navbar-collapse ">
                        <span class="fa fa-outdent" ></span>
                        <span class="fa fa-indent"></span>
                    </div>
                </div>

            </div>
            <!-- Content Header (Page header) -->
            <div class="viewFramework-product-body">
                <section class="content-header">
                    <h1>
                        <?php echo $this->title;?>
                    </h1>
                </section>
                <script type="text/javascript">
                    $("body").addClass("sidebar-collapse");
                </script>
                <?php endif;?>
                <!-- Main content -->
                <section class="content" style="overflow: visible;">
                    <?= Breadcrumbs::widget([
                        'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                    ]) ?>
                    <?php echo $content;?>

                </section><!-- /.content -->
            </div>
        </div><!-- /.content-wrapper -->

        <!-- Main Footer -->
        <footer class="main-footer">
            <!-- To the right -->
            <div class="pull-right hidden-xs">
                <!-- Anything you want -->
            </div>
            <!-- Default to the left -->
            <strong>Copyright &copy; 2015 <a href="#">京蓝科技</a>.</strong> All rights reserved.
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Create the tabs -->
            <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <!-- Home tab content -->
                <div class="tab-pane active" id="control-sidebar-home-tab">
                    <h3 class="control-sidebar-heading">Recent Activity</h3>
                    <ul class='control-sidebar-menu'>
                        <li>
                            <a href='javascript::;'>
                                <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                                    <p>Will be 23 on April 24th</p>
                                </div>
                            </a>
                        </li>
                    </ul><!-- /.control-sidebar-menu -->

                    <h3 class="control-sidebar-heading">Tasks Progress</h3>
                    <ul class='control-sidebar-menu'>
                        <li>
                            <a href='javascript::;'>
                                <h4 class="control-sidebar-subheading">
                                    Custom Template Design
                                    <span class="label label-danger pull-right">70%</span>
                                </h4>
                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                </div>
                            </a>
                        </li>
                    </ul><!-- /.control-sidebar-menu -->

                </div><!-- /.tab-pane -->
                <!-- Stats tab content -->
                <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div><!-- /.tab-pane -->
                <!-- Settings tab content -->
                <div class="tab-pane" id="control-sidebar-settings-tab">
                    <form method="post">
                        <h3 class="control-sidebar-heading">General Settings</h3>
                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Report panel usage
                                <input type="checkbox" class="pull-right" checked />
                            </label>
                            <p>
                                Some information about this general settings option
                            </p>
                        </div><!-- /.form-group -->
                    </form>
                </div><!-- /.tab-pane -->
            </div>
        </aside><!-- /.control-sidebar -->
        <!-- Add the sidebar's background. This div must be placed
             immediately after the control sidebar -->
        <div class='control-sidebar-bg'></div>
        <!--foot end-->
        <div id="dialog"></div>
        <div id="dialog-message"><div class="message-content"></div></div>
        <div id="dialog-model"></div>
        <div id="loading-state" class="row" style="display:none;">
            <div class="col-md-12">
                <div class="box box-danger box-solid">
                    <div class="box-header">
                        <h3 class="box-title">加载进度</h3>
                    </div>
                    <div class="box-body">正在努力加载中...</div><!-- /.box-body -->
                    <!-- Loading (remove the following to stop the loading)-->
                    <div class="overlay">
                        <i class="fa fa-refresh fa-spin"></i>
                    </div>
                    <!-- end loading -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div>
    </div><!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->

    <!-- Optionally, you can add Slimscroll and FastClick plugins.
          Both of these plugins are recommended to enhance the
          user experience. Slimscroll is required when using the
          fixed layout. -->

    <script type="text/javascript">
        function logout(){
            if(confirm('确定注销吗？')){
                $.post('/site/logout')
            }
        }
        function selectMenu(i, j)
        {
            jQuery("#menuitem-"+i+"-"+j).parent().parent().addClass("active");
        }

        /**
         * @param type 'warning'、'success'、'primary'
         */
        function initConfirmDialog()
        {

            $.each($(".dialog-confirm"), function(i, n){
                $(n).attr("data-confirm-url", $(n).attr("href"));
                $(n).attr("href", "javascript:void(0);");
            });

            $("body .dialog-confirm").on('click', function(){
                var url = $(this).attr("data-confirm-url");
                var isAjax = $(this).attr("data-confirm-ajax");
                var callback = $(this).attr("data-confirm-callback");

                $( "#dialog-model" ).html($(this).attr("data-confirm-info"));
                $( "#dialog-model" ).dialog({
                    resizable: false,
                    height:'auto',
                    width:400,
                    modal: true,
                    buttons: {
                        "确认": function() {
                            if(isAjax == "true")
                            {
                                showLoading();
                                $.ajax({ 'url': url, 'context': document.body, 'dataType': "json", 'success': function(data){
                                    if(data.result == 1)
                                    {
                                        if(callback)
                                        {
                                            eval(callback+"()");
                                        }
                                    }
                                    hideLoading();
                                }});
                            }
                            else
                            {
                                window.location.href = url;
                            }
                            $( this ).dialog( "close" );
                        },
                        "取消": function() {
                            $( this ).dialog( "close" );
                        }
                    }
                });
            });
        }
        <?= $this->registerJs('initConfirmDialog();');?>
    </script>
    <?php $this->endBody() ?>
    </body>
    </html>
<?php $this->endPage() ?>