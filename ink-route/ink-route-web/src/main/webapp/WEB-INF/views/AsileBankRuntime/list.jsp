
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/gen-commons/taglibs.jsp" %>
</head>
<body>
<div class="title01 title01_x">
	<h2>搜索<span class="zksq"><!-- <a href="" title="收起展开"><img alt="展开收起按钮" height="7" src="${yk}/images/zksq.png" width="13" /></a> --></span></h2>
</div>
<form id="queryForm" name="queryForm" action="<c:url value="/AsileBankRuntime/list.do"/>" method="post" style="display: inline;">
	<input type="hidden" id="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>"/>
	<input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>"/>
	<input type="hidden" id="queryType" name="queryType" value="<c:out value="${queryType}" default="0"/>"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table00">
		<tr>	
			<td class="txtr" style="width: 100px">渠道名称：</td>		
			<td>
				&nbsp;<input value="<c:out value="${asileName}"/>" id="asileName" name="asileName" maxlength="16"/>
			</td>
			<td class="txtr" style="width: 100px">渠道编码：</td>		
			<td>
				&nbsp;<input value="<c:out value="${asileCode}"/>" id="asileCode" name="asileCode" maxlength="32"/>
			</td>
			<td class="txtr" style="width: 100px">银行名称：</td>		
			<td>
				&nbsp;<input value="<c:out value="${bankName}"/>" id="bankName" name="bankName" maxlength="16"/>
			</td>
			<td class="txtr" style="width: 100px">银行编码：</td>		
			<td>
				&nbsp;<input value="<c:out value="${bankCode}"/>" id="bankCode" name="bankCode" maxlength="32"/>
			</td>
			</tr>
			<tr>	
			<td class="txtr" style="width: 100px">不可用开始时间：</td>		
			<td>
				&nbsp;<input onClick="WdatePicker()" value="<c:out value="${inactivaStartTimeBegin}"/>" id="inactivaStartTimeBegin" name="inactivaStartTimeBegin" size="10"/>
				<input onClick="WdatePicker()" value="<c:out value="${inactivaStartTimeEnd}"/>" id="inactivaStartTimeEnd" name="inactivaStartTimeEnd" size="10"/>
			</td>
			<td class="txtr" style="width: 100px">不可用结束时间：</td>		
			<td>
				&nbsp;<input onClick="WdatePicker()" value="<c:out value="${inactivaEndTimeBegin}"/>" id="inactivaEndTimeBegin" name="inactivaEndTimeBegin" size="10"/>
				<input onClick="WdatePicker()" value="<c:out value="${inactivaEndTimeEnd}"/>" id="inactivaEndTimeEnd" name="inactivaEndTimeEnd" size="10"/>
			</td>
		</tr>	
	</table>
	<br/>
	<div align="center">
		<input type="submit" class="btn01" value="精确查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('0');"/>
		<input type="submit" class="btn01" value="模糊查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('1');"/>
		<input type="button" class="btn01" value="清 空" id="btnclear"/>
	</div>
</form>
	<br></br>
	<div class="title01">
	<h2>列表</h2>
</div>
		<div class="groupbtn">
			<a href="javascript:void(0)" title="新建" class="btn001" id="btnadd">新增</a>
			<a href="javascript:void(0)" title="修改" class="btn002" id="btnedit">修改</a>
			<a href="javascript:void(0)" title="删除"  class="btn004" id="btndelete">删除</a>
		</div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="tb" class="table02">
			<thead>
			 <tr>
			 	<th><input id="allChoose" type="checkbox"/></th>
			 	<th>序号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>通道名称<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>通道id<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>银行名称<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>银行id<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
<!-- 				<th>通道产品编码<div style="width: 65px; height: 1px; overflow: hidden;"></div></th> -->
<!-- 				<th>通道产品名称<div style="width: 65px; height: 1px; overflow: hidden;"></div></th> -->
				<th>备注<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>创建时间<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<!-- <th>createrId<div style="width: 65px; height: 1px; overflow: hidden;"></div></th> -->
				<th>创建人<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>修改时间<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<!-- <th>updaterId<div style="width: 65px; height: 1px; overflow: hidden;"></div></th> -->
				<th>修改人<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<!-- <th>是否删除<div style="width: 65px; height: 1px; overflow: hidden;"></div></th> -->
<!-- 				<th>版本号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th> -->
				<!-- <th>isActive<div style="width: 65px; height: 1px; overflow: hidden;"></div></th> -->
				<th>不可用开始时间<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>不可用结束时间<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
			    <th>操作<div style="width: 75px; height: 1px; overflow: hidden;"></div></th>
	        </tr>
	        </thead>
			<c:forEach var="entry" items="${page.result}" varStatus="v">
			<tr>
				<td><input name="ids" type="checkbox" value="${entry.id}"/>
				<input name="pkName" type="hidden" id="pkName" value="id"/>
				</td>
				<td>${(page.pageSize*(page.pageNumber-1))+(v.index + 1) }</td>
				<td>
				<div><c:out value="${entry.asileName}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.asileCode}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.bankName}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.bankCode}"/></div>
				</td>
