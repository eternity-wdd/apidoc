// JavaScript Document
$(document).ready(function(e) {
	//底部字体颜色改变
   $(".zq_foot li a").mouseover(function(){
	   $(this).css({"color":"red","text-decoration":"underline","cursor":"pointer"})
	   });
    $(".zq_foot li a").mouseleave(function(){
		$(this).css({"color":"#666","text-decoration":"none"});
		})
	//用户名输入框 鼠标按下
	$("#user").mousedown(function(){
		var s=$(this).val();
		//获取焦点
		$(this).focus();
		$(this).css("color","#333");
		$(this).css({"border-color":"#999","border-width":"1px"});
		if(s=="请输入用户名"){
			$(this).val("");
			$(this).focus();
			}
		else{
			$(this).val(s);
			}
		})
	//用户名 鼠标离开
	$("#user").mouseleave(function(){
		var s=$(this).val();
		$(this).css({"border-color":"#ccc","border-width":"1px 1px 1px 0px"});
		if(s!="请输入用户名"&&s!=""){
			$(this).val(s);
			$(this).css("color","#333");
			}else {
			//	$(this).val("请输入用户名");
				$(this).blur();
				$(this).css("color","#ccc");
			}
		})
	//密码输入框 鼠标按下
	$("#password").mousedown(function(){
		$(this).css({"border-color":"#999","border-width":"1px"});
		$(this).css("color","#333");
		$(this).focus();
		$("#enter_pass").css("display","none");
		})
	$("#enter_pass").mousedown(function(){
		$("#password").css({"border-color":"#999","border-width":"1px"});
		$(this).css("display","none");
		$("#password").css("color","#333");
		$("#password").focus();
		})
	//密码输入框 鼠标离开
	$("#password").mouseleave(function(){
		var s=$(this).val();
		$(this).css({"border-color":"#ccc","border-width":"1px 1px 1px 0px"});
		if(s==""){
			$("#enter_pass").css("display","block");
			$("#enter_pass").css("color","#ccc");
			$(this).blur();
			}
		})
//用户名、密码判断是否为空
  $("#lg_but").click(function(){
		var s=$("#user").val();
		var p=$("#password").val();
		if(s==""||s=="请输入用户名"){
			$("#tag1").css("display","block")
			}
		  else if(p==""){
			$("#tag2").css("display","block");
			}
			else{
				$("#lg_but").parent().attr("href","http://baidu.com");}
		})
	//提示框隐藏
	$(".input").mousedown(function(){
		$(".tag").css("display","none");
		})
	$("#enter_pass").mousedown(function(){
		$(".tag").css("display","none");
		})

});
