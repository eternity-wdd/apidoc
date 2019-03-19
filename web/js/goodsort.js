// JavaScript Document
$(document).ready(function(e) {
	//类别
	$(".typename").find("li").click(function(){
		$(".typename").find("li").removeClass("current");
		//$(this).animate({top:'50px'});
		//alert($(this).html())
		$(this).addClass("current");
		var index=$(this).index();
		$(".typecontent").children().addClass("hide");
		$(".typecontent").children().eq(index).removeClass("hide");
		});
	var ah=$(window).height();
	ah=parseInt(ah);
	$(".typelist").height(ah-53);
});