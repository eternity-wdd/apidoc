/**
 * 订单提醒功能详细实现代码
 */
var NEW_ORDER_INTERVAL = 15000;                      //每隔多长时间检测一次
var HOST_URL_STR = 'http://dev.shop.xunmall.com';  //域名地址
var htmlBody = 
	'<div id="popMsg" class="info_notice" style="width: 260px; position: fixed; bottom: 0px; right: 0px; z-index: 1001; border: 1px solid #e0e0e0; background-color: #fff; display: none;">\
	<div class="info_title" style="background-color: #f6f0f3; height: 40px; text-align: left; line-height: 40px; font-size: 15px; color: #666; font-weight: bold; letter-spacing: 2px; padding-left: 10px; border-bottom: thin solid #e0e0e0; position: relative;">\
		新待审核订单通知\
		<div class="info_close" onclick="Message.close()" style="position: absolute; right: 5px; top: 0px; color:#000; cursor:pointer; font-size: 12px;">\
			关闭\
		</div>\
	</div>\
	<div id="popMsgConten" style="background-color: #fff; padding: 15px 15px 5px 15px; font-size: 13px; color: #333; position: relative;">\
		<span class="info_content" style="display: inline-block;  min-height: 70px;">您有<strong style="color:#ff0000" id="spanNewOrder">1</strong>个新待审核订单等待处理</span>\
		<p class="info_more" style="width: 100%;border-top: 1px dotted #ccc;line-height: 24px;margin: 8px 0 0 0; text-align: right;"><a href="/goodsorder/newOrders"  style="color: #f60; font-size: 13px; text-decoration: none;">点击查看新待审核订单 »</a></p>\
	</div>\
</div>'

var playerBody = '<div id="jplayerContainer"></div>'

window.document.write(playerBody);
//window.document.write(cssBody);
window.document.write(htmlBody);

var issetFlag = 0;

var orderAnnounceObject = {
	inte: '',
	urlStr: '',
		
	initFunc: function(){
		urlStr = '/Goodsorder/checkNewOrder';
		this.checkNewOrder();
		inte = window.setInterval(this.checkNewOrder, NEW_ORDER_INTERVAL);
	},
	checkNewOrder: function(){
		var issetValue = issetFlag;
		var checkFlag = null;
		
		if(issetValue > 0){
			checkFlag = issetValue;
		}
		
		$.post(urlStr, {}, function(res){
			if(res.result == 1){
				if(res.data > 0){
					if(checkFlag == null){
						issetFlag = 1;
						document.getElementById('spanNewOrder').innerHTML = res.data;
						Message.show();
					}
				}
			} else if(res.result == 2){
				if(res.data > 0){
					document.getElementById('spanNewOrder').innerHTML = res.data;
					Message.show();
				}
			}
		}, 'json');
		window.setTimeout("Message.close()", 10000);
	}
};

/*
 * 气泡式提示信息
 */
var Message = Object();

Message.bottom  = 0;
Message.count   = 0;
Message.elem    = "popMsg";
Message.mvTimer = null;

Message.show = function()
{
  try
  {
    Message.controlSound();
    document.getElementById(Message.elem).style.visibility = "visible"
    document.getElementById(Message.elem).style.display = "block"

    Message.bottom  = 0 - parseInt(document.getElementById(Message.elem).offsetHeight);
    Message.move();
  }
  catch (e)
  {
    alert(e);
  }
}

Message.move = function()
{
  try
  {
    Message.bottom += parseInt(document.getElementById(Message.elem).offsetHeight);
    document.getElementById(Message.elem).style.bottom = Message.bottom + "px";
  }
  catch (e)
  {
    alert(e);
  }
}

Message.close = function()
{
  document.getElementById(Message.elem).style.visibility = 'hidden';
  document.getElementById(Message.elem).style.display = 'none';
}

Message.playMusic = function(){
	$("#jplayerContainer").jPlayer({  
        swfPath: HOST_URL_STR + "/static/js/jplayer/jquery.jplayer.swf",   
        supplied: "mp3",
        volume: 1.8,
        preload: 'metadata',
        solution: 'flash,html'
   }).jPlayer("play");
}

Message.controlSound = function()
{
  try
  {
	Message.playMusic();
  }
  catch (e) { }
}

//设置cookie
function createCookie(cname, cvalue) {
    document.cookie = cname + "=" + cvalue;
}

//获取cookie
function pullCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
    }
    return "";
}

//清除cookie  
function emptyCookie(name) {  
    createCookie(name, "");  
}

$(function(){
	orderAnnounceObject.initFunc();
	$("#jplayerContainer").jPlayer({  
        ready: function () {   
           $(this).jPlayer("setMedia", {mp3: HOST_URL_STR + "/static/js/jplayer/alert.mp3"}); 
        }
	});
});
