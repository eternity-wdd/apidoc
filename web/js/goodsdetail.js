// JavaScript Document
$(document).ready(function(e) {
	//商品数量增加
	$(".goodprop").find(".ins").click(function(){
		var num=$(this).parent().find(".goodnum").val();
		num=parseInt(num);
		$(this).parent().find(".goodnum").val(num+1);
	})
	//商品数量减少
	$(".goodprop").find(".des").click(function(){
		var num=$(this).parent().find(".goodnum").val();
		num=parseInt(num);
		if(num>1){
			$(this).parent().find(".goodnum").val(num-1);
		}
		else{
			alert("最低购买数量为1");
			}
	})
	//详细参数 规格  店铺详情
	$(".detailcomm").click(function(){
		$(this).next(".detaildp").slideToggle();
		var flag=$(this).parent();
		if(flag.hasClass("detailhover"))
		{
			flag.removeClass("detailhover");
		}
		else
		{
			flag.addClass("detailhover");
		}
		
	});
});