// JavaScript Document

$(document).ready(function(e) {
	//将div设为浏览器的高度
	var wh=$(window).innerHeight();
	//var height=$(".login_main").height();
	wh=parseInt(wh);
	$(".login_main").height(wh);
	$(".l_login").find("input").click(function(){
		var user=$(".user").val();
		if(user==""||user=="请输入用户名"){
			$(".user_emp").removeClass("hide");
			//alert("请输入用户名");
			}
		else{
			$(".user_emp").addClass("hide");
			var pass=$(".pass").val();
			if(pass==""||pass=="请输入密码"){
				$(".pass_emp").removeClass("hide");
				}
			else{
				$(".pass_emp").addClass("hide");
				}
			}
	})
	$(".user").focus(function(){
		$(".user_emp").addClass("hide");
	});
	$(".pass").focus(function(){
		$(".pass_emp").addClass("hide");
	});
	$(".remberpass").click(function(){
		if($(this).hasClass("che")){
			$(this).removeClass("che").addClass("unche");
			}
		else{
			$(this).removeClass("unche").addClass("che");
			}
	})
});