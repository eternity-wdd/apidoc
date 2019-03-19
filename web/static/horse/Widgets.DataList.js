/**
 * @author ldj
 * 提供以列表形式展示具有分页功能挂件
 */

Horse.namespace("Widgets").DataList = function(options){
	this.settings = {
			head: {}, // [{title:'供应商', width:'50%'}, {title:'订单总数', width:'25%', order:'desc'}, {title:'线上支付', width:'25%', order:true}]
			id: '',
			form: '', 
			tableWrap: '',
			paginationWrapClass: 'dataTables_paginate',
			tableClass: 'dataTable',
			sortField: 'sort'
		};
	
	jQuery.extend(this.settings, options);

	this.exportFlag = false;
	this.init();
};

Horse.Widgets.DataList.prototype = {
	
	init: function(){
		var context = this;
		
		this.reanderHead();
		
		$('#' + this.settings.id + ' form').submit(function(){
			context.submit.apply(context, arguments);
			return false;
		});
		
		this.submit();
	},
	
	renderColgroup: function{
		var head = this.settings.head;
		var col = '';
		
		for(var i = 0; i < head.length; i++)
		{
			col += '<col width="' + head[i].width + '" />';
		}
		
		return '<colgroup>' + col + '</colgroup>';
	},
	
	renderHeader: function(){
		var head = this.settings.head;
		var th = '';
		
		for(var i = 0; i < head.length; i++)
		{
			th += '<th>' + head[i].title + '</th>';
		}
		
		return '<thead>\
					<tr>' + th + '</tr>\
				</thead>';
	},
	
	renderItems: function(){
		
	},
	
	renderPagination: function(paginationHtml){
		return '<div class="dataTables_paginate paging_simple_numbers">' + paginationHtml + </div>';
	},
	
	renderFooter: function(){
		return '<div class="box-footer clearfix">' + 
					this.renderPagination('') +
			   '</div>';
	},
	
	// 表单提交响应函数
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
		
	    this.exportFlag = false;
	},
	// 表单提交后Ajax响应回调函数
	responseCallback: function(response, statusText, xhr, $form){
		var context = this;
    	this.hideLoading();
    	
    	$('#' + this.settings.id + ' .'+this.settings.paginationWrapClass).html(response.pagination);
    	$('#' + this.settings.id + ' .' + this.settings.tableClass + ' thead').remove();
    	$('#' + this.settings.id + ' .' + this.settings.tableClass + ' tbody').remove();
    	$('#' + this.settings.id + ' .' + this.settings.tableClass).append(response.content);
    	this.positionHead();
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
	// 显示加载效果
	showLoading: function(){
		$('#' + this.settings.id + ' .overlay').show();
	},
	// 隐藏加载效果
	hideLoading: function(){
		$('#' + this.settings.id + ' .overlay').hide();
	},
	// 绑定排序处理事件
	bindSort: function(){
		$('#' + this.settings.id + ' .sorting').on('click', function(){
			if($(this).hasClass('sorting_desc')) // 正序
			{
				$(this).removeClass('sorting_desc');
				$(this).addClass('sorting_asc');
				$('#' + this.settings.id + ' form input[name="' + this.settings.sortField +'"]').val($(this).attr('sort'));
			}
		});
	}
};