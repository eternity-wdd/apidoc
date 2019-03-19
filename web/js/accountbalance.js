// JavaScript Document
$(document).ready(function(e) {
	var aheight=$(window).height();
	aheight=parseInt(aheight);
	$(".signmain").height(aheight-55);
	
	$(".listname").find("a").click(function(){
		$(".listname").find("a").removeClass("current");
		$(this).addClass("current");
		var index=$(this).parent().index();
		$(".listitems").css("display","none");
		$(".listitems").eq(index).css("display","block");
		})
});