// JavaScript Document
$(document).ready(function(e) {
	var aheight=$(window).height();
	var width=$(window).width();
	aheight=parseInt(aheight);
	width=parseInt(width);
	$(".signmain").height(aheight-50);
	var he=$(".cr_state").height();
	var wi=$(".cr_state").width();
	$(".cr_state").css({"top":(aheight-he*1.5)/2,"left":(width-wi)/2});
	//版权声明
	$(".copright").click(function(){
		$(".cr_state").show();
	})
	$(".confirm").click(function(){
		$(".cr_state").hide();
	})
});