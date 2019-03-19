/**
 * 
 */


function showLoading()
{
	$('#loading-state').css({ 
		position:'absolute', 
		left: ($(window).width() - $('#loading-state').outerWidth())/2, 
		top: ($(window).height() - $('#loading-state').outerHeight())/2 + $(document).scrollTop() 
	});
	$("#loading-state").show();
}

function hideLoading()
{
	$("#loading-state").hide();
}

/*
$(window).resize(function(){ 
	$('.className').css({ 
	position:'absolute', 
	left: ($(window).width() - $('.className').outerWidth())/2, 
	top: ($(window).height() - $('.className').outerHeight())/2 + $(document).scrollTop() 
	}); 
}); 
//初始化函数 
$(window).resize(); 
*/