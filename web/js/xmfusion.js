/**
 * 
 */

if (typeof xmfusion == "undefined") 
{
	var xmfusion = {};
	
	xmfusion.request = function(options){
		var settings = {
				//'api' : '', //The name of api and it's required.
				'data' : {}, //Request data.
				//'callback' : callback, //Function called when request returned.
				'loading' : false, // Boolean, whether show loading effect.
				//'targetId' : '' // The value is required when 'loading' is true.
		};
		
		jQuery.extend(settings, options);
		
		settings.data.api = settings.api;
		
		if(settings.loading)
		{
			xmfusion.showLoading(settings.targetId);
		}
		
		$.ajax({
		   type: "POST",
		   url: "/api",
		   data: settings.data,
		   dataType: "json",
		   success: function(data){
			   
			   if(options.loading)
			   {
					xmfusion.hideLoading(settings.targetId);
			   }
			   
			   if(data.ret != 0)
			   {
				   if(data.ret == -24)
				   {
					   location.href = '/site/logout';
				   }
				   else
				   {
					   //alert(data.msg);
				   }
			   }
			   else
			   {
				   if(typeof(settings.callback) != 'undefined')
				   {
					   settings.callback(data);
				   }
			   }
		   }
		});
	};
	
	/*商品或图片正在加载*/
	xmfusion.showLoading = function(id){
		var loading='<div class="xm-loading" style="display:none; width: 20%; height: 32px; text-align:center; position: absolute; left: 40%; top: 20px;">\
						<img src="./images/loading.gif"/>\
					</div>'
		$("#"+id).css("min-height","62px");
		$("#"+id).append(loading);
		setTimeout('$("#' + id + ' .xm-loading").show()', 1000);
	};
	
	xmfusion.hideLoading = function(id){
		$("#" + id + " .xm-loading").remove();
	};
}