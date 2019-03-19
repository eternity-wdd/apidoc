// JavaScript Document
$(document).ready(function(e) {
	var ah=$(window).height();
	ah=parseInt(ah);
	$(".typelist").height(ah-103);
	//更多
	$(".iconmore").click(function(){
		$(".morecontent").slideToggle();
		$(".typelist").hide();
		$(".type").find("span").removeClass("fontcolorblue");
		$(".type").find("b").addClass("down").removeClass("up");
		$(".sortlist").hide();
		$(".sort").find("span").removeClass("fontcolorblue");
		$(".sort").find("b").addClass("down").removeClass("up");
		return false;
	})
	//类别
	$(".tydo").click(function(){
		$("#sortlist").hide();
		$("#morecontent").hide();
		$(".sort").find("span").removeClass("fontcolorblue");
		$(".sort").find("b").addClass("down").removeClass("up");
		//$("#typelist").slideToggle();
		if($(".typelist").css("display")=="none"){
			$(".typelist").css("display","block");
			$(this).find("span").addClass("fontcolorblue");
			$(this).find("b").addClass("up").removeClass("down");
			
		}
		else if($(".typelist").css("display")=="block"){
			$(".typelist").css("display","none");
			$(this).find("span").removeClass("fontcolorblue");
			$(this).find("b").addClass("down").removeClass("up");
			}
		return false;
		})
	//类别
	$(".typename").find("li").click(function(){
		$(".typename").find("li").removeClass("current");
		$(this).addClass("current");
		var index=$(this).index();
		$(".typecontent").children().addClass("hide");
		$(".typecontent").children().eq(index).removeClass("hide");
		})
	//排序
	$(".sodo").click(function(){
		$("#morecontent").hide();
		$(".typelist").hide();
		$(".type").find("span").removeClass("fontcolorblue");
		$(".type").find("b").addClass("down").removeClass("up");
		if($("#sortlist").css("display")=="none"){
			$("#sortlist").css("display","block");
			$(this).find("span").addClass("fontcolorblue");
			$(this).find("b").addClass("up").removeClass("down");
			
		}
		else if($("#sortlist").css("display")=="block"){
			$("#sortlist").css("display","none");
			$(this).find("span").removeClass("fontcolorblue");
			$(this).find("b").addClass("down").removeClass("up");
			}
		return false;
		})
	//排序点击
	$(".sortlist").find("li").mousedown(function(){
		$(this).css("background-color","#F93");
		})
	$(".sortlist").find("li").mouseup(function(){
		$(this).css("background-color","#fff");
		})
	$(document).click(function(e){
		var src = e.target;
        if(src.className=="current"){
			$(".typelist").show();
               return false;
       }
	   else if(src.className=="typelist"){
		   return false;
		   }
 		else if(src.className=="morecontent"){
		   return false;
		   }
		  else{

			 $("#sortlist").hide();
			 $(".sort").find("span").removeClass("fontcolorblue");
			 $(".sort").find("b").addClass("down").removeClass("up");
			 $("#morecontent").hide();
	   }
	});

	
});