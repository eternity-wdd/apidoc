// JavaScript Document
$(document).ready(function(e) {
	var height=$(window).height();
	var width=$(window).width();
	height=parseInt(height);
	$(".signmain").height(height-120);
	var he=$(".payment_method").height();
	var wi=$(".payment_method").width();
	$(".payment_method").css({"top":(height-he)/2,"left":(width-wi)/2});

	//点击支付方式
	//$(".payment").click(function(){
//		$(".bg").show();
//		$(".payment_method").show();
//		})
//	$(".payment_method").find("dd").click(function(){
//		$(".bg").hide();
//		$(".payment_method").hide();
//		var con=$(this).html();
//		$(".payment").html(con);
//		})
});