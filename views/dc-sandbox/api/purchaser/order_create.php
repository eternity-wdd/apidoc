<div>
	<label>维护业务员编号：</label>
	<input type="text" name="param[staff_id]"/>
	<div>
		<label>支付方式：</label>
		<!--<input type="text" name="param[payment]"/>
		--> 
		<select name="param[payment]">
			<option value="51" selected="selected">预付款支付</option>
			<option value="-1">货到付款支付</option>
			<option value="51_-1">预存款支付+货到付款支付</option>
			<option value="59_0">联行支付</option>
			<option value="59_1">预存款支付+联行支付</option>
		</select>
		(必须填写)
	</div>
	<div>
		<label>是否直接购买：</label>
		<input type="text" name="param[is_fast_buy]" value="1"/>
		(0不直接购买，1直接购买)
	</div>