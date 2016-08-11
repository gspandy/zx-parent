
//数据表格
var id = treeRow.id
var url;
var treeType =treeRow.attributes.treeType

$(function(){ 
 if(treeType=="资源"){
		$('#dg').datagrid({  
		    url:'resourceInfo?id='+id,   
		    fitColumns : true,
			pagination : true,
			remoteFilter : true,
			rownumbers : true,
			pageList : [10],//可以设置每页记录条数的列表  
			pageSize : 10,//每页显示的记录条数，默认为10  
	/* 		queryParams : params, */
			sortName : 'createTime',
			sortOrder : 'desc',
			remoteSort : false,
			singleSelect : false,
		    columns: [
		  			[{
		  				field: 'ck',
		  				checkbox: true
		  			}, {
		  				field: 'id',
		  				title: "id",
		  				hidden:true
		  			},
		  			{
		  				field: 'remark',
		  				title: "remark",
		  				hidden:true
		  			},
		  			 {
		  				field: 'pid',
		  				title: "pid",
		  				hidden:true
		  			},
		  			 {
		  				field: 'sysCode',
		  				title: "平台标识",
		  			},
		  			
		  			{
		  				field: 'resourceName',
		  				title: "资源名称",
		  				align:'center',
		  				width:100,
		  				formatter : function(value, rowData,rowIndex) {
							url='resourceDetails?id='+rowData.id+'&pid='+rowData.pid;
							return "<a href='javascript:;'  onclick='openResouWindow(\""
									+ url
									+ "\")'><font color='blue'>"
									+ value + "</font></a>";
						}
		  			}, 
		  			{
		  				field: 'operationTree',
		  				title: "功能权限",
		  				align:'center',
		  				width:100
		  			},{
		  				field: 'resourceLevel',
		  				title: "资源级别",
		  				align:'center',
		  				width:100
		  			}, {
		  				field: 'position',
		  				title: "资源位置",
		  				align:'center',
		  				width:100,
		  			},
		  			{
		  				field: 'permission',
		  				title: "权限表达式",
		  				align:'center',
		  				width:100,
		  			},
		  			
		  			/*{
		  				field: 'resourcePosition',
		  				title: "资源位置",
		  				align:'center',
		  				width:100,
		  			},*/{
		  				field: 'creator',
		  				title: "创建人",
		  				align:'center',
		  				width:100,
		  			},
		  			{
		  			    field: 'status',
		  				title: "状态",
		  				align:'center',
		  				width:100,
		  				formatter:function(value){
							return convertRoleStatus(value);
							}
		  			}, {
		  				field: 'createTime',
		  				title: "创建时间",
		  				align:'center',
		  				width:100,
		  				formatter:function(value,rowData,rowIndex){
		  					return new Date(value).dateFormat ("yyyy-MM-dd hh:mm:ss");}
		  			}, {
		  				field:'updateTime',
		  				title: "修改时间",
		  				align:'center',
		  				width:100,
		  				formatter:function(value,rowData,rowIndex){
		  					 if(value==null){
								 return null;
							 }else{
								return new Date(value).dateFormat ("yyyy-MM-dd hh:mm:ss");

							 } }
		  			}]
		  		]
		  	
		});  
	}
});



 function openPlatWindow(url) {
		$('#win').window({
			href :url,
			title : '平台详情'
		});
		$('#win').window('open');
	}
 function openResouWindow(url) {
	
		$('#win').window({
			href :url,
			title : '资源详情'
		});
		$('#win').window('open');
	}