/**
 * @author ldj 
 */

Horse.namespace("Slider").Card = function(options){
	this.settings = { 
			id: '',
			time: 3000, 
			size: 5,
			paginationWrapClass: 'dataTables_paginate',
			tableClass: 'dataTable',
			_liWidth:0,
			_liNum:0,
			_slideIndex:0,
			_boxContext:null,
			_dotsContext:null
		};
	
	jQuery.extend(this.settings, options);

	this.exportFlag = false;
	this.init();
};

Horse.Slider.Card.prototype = {
	init: function(){
		this.settings._boxContext = $("#" + this.settings.id + " .home-expert-box");
		this.settings._dotsContext = $("#" + this.settings.id + " .expert-dots");
	},
	
	run: function(){
		var context = this;
		var expertTimer=0;
		this.settings._liNum=$("ul li", this.settings._boxContext).length
		
		if(this.settings._liNum > this.settings.size) this.slideExpert();
		 
		var dotsLeft=$("a:eq(0)", this.settings._dotsContext);
		var dotsRight=$("a:eq(1)", this.settings._dotsContext);
		var moveWidth=this.settings._boxContext.width()-$("ul", this.settings._boxContext).width();
		
		var test = function(){
			$("#" + this.settings.id + " .expert-dots a:eq(1)").triggerHandler('click');
		};
		
		dotsLeft.click(function(){
			context.settings._slideIndex--;
			if(context.settings._slideIndex<0) {
				context.settings._slideIndex = context.settings._liNum-5;
			}
			context.showSlide(context.settings._slideIndex);
			window.clearInterval(expertTimer);
			expertTimer=window.setInterval(function(){test.apply(context);}, context.settings.time);
		});
		
		dotsRight.click(function(){
			context.settings._slideIndex++;
			if(context.settings._slideIndex > context.settings._liNum-5) {
				context.settings._slideIndex=0;
			}
			context.showSlide(context.settings._slideIndex);
			window.clearInterval(expertTimer);
			expertTimer=window.setInterval(function(){test.apply(context);}, context.settings.time);
		});
		
		expertTimer=window.setInterval(function(){test.apply(context);}, this.settings.time);
		
		$("a", this.settings._boxContext).hover(function(){
			window.clearInterval(expertTimer);
		},function(){
			expertTimer=window.setInterval(function(){test.apply(context);}, context.settings.time);
		});
	}, 
	
	slideExpert: function (){
	  var li=$("ul li", this.settings._boxContext);
	  li.css({"width":li.width(),"margin-right":li.css("margin-right")});
	  this.settings._liWidth=li.outerWidth(true);
	  $("ul", $("#" + this.settings.id)).width(this.settings._liNum * this.settings._liWidth);
	}, 
	
	showSlide: function (n){
		  var newLeft=-this.settings._liWidth * n;
		  $("ul", "#"+this.settings.id).animate({"margin-left":newLeft},300);
	}
};







/*


//---------------------------------------------------------------------
var homeExpert=$("#home-expert-box"),liNum=$("ul li",homeExpert).length,slideIndex=0,liWidth,expertTimer=0,time=3000;
if(liNum>5) slideExpert();
function slideExpert(){
  var li=$("ul li",homeExpert);
  li.css({"width":li.width(),"margin-right":li.css("margin-right")});
  liWidth=li.outerWidth(true);
  $("ul",homeExpert).width(liNum*liWidth);
}
var dotsLeft=$("#expert-dots a:eq(0)"),dotsRight=$("#expert-dots a:eq(1)");
var moveWidth=homeExpert.width()-$("ul",homeExpert).width();
dotsLeft.click(function(){
  slideIndex--;
  if(slideIndex<0) {
    slideIndex=liNum-5;
  }
  showSlide(slideIndex);
  window.clearInterval(expertTimer);
  expertTimer=window.setInterval("dotsRight.triggerHandler('click');",time);
});
dotsRight.click(function(){
  slideIndex++;
  if(slideIndex>liNum-5) {
    slideIndex=0;
  }
  showSlide(slideIndex);
  window.clearInterval(expertTimer);
  expertTimer=window.setInterval("dotsRight.triggerHandler('click');",time);
});
expertTimer=window.setInterval("dotsRight.triggerHandler('click');",time);
$("a",homeExpert).hover(function(){
  window.clearInterval(expertTimer);
},function(){
  expertTimer=window.setInterval("dotsRight.triggerHandler('click');",time);
});
function showSlide(n){
  var newLeft=-liWidth*n;
  $("ul",homeExpert).animate({"margin-left":newLeft},300);
}
*/