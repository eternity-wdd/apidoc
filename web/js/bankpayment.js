// JavaScript Document
$(document).ready(function(e) {
	var ah=$(window).height();
	ah=parseInt(ah);
	$(".signmain").height(ah-53);
	//是否使用余额
	$(".use_bala").click(function(){
		if($(this).hasClass("no")){
			$(this).removeClass("no").addClass("yes");	
			$(".int_bankpay").hide();
			$(".account_info").show();
		}	
		else{
			$(this).removeClass("yes").addClass("no");	
			$(".int_bankpay").show();
			$(".account_info").hide();
			}
	});
});