// JavaScript Document
$(function(){
	//浏览器滚动事件
	$(window).scroll(function(){
		var scrolltop=$(window).scrollTop();
		if(scrolltop>200){
			$(".goTop").css('display','block');
		}
	})
	$(".goTop").click(function(){  
       	 $('body,html').animate({scrollTop:0},1500); //点击按钮让其回到页面顶部  
   	 }); 	
})