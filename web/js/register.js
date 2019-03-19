// JavaScript Document

$(document).ready(function(e) {
	var ah=$(window).height();
	var htit=$(".title").innerHeight();
	ah=parseInt(ah);
	htit=parseInt(htit);
	$(".signmain").innerHeight(ah-htit);
	//点击定位按钮
	$(".location").click(function(){
		$.ajax({
				 type : "GET",
				 url:"http://whois.pconline.com.cn/ipJson.jsp?callback=?",
				 dataType : "jsonp",
            	 jsonp: 'callback',
				 success: function (obj){
					 document.getElementById("idTestJson").innerHTML = obj.pro+obj.city+obj.region;	
					 return true;
			 	}  
			})
		})

	//输入密码
	$("#inpass").find(".inputpass").click(function(){
		$(this).addClass("hide");
		$("#inpass").find(".nopass").removeClass("hide");
		});
	$("#inpass").find(".nopass").click(function(){
		$(this).addClass("hide");
		$("#inpass").find(".inputpass").removeClass("hide");
		})
	//用户类型
	$(".select").click(function(){
		$("#utype").slideToggle();
		return false;
	
	})
	$(document).click(function(e){
		var src = e.target;
        if(src.id && src.id ==="utype"){
               return false;
       }else{
             $("#utype").hide();
	   }
	});
	$("#utype").find("li").click(function(){
		var content=$(this).html();
		$(this).parent().parent().parent().find(".usertype").html(content).css("color","#000");
		})
	//服务协议
	$(".checkrule").click(function(){
		if($(this).hasClass("check")){
			$(this).removeClass("check").addClass("uncheck");
			$(this).parent().find(".subm").css("background-color","#ccc");
			}
		else{
			$(this).removeClass("uncheck").addClass("check");
			$(this).parent().find(".subm").css("background-color","#33A3FF");
			}
		})
	
});
