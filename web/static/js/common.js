/*js弹出框提示信息
content 提示内容
title 标题
*/
function dialog_notice(content,title)
{
	var title = title ? title : '消息通知';	
	var html='<div class="bg" style="position: fixed; top: 0px;left: 0px; z-index: 100; width: 100%; height: 100%; background-color: #666; opacity: 0.3; filter: progid:DXImageTransform.Microsoft.Alpha(opacity=30);"></div>'+
			'<div class="example-modal" style="position: absolute; z-index: 110;">'+
				'<div class="modal modal-primary">'+
					'<div class="modal-dialog">'+
						'<div class="modal-content">'+
							'<div class="modal-header">'+
								'<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>'+
									' <h4 class="modal-title">'+title+'</h4>'+
								'</div>'+
								'<div class="modal-body">'+
									'<p>'+content+'</p>'+
								'</div>'+
								'<div class="modal-footer">'+
									'<button type="button" class="btn btn-outline pull-left" style="display:none;" data-dismiss="modal">Close</button>'+
									'<button type="button" class="btn btn-outline confirm">确定</button>'+
								' </div>'+
							'</div>'+
						'</div>'+
					'</div>'+
				'</div>';
		//将弹框添加到页面中
		$(".content-wrapper").append(html);	
		//给弹框定位
		var ww=$(window).width();
		var wh=$(window).height();
		var dialogw=$(".example-modal").width();
		var dialogh=$(".example-modal").height();
		ww=parseInt(ww);
		wh=parseInt(wh);
		dialogw=parseInt(dialogw);
		dialogh=parseInt(dialogh);
		$(".example-modal").css({'left':(ww-dialogw)/2,'top':(wh-dialogh)/3});
		//点击关闭按钮与确定按钮
		$(".example-modal").find(".close").bind('click',dialogClose);
		$(".example-modal").find(".confirm").bind('click',dialogClose);
		function dialogClose(){
			$(".example-modal").hide();
			$(".example-modal").siblings(".bg").hide();	
		}									
}

//带链接的弹框
/**
 * @param options {
	 	title: '标题',
	 	content: '提示内容',
		link: '跳转地址',
		// newTarget: boolean 是否新页面打开
	 }
 */
function dialog_jump(options)
{
	var title = options.title ? options.title : '消息通知';	
	var html='<div class="bg" style="position: fixed; top: 0px;left: 0px; z-index: 100; width: 100%; height: 100%; background-color: #666; opacity: 0.3; filter: progid:DXImageTransform.Microsoft.Alpha(opacity=30);"></div>'+
			'<div class="example-modal" style="position: absolute; z-index: 110;">'+
				'<div class="modal modal-warning">'+
					'<div class="modal-dialog">'+
						'<div class="modal-content">'+
							'<div class="modal-header">'+
								'<a class="close" href='+options.link+' data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></a>'+
									' <h4 class="modal-title">'+options.title+'</h4>'+
								'</div>'+
								'<div class="modal-body">'+
									'<p>'+options.content+'</p>'+
								'</div>'+
								'<div class="modal-footer">'+
									'<button type="button" class="btn btn-outline pull-left" style="display:none;" data-dismiss="modal">Close</button>'+
									'<a class="btn btn-outline confirm" href='+options.link+'>确定</a>'+
								' </div>'+
							'</div>'+
						'</div>'+
					'</div>'+
				'</div>';
		//将弹框添加到页面中
		$(".content-wrapper").append(html);	
		//给弹框定位
		var ww=$(window).width();
		var wh=$(window).height();
		var dialogw=$(".example-modal").width();
		var dialogh=$(".example-modal").height();
		ww=parseInt(ww);
		wh=parseInt(wh);
		dialogw=parseInt(dialogw);
		dialogh=parseInt(dialogh);
		$(".example-modal").css({'left':(ww-dialogw)/2,'top':(wh-dialogh)/3});
		//点击关闭按钮与确定按钮
		$(".example-modal").find(".close").bind('click',dialogClose);
		$(".example-modal").find(".confirm").bind('click',dialogClose);
		function dialogClose(){
			$(".example-modal").hide();
			$(".example-modal").siblings(".bg").hide();	
			//$(".example-modal").find(".close").attr("href",dlink);
			//$(".example-modal").find(".confirm").attr("href",dlink);
		}									
}
/*
右下角消息通知显示

*/

