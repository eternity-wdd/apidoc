/**
 * @author Administrator
 */

function Response()
{
	if(typeof this.SUCCESS_STATUS != "number")
	{
		Response.prototype.SUCCESS_STATUS = 1;
		Response.prototype.ERROR_STATUS = 0;
	}
}

var const_response = new Response();
