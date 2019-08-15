<div>
	<label>商品ID：</label>
	<input type="text" name="param[goods_id]"/>
	(非必须,立即购买时必填)
</div>
<div>
	<label>货品ID：</label>
	<input type="text" name="param[product_id]"/>
	(非必须,立即购买时情况下有规格时必须填写)
</div>
<div>
	<label>数量：</label>
	<input type="text" name="param[num]"/>
	(非必须,立即购买必填)
</div>
<div>
	<label>是否使用预存款：</label>
	<input type="radio" name="param[use_deposit]" value="1" />
	使用
	<input type="radio" name="param[use_deposit]" value="0" />
	不使用
	<div>
		<label>使用猫币：</label>
		<input type="text" name="param[usecoins]" />
		<div>
			<label>支付方式：</label>
			<select name="param[payment]">
				<option>请选择支付方式</option>
				<option value="-1">货到付款</option>
				<option value="59">联行支付</option>
			</select>
		</div>
		<div>
			<label>使用的猫币：</label>
			<input type="number" min="0" name="param[coin]" />
			<div>
				<label>使用的优惠券：</label>
				<input type="text" name="param[coupon_u]" />
				<div>
					<label>是否直接购买：</label>
					<input type="text" name="param[is_fast_buy]" value="1"/>
					(0不直接购买，1直接购买)
				</div>