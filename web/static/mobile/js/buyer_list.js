// JavaScript Document
$(document).ready(function(e) {
	//弹出框宽度
	/*商品选择分类宽度调整*/
	$("#goods_category_selector_btn").click(function(){
		$("#goods-category-select-dialog").parent().css({"width":"90%","left":"5%"});
		$("body").css("overflow","hidden");
		/*点击弹出窗关闭按钮*/
		$(".ui-dialog-titlebar-close").click(function(){
			$("body").css("overflow-y","visible");
		})
		
	});
 	/*开启规格宽度调整*/
	$("#open_spec").click(function(){
		$("#dialog_spec").parent().css({"width":"90%","left":"5%"});
		$("body").css("overflow","hidden");
		/*点击弹出窗关闭按钮*/
		$(".ui-dialog-titlebar-close").click(function(){
			$("body").css("overflow-y","visible");
		})
	});	
	
	var wh=$(window).height();
	var pageh=$(".pagination").height();
	//var gh=$(".good_items").height();
	wh=parseInt(wh);
	pageh=parseInt(pageh);
	//gh=parseInt(gh);
	$(".filtersort").css("min-height",wh);
	$(".good_items").css({"margin-top":pageh+80,"position":"relative"});
	
	//返回顶部
	//$('.gopage').click(function(){
	//	$('body,html').animate({scrollTop:0},1000);
	//})
	//点击返回图片
	//筛选
	$(".filtersort").animate({left:'100%'}, {duration: "0"}).css("display","none");
	$(".filter").click(function(){	
		var left=$(".filtersort").width();	
		$(".filtersort").animate({left:'15%'}, {duration: "fast"}).css("display","block");
		$(".bg").show();
		$(".good_items").css("position","fixed");
	})
	/*点击遮罩层*/
	$(".bg").click(function(){
		$(".filtersort").animate({left:'100%'}, {duration: "fast"});
		$(this).hide();
		$(".generalsort").show();
		$(".specsort").hide();
		$("#choosesort").html("选择分类");
		$(".good_items").css("position","relative");
		
	})
	//查询
	$(".filterbutton").find(".btn").click(function(){
		$(this).parent().parent().parent().animate({left:'100%'}, {duration: "fast"});
		$(".bg").hide();
	})
	//筛选点击li
	$(".filterlist").find("li").click(function(){
		$(this).siblings().removeClass("filterlisthover");
		$(this).addClass("filterlisthover");
		$(this).siblings().last().children(":input").last().val($(this).attr("data-value"));
	})
	$(".filterinput").find("input").focus(function(){
		$(".filterinput").find("input").removeClass("filterinputhover");
		$(this).addClass("filterinputhover");
	})
	//点击选择分类
	$("#choosesort").click(function(){
		$(this).parent().parent().parent().hide();
		$(".specsort").slideToggle();
		$("#filtername").html("");
		$(".typelist").show();
		$(".specsort").find("li").removeClass("filterlisthover");
		})
	//一级选择
	$(".typelist").find("li").click(function(){
		var con=$(this).html();
		var content=$("#filtername").html();
		$("#filtername").html(content+" "+con);
		$(this).parent().parent().hide();
		var index=$(this).index();
		$(".secondlist").children().eq(index).show();
		})
	//二级选择
	$(".secondsort").find("li").click(function(){
		var con=$(this).html();
		var content=$("#filtername").html();
		$("#filtername").html(content+"-> "+con);
		$(this).parent().parent().hide();
		var index=$(this).parent().parent().index();
		var index1=$(this).index();
		//$(".thirdlist").children().eq(index).show();
		$(".thirdlist").children().eq(index).children().eq(index1).show();
		})
	//三级选择
	$(".thirditem").find("li").click(function(){
		var con=$(this).html();
		var content=$("#filtername").html();
		$("#filtername").html(content+"-> "+con);
		var conn=$("#filtername").html();
		$("#choosesort").html(conn);
		$(this).parent().parent().hide();
		$(".specsort").hide();
		$(".generalsort").show();
		})
	//清空
	$("#clearsort").click(function(){
		$("#choosesort").html('选择分类');
		$("#filtername").html("");
		$(".typelist").show();
		$(".specsort").find("li").removeClass("filterlisthover");
		$("#clearsort").removeClass("filterlisthover");
		})
	
});