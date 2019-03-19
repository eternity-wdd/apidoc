<div>
	<label>订单号：</label>
	<input type="text" name="param[order_id]"/>
</div>
<div>
	<label>收货人：</label>
	<input type="text" name="param[ship_name]"/>
</div>
<div>
	<label>第N页：</label>
	<input type="text" name="param[page]"/>
	<div>
		<label>订单状态：</label>
		<select name="param[status]">
			<option value="0" selected="selected">全部订单</option>
			<option value="1">等待付款</option>
			<option value="2">已付款未发货</option>
			<option value="3">已发货</option>
			<option value="4">已完成</option>
			<option value="5">已退款</option>
			<option value="6">已退货</option>
			<option value="7">已作废</option>
			<option value="8">已签收</option>
		</select>
	</div>