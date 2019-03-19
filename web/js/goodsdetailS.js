// JavaScript Document
$(document).ready(function(e) {

	//加入购物车
	/*
		icon: 成功与否   成功：success  失败：fail
		content: 提示内容
	*/
	function ShowNotice(icon,content){
		var html='';
		html='<div class="showNotice" style="width: 200px; height: 150px; background: rgba(0,0,0,0.7); margin: 0px auto; border-radius: 15px; position: absolute; z-index: 100;">\
			<div class="noticeContent" style="width: 80%;text-align: center; margin: 0px auto;">\
				<div class="contentTitle" style=" background: url(images/'+icon+'.png) center no-repeat; height: 43px; margin-top: 15px;"></div>\
				<div class="contentNotice" style="color: #fff; font-size: 16px; font-weight: 500; margin-top: 15px;">'+content+'</div>\
			</div>\
		</div>';
		$('body').append(html);	
		var wh=$(window).height();
		var noticeh=$(".showNotice").height();
		var ww=$(window).width();
		var noticew=$(".showNotice").width();
		wh=parseInt(wh);
		noticeh=parseInt(noticeh);
		ww=parseInt(ww);
		noticew=parseInt(noticew);
		$(".showNotice").css({"top":(wh-noticeh)/2+'px','left':(ww-noticew)/2+'px'});
		
	}
	/*弹出框隐藏*/
	function HideNotice(){
		$(".showNotice").fadeOut('slow');
	}
	/*点击加入购物车按钮调用提示框方法*/
	$("#joincart").click(function(){
		ShowNotice('success','恭喜您，商品已添加至购物车');
		setTimeout(HideNotice,1500);
	})
	
});