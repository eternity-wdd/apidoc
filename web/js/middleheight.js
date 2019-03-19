// JavaScript Document
window.onload=getHeight;
function getHeight(){
	var aheight=$(window).height();
	var htop=$(".title").innerHeight();
	var hfoot=$(".homefoot").innerHeight();
	aheight=parseInt(aheight);
	//htop=parseInt(htop);
	hfoot=parseInt(hfoot);	
	//alert(aheight+'   '+"  "+hfoot)
	$(".signmain").innerHeight(aheight-hfoot-htop);
	}
