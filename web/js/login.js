// JavaScript Document

$(document).ready(function(e) {
	//将div设为浏览器的高度
	
	$("#loginbut").click(function(){
		var user=$(".user").val();
		
		if(user==""||user=="请输入用户名"){
			$(".user_emp").removeClass("hide");
			//alert("请输入用户名");
			}
		else{
			$(".user_emp").addClass("hide");
			var pass=$(".pass").val();
			if(pass==""){
				$(".pass_emp").removeClass("hide");
				}
			else{
				$(".pass_emp").addClass("hide");
				$(".l_login .loading").show();
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