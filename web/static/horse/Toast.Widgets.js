/**
 * @author zhangqian
 */

Horse.namespace('Toast').Widgets=function(options){
	this.settings={
	//	title: '', //标题
		content:'',		
		showTime: 6000, //显示的时间
		//type:'info', // 可选的类型：info, correct, error, warning
		width: '430px', //宽度
		isAutoHide: '1', //是否自动消失  可选： 0,1   0:自动消失  1：手动关闭
	};
	
	this.domRef = null;
	this.bg='bg';
	//将options合并到this.settings,后面的参数如果和前面的参数存在相同的名称，那么后面的会覆盖前面的参数值
	jQuery.extend(this.settings, options);
	this.alert();
	this.addInfo();
	this.showDiv();
	this.closeDiv();

};

Horse.Toast.Widgets.prototype={
	alert:function(){
//		var cssStyle='<style type="text/css">\
//		  	.info_title.warning{background: #ec4518; color: #fff;}\
//			.info_title.error{background: #F09B21; color: #fff;}\
//			.info_title.correct{background: #48AF08; color: #fff;}\
//			.info_title.info{background: #f6f0f3; color: #666;}\
//		  </style>';
	
	var dialogStyle='<div class="bg" style="position: fixed; top: 0px;left: 0px; z-index: 100; width: 100%; height: 100%; background-color: #666; opacity: 0.5; filter: progid:DXImageTransform.Microsoft.Alpha(opacity=50); display: none;"></div>\
			 <div class="toast_dialog_pop info_notice" style="position:absolute; z-index: 1000;  background-color: #fff;border-radius: 5px; display: none;">\
				<div class="info_title" style="height: 50px; text-align: left; line-height: 44px;  padding-left: 10px; border-bottom: thin solid #f5f5f5; border-top: 6px solid #3c8dbc;border-radius: 5px 5px 0 0; position: relative;">\
					<span class="toast_dialog_title" style="display: block; background: url(/static/img/tishi.png) no-repeat 0 center;padding-left: 35px; color:#3c8dbc;font-size: 18px; font-family:微软雅黑;">提示</span>\
					<div class="toast_dialog_close info_close" style="position: absolute; right: 5px; top: 0px; cursor:pointer; font-size: 12px"></div>\
				</div>\
				<div style="background-color: #fff; padding: 25px 15px 15px 15px; min-height: 100px; position: relative; border-bottom: 1px solid #f5f5f5;">\
					<span class="toast_dialog_content info_content" style="display: inline-block;  color:#888;line-height:20px; font-size: 13px;"></span>\
				</div>\
				<div class="toast_dialog_btn" style="padding: 25px 0; width: 80%; margin: 0 auto; ">\
					<input class="btn btn-primary confirm" type="button" value="确   认" style="width: 40%; margin-right: 18%;outline: none;"/>\
					<input class="btn cancel" type="button" value="取消" style="width: 40%; color:#fff; background-color:#ccc; outline: none;" />\
				</div>\
			</div>';	
	//$("body").append(cssStyle);
	
	$("body").append(dialogStyle);//将弹出框添加到html文件中
	},

	addInfo: function(){
		
			//标题样式
		//二维数组: 类型,标题
		//var _type=[['info','消息通知'],['error','错误提示'],['correct','通知'],['warning','警告']];
		     
		
		this.domRef = $('body').children().last();
                                                                                                                                                                
//		for(var i=0;i<_type.length;i++){
//			if(this.settings.type == _type[i][0]){
//						
//				$(".info_title", this.domRef).addClass(_type[i][0]);
//			}	
//		}
	
		//传入的title不为空时
		//if(this.settings.title!=''){
			
			//$(".toast_dialog_title", this.domRef).html(this.settings.title);
			
		//}
		//else{
//			//传入的title值为空时，根据类型显示不同的title
//			for(var i=0;i<_type.length;i++){
//				if(this.settings.type == _type[i][0]){
//										
//					$(".toast_dialog_title", this.domRef).html(_type[i][1]);
//				}	
//			}		

		//}
		
		$(".toast_dialog_content", this.domRef).html(this.settings.content);
		
		$(this.domRef).css('width',this.settings.width); 		

	},
	showDiv: function(){
			
		var elemLeft=($(window).width()-$(this.domRef).width())/2;
	
		var elemTop=($(window).height()-$(this.domRef).height())/3;
		//定义弹出框的位置
		$(this.domRef).css({'left':elemLeft,'top':elemTop});
	
		$(this.domRef).show();	
		//遮罩层显示
		$('.'+this.bg).show();
		
	},
	closeDiv: function(){
		var off = 0;
		var context = this;
		//点击关闭按钮
		var closedialog = function(){
			$(this.domRef).hide();
	//		$(this).parent().parent().hide();
			$('.'+this.bg).hide();
			
		};
		//弹出框自动消失
		if(this.settings.isAutoHide=='0'){
			off = setTimeout(function(){closedialog.apply(context);},this.settings.showTime);
		}
		
		//手动关闭
		$(".toast_dialog_close", this.domRef).on('click', function(){closedialog.apply(context);});
		$(".confirm", this.domRef).on('click', function(){closedialog.apply(context);});
		$(".cancel", this.domRef).on('click', function(){closedialog.apply(context);});
		
	},

};
