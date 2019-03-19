// JavaScript Document
window.onload=getHeight;
function getHeight(){
	var aheight=$(window).height();
	aheight=parseInt(aheight);
	//alert(aheight+'   '+htop+"  "+hfoot)
	$(".signmain").innerHeight(aheight-120);
	}
$(document).ready(function(e) {
	//底部
	$(".footlist").click(function(){
		$(".footlist").find(".listiconhover").addClass("hide");
		$(".footlist").find(".listicon").removeClass("hide");
		$(".footlist").find(".sort").removeClass("hover");
		$(this).find(".listicon").addClass("hide");
		$(this).find(".listiconhover").removeClass("hide");
		$(this).find(".sort").addClass("hover");
		});
	//商品数量增加
	$(".good_ope").find(".ins").click(function(){
		var num=$(this).parent().find(".goodnum").val();
		num=parseInt(num);
		$(this).parent().find(".goodnum").val(num+1);
	})
	//商品数量减少
	$(".good_ope").find(".des").click(function(){
		var num=$(this).parent().find(".goodnum").val();
		num=parseInt(num);
		if(num>1){
			$(this).parent().find(".goodnum").val(num-1);
		}
		else{
			alert("最低购买数量为1");
			}
	})
	//删除商品
	var height=$(window).height();
	var width=$(window).width();
	height=parseInt(height);
	var he=$(".del_good").height();
	var wi=$(".del_good").width();
	$(".del_good").css({"top":(height-he)/2,"left":(width-wi)/2});
	//点击删除按钮
	$(".del").click(function(){
		$(".good_items").removeClass("curr");
		$(this).parent().parent().parent().addClass("curr");
		$(".del_good").show();
		$(".bg").show();
		})
	//点击否
	$(".cancel").click(function(){
		$(".del_good").hide();
		$(".bg").hide();
		});
	//点击是
	$(".remove").click(function(){
		$(".curr").css("display","none");
		$(".del_good").hide();
		$(".bg").hide();
		})

});