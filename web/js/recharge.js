// JavaScript Document
function validateForm(){
		if(document.form.cont.value==""){
			alert("请输入金额");
			document.form.cont.focus();
			return false;
			}
		return true;
		}
$(document).ready(function(e) {
	$(".message").find(".icon").click(function(){
		$(this).parent().find(".amount").slideToggle();
	})
	$(".amount").find("li").click(function(){
		$(this).parent().parent().hide();
		var con=$(this).html();
		con=con.substring(0,3);//截取前三位
		$(".textarea").val(con);
		})
	
});