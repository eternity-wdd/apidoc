// JavaScript Document
$(document).ready(function(e) {
	var aheight=$(window).height();
	aheight=parseInt(aheight);
	$(".signmain").height(aheight-55);
	//清空历史记录
	$(".clearhist").find("input").click(function(){
		$(".hist_records").empty();
		})
});