//var html='<div id="popInfo" class="info_notice" style="width: 260px; position: fixed; bottom: 0px; right: 0px; z-index: 1000; border: 1px solid #e0e0e0; background-color: #fff; display: none;">\
//	<div class="info_title" style="background-color: #f6f0f3; height: 40px; text-align: left; line-height: 40px; font-size: 15px; color: #666; font-weight: bold; letter-spacing: 2px; padding-left: 10px; border-bottom: thin solid #e0e0e0; position: relative;">\
//		消息通知\
//		<div id="popClose" class="info_close" style="position: absolute; right: 5px; top: 0px; color:#000; cursor:pointer; font-size: 12px;">\
//			关闭\
//		</div>\
//	</div>\
//	<div style="background-color: #fff; padding: 15px 15px 5px 15px; font-size: 13px; color: #333; position: relative;">\
//		<span id="popIntro" class="info_content" style="display: inline-block;  min-height: 70px;">未读消息</span>\
//		<p id="popMore" class="info_more" style="width: 100%;border-top: 1px dotted #ccc;line-height: 24px;margin: 8px 0 0 0; text-align: right;"><a href=""  style="color: #f60; font-size: 13px; text-decoration: none;">查看 »</a></p>\
//	</div>\
//</div>';	
//	$("body").append(html);
//	(function($j)
//	{
//		$j.positionFixed = function(el)
//		{
//			$j(el).each(function()
//			{
//				new fixed(this)
//			})
//			return el;                  
//		}
//		$j.fn.positionFixed = function()
//		{
//			return $j.positionFixed(this)
//		}
//		var fixed = $j.positionFixed.impl = function(el)
//		{
//			var o=this;
//			o.sts={
//				target : $j(el).css('position','fixed'),
//				container : $j(window)
//			}
//			o.sts.currentCss = {
//				top : o.sts.target.css('top'),              
//				right : o.sts.target.css('right'),              
//				bottom : o.sts.target.css('bottom'),                
//				left : o.sts.target.css('left')             
//			}
//			if(!o.ie6)return;
//			o.bindEvent();
//		}
//		$j.extend(fixed.prototype,{
//			ie6 : $.browser.msie && $.browser.version < 7.0,
//			bindEvent : function(){
//				var o=this;
//				o.sts.target.css('position','absolute')
//				o.overRelative().initBasePos();
//				o.sts.target.css(o.sts.basePos)
//				o.sts.container.scroll(o.scrollEvent()).resize(o.resizeEvent());
//				o.setPos();
//			},
//			overRelative : function(){
//				var o=this;
//				var relative = o.sts.target.parents().filter(function(){
//					if($j(this).css('position')=='relative')return this;
//				})
//				if(relative.size()>0)relative.after(o.sts.target)
//				return o;
//			},
//			initBasePos : function(){
//				var o=this;
//				o.sts.basePos = {
//					top: o.sts.target.offset().top - (o.sts.currentCss.top=='auto'?o.sts.container.scrollTop():0),
//					left: o.sts.target.offset().left - (o.sts.currentCss.left=='auto'?o.sts.container.scrollLeft():0)
//				}
//				return o;
//			},
//			setPos : function(){
//				var o=this;
//				o.sts.target.css({
//					top: o.sts.container.scrollTop() + o.sts.basePos.top,
//					left: o.sts.container.scrollLeft() + o.sts.basePos.left
//				})
//			},
//			scrollEvent : function(){
//				var o=this;
//				return function(){
//					o.setPos();
//				}
//			},
//			resizeEvent : function(){
//				var o=this;
//				return function(){
//					setTimeout(function(){
//						o.sts.target.css(o.sts.currentCss)      
//						o.initBasePos();
//						o.setPos()
//					},1)    
//				}           
//			}
//		})
//	})(jQuery)
//
//jQuery(function($j){
//	$j('#footer').positionFixed()
//})

/*pop右下角弹窗函数
url:查看的链接
intro: 消息通知内容

*/

