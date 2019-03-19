// JavaScript Document
$(document).ready(function(e) {
	//更多
	$(".iconmore").click(function(){
		$(".morecontent").slideToggle();
		/*$(".typelist").hide();
		$(".type").find("span").removeClass("fontcolorblue");
		$(".type").find("b").addClass("down").removeClass("up");
		$(".sortlist").hide();
		$(".sort").find("span").removeClass("fontcolorblue");
		$(".sort").find("b").addClass("down").removeClass("up");*/
		return false;
	})
	$(document).click(function(e){
		var src = e.target;
        if(src.className=="morecontent"){
               return false;
       }
		else{
			 $("#morecontent").hide();
	   }
	});

});