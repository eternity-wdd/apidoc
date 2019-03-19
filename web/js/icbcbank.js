// JavaScript Document
$(document).ready(function(e) {
	var ah=$(window).height();
	ah=parseInt(ah);
	$(".signmain").height(ah-53);
	$(".arrow").click(function(){
		if($(this).hasClass("down")){
			$(this).removeClass("down").addClass("up");
			$(".ordernum").show();
			$(".orderdate").show();		
		}
		else if($(this).hasClass("up")){
			$(this).removeClass("up").addClass("down");
			$(".ordernum").hide();
			$(".orderdate").hide();
		}
	})
});