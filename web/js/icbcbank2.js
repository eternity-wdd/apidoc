// JavaScript Document
$(document).ready(function(e) {
	$(".nexts").click(function(){
		var con=$(".cardnum").find("input").val();
		if(con==""){
			alert("请输入支付卡号");
			}
		})
});