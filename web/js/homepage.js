// JavaScript Document
window.onload=getHeight;
function getHeight(){
	var aheight=$(window).height();
	var htop=$(".hometop").innerHeight();
	var hfoot=$(".homefoot").innerHeight();
	aheight=parseInt(aheight);
	htop=parseInt(htop);
	hfoot=parseInt(hfoot);
	//alert(aheight+'   '+htop+"  "+hfoot)
	$(".homemain").innerHeight(aheight-htop-hfoot);
	$(".typelist").css("min-height",aheight);
	}
	$(document).ready(function(e) {
		//返回顶部
		//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
        $(function () {
            $(window).scroll(function(){
                if ($(window).scrollTop()>100){
                    $("#backtop").fadeIn(1500);
                }
                else
                {
                    $("#backtop").fadeOut(1500);
                }
            });
 
            //当点击跳转链接后，回到页面顶部位置
 
            $("#backtop").click(function(){
                $('body,html').animate({scrollTop:0},1000);
                return false;
        });
    });
	
	$(".typelist").animate({left:'-200%'}, {duration: "0"});
	var left=$(".typelist").width();
	
	//点击分类图标
	$(".container .hometitle").click(function(){	
		$(".typelist").animate({left:'0'}, {duration: "fast"}).css("display","block");
		$(".bg").show();
		$(".container").css("position","fixed");
	})
	/*点击遮罩层*/
	$(".bg").click(function(){
		$(".typelist").animate({left:-left}, {duration: "fast"});
		$(this).hide();
		$(".container").css("position","relative");
	})
	//类别
	$(".typename").find("li").click(function(){
		$(".typename").find("li").removeClass("current");
		//$(this).animate({top:'50px'});
		//alert($(this).html())
		$(this).addClass("current");
		var index=$(this).index();
		$(".typecontent").children().addClass("hide");
		$(".typecontent").children().eq(index).removeClass("hide");
		});
	
});
