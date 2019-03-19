// JavaScript Document
Horse.namespace('Pop').Widgets=function(options){
	this.settings={
		title: '', //标题
		linkd:'',  //链接
		appearTime: 15000, 
		delay: 4000, 

	};
	this.domRef = null;
	this.zr = options;
	this.showFun();

}
Horse.Pop.Widgets.prototype={
	showFun: function(){
		if(this.zr.length>0){
			jQuery.extend(this.settings, this.zr[0]);
			this.zr.shift();
			//console.log(this.settings);
			this.addInfo();
			this.showDiv();
			this.closeDiv();	
		}
		
	
	},
	addInfo: function(){
		var html='<div class="pop_msg" style="width: 260px; position: fixed; bottom: 0px; right: 0px; z-index: 1000; border: 1px solid #e0e0e0; background-color: #fff; display: none;">\
				  <div class="pop_title" style="background-color: #f6f0f3; height: 40px; text-align: left; line-height: 40px; font-size: 15px; color: #666; font-weight: bold; letter-spacing: 2px; padding-left: 10px; border-bottom: thin solid #e0e0e0; position: relative;">\
					 消息通知\
					 <div class="pop_close" class="info_close" style="position: absolute; right: 5px; top: 0px; color:#000; cursor:pointer; font-size: 12px;">\
						 关闭\
					 </div>\
				  </div>\
				  <div style="background-color: #fff; padding: 15px 15px 5px 15px; font-size: 13px; color: #333; position: relative;">\
					  <span class="pop_content" style="display: inline-block;  min-height: 70px;"></span>\
					  <p class="pop_more"style="width: 100%;border-top: 1px dotted #ccc;line-height: 24px;margin: 8px 0 0 0; text-align: right;"><a href=""  style="color: #f60; font-size: 13px; text-decoration: none;">查看 »</a></p>\
				  </div>\
			  </div>';	
		$("body").append(html);
		this.domRef = $('body').children().last();
		$(".pop_content",this.domRef).html(this.settings.title);
		$(".pop_more a",this.domRef).attr('href',this.settings.linkd);
	
	},
	showDiv: function(time){
		$(this.domRef).show();
		
	},
	closeDiv: function(){
		var context=this;
		var hide='';
		var closedialog = function(){
			hide = setInterval(function(){slideClose.apply(context)},20);

		};
		var slideClose=function(){
			var popH=$(this.domRef).height();
			popH=parseInt(popH);
			if(popH>=4)
			{
				$(this.domRef).height((popH-4)+'px');
			}
			else
			{
				clearInterval(hide);
				$(this.domRef).css('display','none');
				setTimeout(function(){
					if(context.zr.length>0){
						context.showFun();}},context.settings.delay);
			//	if(this.zr.length>0){context.showFun();}

			}

			
		} 
		setTimeout(function(){closedialog.apply(context);},this.settings.appearTime);

		$('.pop_close',this.romRef).on('click',function(){closedialog.apply(context);});

	},

}