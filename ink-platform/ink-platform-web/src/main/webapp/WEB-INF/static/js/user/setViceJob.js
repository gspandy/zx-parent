//设置副岗:只有用户才能
		$('#setViceJob').click(function() {
			var selRow = $('#dg').datagrid("getSelections");//返回选中多行  
			/*if (selRow == null) {
				selRow = $('#dg_tab').datagrid('getSelections');
			}*/
			if (selRow.length  ==0) {
				selRow = $('#dg_user').datagrid('getSelections');
			}
			if (selRow.length  ==0) {
				selRow = $('#dg_alluser').datagrid('getSelections');
			}
			if (selRow.length > 1) {
				$('#dg').datagrid('reload', {
					singleSelect : true,
				});
				$('#dg_tab').datagrid('reload'); 
				$('#dg_user').datagrid('reload'); 
				$('#dg_alluser').datagrid('reload'); 
				$.messager.alert('提示', '请选择一条记录!', 'warning');
				return false;
			}
			var row = $('#dg').datagrid('getSelected');
			//可能是下级资源编辑
			/*if (row == null) {
				row = $('#dg_tab').datagrid('getSelected');
			}*/
			if (row == null) {
				row = $('#dg_user').datagrid('getSelected');
			}
			if (row == null) {
				row = $('#dg_alluser').datagrid('getSelected');
			}
			if (row == null) {
				$.messager.alert({
					title : '提示',
					msg : '请选择一条记录',
					icon : 'warning'
				});
			}
			if (row.subjectType == 1) {
				$.messager.alert('设置副岗', '请选择用户', 'warning');
			}else if (row) {
				$('#win').window({
					href : 'setVicOrg?userId='+ row.id,
					title : '设置副岗'
				});
				$('#win').window('open');
			}
		});