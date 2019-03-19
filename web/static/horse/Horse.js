/**
 * @author ldj
 */

var Horse = {
	namespace: function(ns){
		var parts = ns.split(".");
		var object = this;
		var i, len;
		
		for (i=0, len=parts.length; i < len; i++) 
		{
            if (!object[parts[i]]) 
            {
                object[parts[i]] = {};
            }
            object = object[parts[i]];
        }
		
        return object;
	},
	
	getScrollbarWidth: function getScrollbarWidth() {
	    var oP = document.createElement('p'),
	        styles = {
	            width: '100px',
	            height: '100px',
	            overflowY: 'scroll'
	        }, i, scrollbarWidth;
	    for (i in styles) oP.style[i] = styles[i];
	    document.body.appendChild(oP);
	    scrollbarWidth = oP.offsetWidth - oP.clientWidth;
	    oP.remove();
	    return scrollbarWidth;
	}
};