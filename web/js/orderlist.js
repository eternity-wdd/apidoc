// JavaScript Document
$(document).ready(function(e) {
	var aheight=$(window).height();
	aheight=parseInt(aheight);
	$(".signmain").height(aheight-55);
	$(".listname").find("a").click(function(){
		$(".listname").find("a").removeClass("current");
		$(this).addClass("current");
		var index=$(this).parent().index();
		$(".orderlist").css("display","none");
		if(index>=0&&index<=2){
			$(".orderlist").eq(index).css("display","block");
		}else if(index>2&&index<=8){
			$(".orderlist").eq(index-3).css("display","block");	
			}
		});
});