<!-- 				<td> -->
<%-- 				<div><c:out value="${entry.asileProductCode}"/></div> --%>
<!-- 				</td> -->
<!-- 				<td> -->
<%-- 				<div><c:out value="${entry.asileProductName}"/></div> --%>
<!-- 				</td> -->
				<td>
				<div><c:out value="${entry.remark}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.createTimeString}"/></div>
				</td>
				<%-- <td>
				<div><c:out value="${entry.createrId}"/></div>
				</td> --%>
				<td>
				<div><c:out value="${entry.createrName}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.updateTimeString}"/></div>
				</td>
				<%-- <td>
				<div><c:out value="${entry.updaterId}"/></div>
				</td> --%>
				<td>
				<div><c:out value="${entry.updaterName}"/></div>
				</td>
				<%-- <td>
				<div><c:out value="${entry.isDelete}"/></div>
				</td> --%>
<!-- 				<td> -->
<%-- 				<div><c:out value="${entry.version}"/></div> --%>
<!-- 				</td> -->
				<%-- <td>
				<div><c:out value="${entry.isActive}"/></div>
				</td> --%>
				<td>
				<div><c:out value="${entry.inactivaStartTimeString}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.inactivaEndTimeString}"/></div>
				</td>
				<td>
						<a href="#" onclick="show('${entry.id}')">详情</a>&nbsp;
						<a href="#" onclick="edit('${entry.id}')">修改</a>&nbsp;
						<a href="#" onclick="del('${entry.id}')">删除</a>&nbsp;
				</td>
			</tr>
			</c:forEach>
			</table>
     	 <yk:page url="${yk}/AsileBankRuntime/list.do" id="logForm" submitForm="queryForm" joy="true"/>
</div>

<script type="text/javascript">
function show(id){
	window.open('${yk}/AsileBankRuntime/show.do?'+$('#pkName').val()+'='+id,'','height=600,width=600,resizable=yes,location=no,scrollbars');
}
function edit(id){
	window.open('${yk}/AsileBankRuntime/edit.do?'+$('#pkName').val()+'='+id,'','height=600,width=600,resizable=yes,location=no,scrollbars');
}

$(function(){
	
	$('#btnedit').click(function(){
		var $id = $('[name=ids]:checkbox:checked');
		
		if($id.length==0){
			alert("请选择要修改的信息！");
			return false;
		}
		window.open('${yk}/AsileBankRuntime/edit.do?'+$('#pkName').val()+'='+$id.val(),'','height=600,width=600,resizable=yes,location=no,scrollbars');
	});
	
	$('#btnadd').click(function(){
		window.open('${yk}/AsileBankRuntime/create.do','','height=600,width=600,resizable=yes,location=no,scrollbars');
	});
	
	$('#btndelete').click(function(){
		if($('[name=ids]:checkbox:checked').length>0){
			var ids = [];
			$('[name=ids]:checkbox:checked').each(function(){ids.push($(this).val())});
			v_deleteItems(ids);
		}else{
			alert("请选择后进行删除操作！");
		}
		
	});
	
	$('#btnclear').click(function(){
			$('#asileName').val('');
			$('#asileCode').val('');
			$('#bankName').val('');
			$('#bankCode').val('');
			$('#asileProductCode').val('');
			$('#asileProductName').val('');
			$('#remark').val('');
			$('#createTimeBegin').val('');
			$('#createTimeEnd').val('');
			$('#createrId').val('');
			$('#createrName').val('');
			$('#updateTimeBegin').val('');
			$('#updateTimeEnd').val('');
			$('#updaterId').val('');
			$('#updaterName').val('');
			$('#isDelete').val('');
			$('#version').val('');
			$('#isActive').val('');
			$('#inactivaStartTimeBegin').val('');
			$('#inactivaStartTimeEnd').val('');
			$('#inactivaEndTimeBegin').val('');
			$('#inactivaEndTimeEnd').val('');
	});
});

function del(id){
	var ids = [];
	ids.push(id);
	v_deleteItems(ids);
}

function v_deleteItems(ids){
	if(ids.length>0 && confirm("确定要删除吗？")){
		$.post( "${yk}/AsileBankRuntime/delete.do", {"items":ids.join(',')}, 
				function(data){
					if(data=='1'){
						alert('删除成功');
						$('#queryForm').submit();
					}else{
						alert('删除失败');
					}
				}
		);
	}
};
</script>
</body>
</html>


