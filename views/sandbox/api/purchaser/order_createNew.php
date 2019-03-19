<div>
	<label>维护业务员编号：</label>
	<input type="text" name="param[staff_id]"/>
	<div>
		<label>是否使用预存款：</label>
		<input type="radio" name="param[use_deposit]" value="1" />
		使用
		<input type="radio" name="param[use_deposit]" value="0" />
		不使用
	</div>
	<div>
		<label>支付方式：</label>
		<select name="param[payment]">
			<option value="">选择支付方式</option>
			<option value="-1">货到付款支付</option>
			<option value="51">联行支付</option>
		</select>
	</div>
	<div>
		<label>猫币使用数量：</label>
		<input type="text" name="param[usecoins]" />
	</div>
	<div>
		<label>使用的优惠券：</label>
		<input type="text" name="param[coupon_u]" />
	</div>
	<div>
		<label>是否直接购买：</label>
		<input type="text" name="param[is_fast_buy]" value="1"/>
		(0不直接购买，1直接购买)
	</div>