/*
function Pop(url,intro)
{
	//this.title=title;
	this.url=url;
	this.intro=intro;
	this.apearTime=1000;
	this.hideTime=500;
	this.delay=15000;
	//添加信息
	this.addInfo();
	//显示
	this.showDiv();
	//关闭
    this.closeDiv();
}
Pop.prototype=
{
  addInfo:function()
  {
   // $("#popTitle a").attr('href',this.url).html(this.title);
    $("#popIntro").html(this.intro);
    $("#popMore a").attr('href',this.url);
  },
  showDiv:function(time)
  {
	if (!($.browser.msie && ($.browser.version == "6.0") && !$.support.style))
	 {
      $('#popInfo').slideDown(this.apearTime).delay(this.delay).fadeOut(400);;
    } 
	else
	{//调用jquery.fixed.js,解决ie6不能用fixed
      $('#popInfo').show();
			jQuery(function($j)
			{
			    $j('#popInfo').positionFixed()
			})
    }
  },
  closeDiv:function()
  {
  	$("#popClose").click(function()
	{
  		  //$('#pop').hide();	
		hide=setInterval("infoHide()",20);
  	});
  }
}

function infoHide()
{
	var popH=$("#popInfo").height();
	popH=parseInt(popH);
	if(popH>=4)
	{
		$("#popInfo").height((popH-4)+'px');
	}
	else
	{
		clearInterval(hide);
		$("#popInfo").css('display','none');
	}
}*/
jQuery(function(){
	var url = window.location.pathname;
	var num = url.indexOf('/agent');
	var root = url.indexOf('/platform');
	var index = url.indexOf('/platform/agent');
	if(num>=0&&index<0){
		//alert('这是代理商');
	$.getJSON("/agent/popnews/news", function(data){
        if(data)
        {
        	var title = data.title;
        	var content = data.content;
        	var id = data.id;
        	var type = data.type;
        	if(type==1){
        	
        		//var pop=new Pop("/agent/popnews/list?id="+id,title);
        		 new Horse.Pop.Widgets([{'linkd':'/agent//popnews/list?id='+id,'title':title}]);
        	}
        }
  });
	}else if(root>=0||index>=0){
		//alert('这是平台');
		$.getJSON("/platform/popnews/news", function(data){
	        if(data)
	        {
	        	var title = data[0].title;
	        	var content = data[0].content;
	        	var id = data[0].id;
	        	var type = data.type;
	        	/*if(type==0){
	        		alert(type);
	            var pop=new Pop("/platform/popnews/list?id="+id,title);
	        	}*/
	        }
	  });
	}else{
		//alert('这是供应商');
		$.getJSON("/popnews/news", function(data){
	        if(data)
	        {
	        	var title = data.title;
	        	var content = data.content;
	        	var id = data.id;
	        	var type = data.type;
	        	if(type==0){
	        		
	           // var pop=new Pop("/popnews/list?id="+id,title);
			   new Horse.Pop.Widgets([{'linkd':'/popnews/list?id='+id,'title':title}]);

	        	}
	        }
	  });
	}
})
 
    
/**
 * @brief js确认框
 * @param object or string param js对象或者弹出框提示信息的字符串
 * @author nswe
 */
function comfirmDialog(param)
{
	var msg = param ? param : '确定要执行么？';
	return window.confirm(msg);
}

/**
 * @brief swfupload返回函数
 * @author relay
 */
function swfupload_callback(name,id,oldname)
{
	var image_default = $('#Goods_image_default').val();//焦点id
	var className = '';//焦点class
	var hide = ''; // 非默认图片隐藏图标
	if(image_default=='')
	{
		$('#Goods_image_default').val(id);
		$('#Goods_focus_id').val(id);
		className = 'current';
	}
	else
	{
		hide = ' hide';
	}
	var html = '<span class="pic" id="s'+id+'">';
		html += '<span class="default_img_flag'+hide+'">√</span>';
		html += '<img name="img_name" id="i'+id+'" class="'+className+'" onclick="focusImg('+id+',this);" style="margin: 5px; opacity:1" src="'+name+'?'+(new Date()).getTime()+'" width="50px" height="50px"/><br />'
		html += '<a href="javascript:;" style="padding-right:1em" onclick="showLink('+id+');">链接</a>';
		html += '<a href="javascript:;" onclick="delImg('+id+');">删除</a></span>';
	$("#thumbnails_1").append(html);

	var img_list = $('#Goods_img_list').val();//图片列表id
	$('#Goods_img_list').val(img_list+','+id);
	//alert($('#Goods_img_list').val());
}

