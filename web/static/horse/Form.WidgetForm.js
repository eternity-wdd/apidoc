/**
 * @author ldj 
 */

Horse.namespace("Form").WidgetForm = function(options){
	this.settings = { 
			id: '',
			form: '', 
			tableWrap: '',
			paginationWrapClass: 'dataTables_paginate',
			tableClass: 'dataTable',
		};
	
	jQuery.extend(this.settings, options);

	this.exportFlag = false;
	this.init();
};

Horse.Form.WidgetForm.prototype = {
	
	init: function(){
		var context = this;
		var targetTable = $('#' + this.settings.id + ' .' + this.settings.tableClass);
		
		targetTable.parent().before($('#' + this.settings.id + ' .' + this.settings.tableClass).parent().html());
		targetTable.children('thead').remove();
		
		var copyTable = $('#' + this.settings.id + ' .' + this.settings.tableClass ).eq(0);
		$(copyTable).removeClass(this.settings.tableClass);
		$(copyTable).width($(copyTable).width() - Horse.getScrollbarWidth());
		
		$(".btn-export", $('#' + this.settings.id)).on('click', function(){
			context.exportFlag = true;
		});
		
		$('#' + this.settings.id + ' form').submit(function(){
			var d= this;
			if(!context.exportFlag)
			{
				context.submit.apply(context, arguments);
				return false;
			}
			context.exportFlag = false;
		});
		
		this.submit();
	},
	
	submit: function(){
		if(this.exportFlag !== true)
		{
			context = this;
			this.showLoading();
			$('#' + this.settings.id + " form").eq(0).ajaxSubmit({
    			dataType: 'json',
    	        success: function(response, statusText, xhr, $form){
    	        	context.responseCallback.apply(context, arguments);
    	        }
    		});
		}
	},
	
	responseCallback: function(response, statusText, xhr, $form){
		var context = this;
    	this.hideLoading();
    	
    	$('#' + this.settings.id + ' .'+this.settings.paginationWrapClass).html(response.pagination);
    	$('#' + this.settings.id + ' .' + this.settings.tableClass + ' tbody').html(response.content);
    	
    	$('#' + this.settings.id + ' .paginate_button a').each(function(index, item){
    		$(this).attr("data-link", $(this).attr("href"));
    		$(this).attr("href", "javascript:void(0)");
    	});
    	
    	$('#' + this.settings.id + ' .paginate_button a').click(function(){
    		context.showLoading();
    		$.ajax({
    		   type: "GET",
    		   url: $(this).attr("data-link"),
    		   dataType: "json",
    		   success: function(response, statusText, xhr, $form){
   	        		context.responseCallback.apply(context, arguments);
   	           }
    		});
    	});
	},
	
	showLoading: function(){
		$('#' + this.settings.id + ' .overlay').show();
	},
	
	hideLoading: function(){
		$('#' + this.settings.id + ' .overlay').hide();
	}
};