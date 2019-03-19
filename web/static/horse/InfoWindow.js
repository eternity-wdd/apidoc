/**
 * @author ldj 
 */

Horse.InfoWindow = function(options){
	this.settings = { 
			title: '',
			content: ''
		};
	
	jQuery.extend(this.settings, options);
};

Horse.InfoWindow.prototype = {
	
	getTitle: function(){
		return this.settings.title;
	},
	
	getContent: function(){
		return this.settings.content;
	},
};