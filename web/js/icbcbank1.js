// JavaScript Document
$(document).ready(function(e) {
	$(".nexts").click(function(){
		var con=$(".tel").find("input").val();
		var num=$(".cardnum").find("input").val();
		if(con==""){
			alert("请输入手机号");
			
			}
			else {
				if(num==""){
					alert("请输入支付卡号");
					}
				}
		
		})
});