/**
 * @brief 上传商品图片，获得焦点函数
 * @author relay
 */
function focusImg(id,obj)
{
	$('#Goods_focus_id').val(id);
	$("img[name='img_name']").removeClass('current');
	obj.className = 'current';
}

/**
 * @brief 删除商品图片
 * @author relay
 */
function delImg(id)
{
   
	//删除img_list中的id
	var img_list =  $('#Goods_img_list').val() + ',';
	if(img_list && img_list.substring(0,1) != ',') 
	{
		img_list = ',' + img_list; 
	}
	img_list = img_list.replace(','+id+',',',');
	var img = img_list.substring(1, img_list.length);
	
	var className = $('#i'+id).attr('class');
	//删除图片span
	$('#s'+id).remove();
	
	if(img!='')
	{
		$('#Goods_img_list').val(img_list.substring(0,img_list.length-1));
		//如果删除的是焦点图片，则默认第一个为焦点
		if(className=='current')
		{
			var arr = img.split(',');
			$('#Goods_focus_id').val(arr[0]);
			$('#i'+arr[0]).addClass('current');
			$("#s"+arr[0]+" .default_img_flag").removeClass("hide");
			$('#Goods_image_default').val(arr[0]);
			setDefaultImage();
		}
	}
	else
	{
		
		$('#Goods_focus_id').val('');
		$('#Goods_img_list').val('');
		$('#Goods_image_default').val('');
	}

	
	
	$.getJSON("/goods/delimg", { id: id }, function(response){
        if(response.status != const_response.SUCCESS_STATUS)
        {
            //alert("操作失败");
        }
  });
}

jQuery(function(){
	//高度自适应
	initLayout();
	$(window).resize(function(){
		initLayout();
	});
	function initLayout() {
		var h1 = document.documentElement.clientHeight - $("#header").outerHeight(true);
		var h2 = h1-$("#footer").outerHeight(true);
		$('#mainContent .menu').height(h1);
		$('#mainContent .main').height(h2);
	}
	$(".viewFramework-product-navbar-collapse .fa-outdent").click(function(){
		$(".viewFramework-product-navbar").addClass('hide');
		$(".viewFramework-product").removeClass('viewFramework-product-col-1');
		$(this).hide().next().show();
	})
	$(".viewFramework-product-navbar-collapse .fa-indent").click(function(){
		$(".viewFramework-product-navbar").removeClass('hide');
		$(".viewFramework-product").addClass('viewFramework-product-col-1');
		$(this).hide().prev().show();
	})
})

/**
 * @brief 删除商品图片
 * @author relay
 */
function checkAll(e, itemName)
{
  var aa = document.getElementsByName(itemName);
  for (var i=0; i<aa.length; i++)
   aa[i].checked = e.checked;
}
function checkItem(e, allName)
{
  var all = document.getElementsByName(allName)[0];
  if(!e.checked) all.checked = false;
  else
  {
    var aa = document.getElementsByName(e.name);
    for (var i=0; i<aa.length; i++)
     if(!aa[i].checked) return;
    all.checked = true;
  }
}

function message(code, msg, title)
{
	var dtitle = "消息";
	var addClass = "";
	switch(code)
	{
		case 'warn':
			dtitle = "警告";
			addClass = "message-warn";
			break;
		case 'error':
			dtitle = "错误";
			addClass = "message-error";
			break;
		default:
			dtitle = "操作成功";
	}
	if(typeof(title) != 'undefined')
	{
		dtitle += " "+title;
	}
	$( "#dialog-message" ).attr("title", dtitle);
	$( "#dialog-message .message-content" ).html(msg);
	$( "#dialog-message .message-content" ).addClass(addClass);

	$( "#dialog-message" ).dialog({
		resizable: false,
		height:140,
		modal: true
	});
}


function resetForm(formId)
{
    // 重置文本框
    $("#"+formId+" :text").val("");
    // 重置选择框
    $("#"+formId+" select").each(function(){
    	$(this).children("option").attr("selected", false);
        $(this).children("option:first").attr("selected", true);
    });
}

