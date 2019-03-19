/**
 * @author zhangqian
 */

Horse.App=function(options){
	this.settings={
		'domPrefix':'horse-', // 窗口所依附DOM容器的ID
	};

};

Horse.App.prototype={
	openInfoWindow: function(infoWindow){
		var dialogStyle='\
			 <div id="' + this.settings.domPrefix + '-infoWindow" class="toast_dialog_pop info_notice" style="position:absolute; z-index: 1000;width: 430px;  background-color: #fff;border-radius: 5px; display: none;">\
				<div class="info_title" style="height: 50px; text-align: left; line-height: 44px;  padding-left: 10px; border-bottom: thin solid #f5f5f5; border-top: 6px solid #3c8dbc;border-radius: 5px 5px 0 0; position: relative;">\
					<span class="toast_dialog_title" style="display: block; background: url(/static/img/tishi.png) no-repeat 0 center;padding-left: 35px; color:#3c8dbc;font-size: 18px; font-family:微软雅黑;">提示</span>\
					<div class="toast_dialog_close info_close" style="position: absolute; right: 5px; top: 0px; cursor:pointer; font-size: 12px"></div>\
				</div>\
				<div style="background-color: #fff; padding: 25px 15px 15px 15px; min-height: 100px; position: relative; border-bottom: 1px solid #f5f5f5;">\
					<span class="toast_dialog_content info_content" style="display: inline-block;  color:#888;line-height:20px; font-size: 13px;">' + infoWindow.getContent() + '</span>\
				</div>\
				<div class="toast_dialog_btn" style="padding: 25px 0; width: 80%; margin: 0 auto; ">\
					<input class="btn btn-primary confirm" type="button" value="确   认" style="width: 40%; margin-right: 18%;outline: none;"/>\
					<input class="btn cancel" type="button" value="取消" style="width: 40%; color:#fff; background-color:#ccc; outline: none;" />\
				</div>\
			</div>';
		
		if($("#"+this.settings.domPrefix+"-infoWindow").length == 0)
		{
			$("body").append(dialogStyle);//将弹出框添加到html文件中
		}
		
		this.showShade();
		this.showDiv("#"+this.settings.domPrefix+"-infoWindow");
		this.clickDiv("#"+this.settings.domPrefix+"-infoWindow",".confirm");
		this.clickDiv("#"+this.settings.domPrefix+"-infoWindow",".cancel");
			
	},
	openSuccessWindow:function(){
		var dialogStyle='\
			<div id="' + this.settings.domPrefix + '-successWindow"  style="width: 340px; height: 210px; font-family:微软雅黑;position:absolute; z-index: 1000; background-color:rgba(255,255,255,0.8)">\
				<div class="icon" style="width: 100%;height: 150px;background: url(/static/img/success.png) no-repeat center"></div>\
				<div style="text-align: center; color:#000; font-size: 18px;">操作成功 ! (<span id="seconds">4</span>) </div>\
			</div>'
		if($("#"+this.settings.domPrefix+"-successWindow").length == 0)
		{
			$("body").append(dialogStyle);//将弹出框添加到html文件中
		}
		this.showDiv("#"+this.settings.domPrefix+"-successWindow");
		this.countDown("#"+this.settings.domPrefix+"-successWindow","#seconds");
		
	},
	openFailWindow:function(){
		var dialogStyle='\
			<div id="' + this.settings.domPrefix + '-failWindow"  style="width: 340px; height: 210px; font-family:微软雅黑;position:absolute; z-index: 1000; background-color:rgba(255,255,255,0.8)">\
				<div class="icon" style="width: 100%;height: 150px;background: url(/static/img/fail.png) no-repeat center"></div>\
				<div style="text-align: center; color:#000; font-size: 18px;">操作失败 ! (<span id="seconds">4</span>) </div>\
			</div>'
		if($("#"+this.settings.domPrefix+"-failWindow").length == 0)
		{
			$("body").append(dialogStyle);//将弹出框添加到html文件中
		}
		this.showDiv("#"+this.settings.domPrefix+"-failWindow");
		this.countDown("#"+this.settings.domPrefix+"-failWindow","#seconds");
		
	},
	showShade: function(){
		//遮罩层显示
		var html = '<div id="' + this.settings.domPrefix + '-shade" class="bg" style="position: fixed; top: 0px;left: 0px; z-index: 100; width: 100%; height: 100%; background-color: #666; opacity: 0.5; filter: progid:DXImageTransform.Microsoft.Alpha(opacity=50); display: none;"></div>';
		if($("#"+this.settings.windowSeatDomId).length == 0)
		{
			$("body").append(html);//将弹出框添加到html文件中
		}
		$('#'+this.settings.domPrefix + '-shade').show();
		
	},
	
	closeShade: function(){
		$('#'+this.settings.domPrefix + '-shade').hide();
	},
	
	showDiv: function(selector){
		
		var elemLeft=($(window).width()-$(selector).width())/2;
	
		var elemTop=($(window).height()-$(selector).height())/3;
		//定义弹出框的位置
		$(selector).css({'left':elemLeft,'top':elemTop});
	
		$(selector).show();	

		
	},
	clickDiv:function(selector,child){
		var context=this;
		$(selector).find(child).on('click', function(){context.closeDiv(selector);});
		
	},
	closeDiv: function(selector){
		$(selector).hide();	
		this.closeShade();
	},
	//倒计时
	countDown:function(selector,child){
		var context=this;
		var s=$(selector).find(child).text();
		
		if(s==1){
			this.closeDiv(selector);
			this.closeDiv(selector);
		}
		else{
			s=parseInt(s);
			s--;
			$(selector).find(child).text(s)
			setTimeout(function() { 
				context.countDown(selector,child)}
				,1000);
		}
	
		
	}
	
};
