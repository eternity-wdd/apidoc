Vue.component('component-api-params', {
	data: function(){
		return {
			tableData: [],
			dialogFormVisible:false,
		}
	},
	methods: {
		onAddParam: function(){
			alert(111);
		}
	},
	
  template: '<div>\
      <el-table :data="tableData" stripe style="width: 100%">\
<el-table-column prop="date" label="参数名称" width="180"></el-table-column>\
<el-table-column prop="date" label="参数说明" width="180"></el-table-column>\
<el-table-column prop="date" label="详细描述" width="180"></el-table-column>\
<el-table-column prop="date" label="参数类型" width="180"></el-table-column>\
<el-table-column prop="date" label="优先级" width="180"></el-table-column>\
<el-table-column prop="date" label="是否必填" width="180"></el-table-column>\
<el-table-column prop="date" label="前台展现形式" width=""></el-table-column>\
</el-table>\
<el-row type="flex" justify="space-between"><el-col :span="24" style="text-align:center;background:#fff;padding:10px;"><el-button type="primary" @click="dialogFormVisible = true">添加</el-button></el-col></el-row>\
</div>'
})