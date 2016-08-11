
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>维护</title>
	<%@ include file="/gen-commons/taglibs.jsp" %>
</head>
<body>
<div class="title01 title01_x">
	<h2>搜索<span class="zksq"><!-- <a href="" title="收起展开"><img alt="展开收起按钮" height="7" src="${yk}/images/zksq.png" width="13" /></a> --></span></h2>
</div>
<form id="queryForm" name="queryForm" action="<c:url value="/trade/AsileBusiness/list.do"/>" method="post" style="display: inline;">
	<input type="hidden" id="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>"/>
	<input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>"/>
	<input type="hidden" id="queryType" name="queryType" value="<c:out value="${queryType}" default="0"/>"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table00">
		<tr>	
			<td class="txtr" style="width: 100px">业务编码：</td>		
			<td>
				&nbsp;<input value="<c:out value="${businessCode}"/>" id="businessCode" name="businessCode" maxlength="5"/>
			</td>
			<td class="txtr" style="width: 100px">业务名称：</td>		
			<td>
				&nbsp;<input value="<c:out value="${businessName}"/>" id="businessName" name="businessName" maxlength="20"/>
			</td>
			<%-- <td class="txtr" style="width: 100px">备注：</td>		
			<td>
				&nbsp;<input value="<c:out value="${remark}"/>" id="remark" name="remark" maxlength="256"/>
			</td>
			<td class="txtr" style="width: 100px">创建时间：</td>		
			<td>
				&nbsp;<input onClick="WdatePicker()" value="<c:out value="${createTimeBegin}"/>" id="createTimeBegin" name="createTimeBegin" size="10"/>
				<input onClick="WdatePicker()" value="<c:out value="${createTimeEnd}"/>" id="createTimeEnd" name="createTimeEnd" size="10"/>
			</td> --%>
		</tr>	
		<tr>	
			<td class="txtr" style="width: 100px">调用方式：</td>		
			<td>
				&nbsp;
				<yk:constantConvert htmlTag="select" dataTag="" data="${statusData}" paramValue="${isSyn}" emptyTip=" " codeTag="code" nameTag="value" name="isSyn"/>
				<%-- <input value="<c:out value="${isSyn}"/>" id="isSyn" name="isSyn" maxlength="10"/> --%>
			</td> 
			<td class="txtr" style="width: 100px">渠道编号：</td>		
			<td>
				&nbsp;
				<yk:constantConvert htmlTag="select" dataTag="" data="${asileData}" paramValue="${asileCode}" emptyTip=" " codeTag="asileCode" nameTag="asileName" name="asileCode"/>
				<%-- <input value="<c:out value="${asileCode}"/>" id="asileCode" name="asileCode" maxlength="8"/> --%>
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
				<th>业务code<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>业务名称<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>备注<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>创建时间<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>调用方式<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>渠道编号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
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
				<div><c:out value="${entry.businessCode}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.businessName}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.remark}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.createTimeString}"/></div>
				</td>
				<td>
				<div>
				<yk:constantConvert htmlTag="text" dataTag="" data="${statusData}" paramValue="${entry.isSyn}" emptyTip=" " codeTag="code" nameTag="value"/>
				<%-- <c:out value="${entry.isSyn}"/> --%>
				</div>
				</td>
				<td>
				<div>
				<yk:constantConvert htmlTag="text" dataTag="" data="${asileData}" paramValue="${entry.asileCode}" emptyTip=" " codeTag="asileCode" nameTag="asileName"/>
				<%-- <c:out value="${entry.asileCode}"/> --%>
				</div>
				</td>
				<td>
						<a href="#" onclick="show('${entry.id}')">详情</a>&nbsp;
						<a href="#" onclick="edit('${entry.id}')">修改</a>&nbsp;
						<a href="#" onclick="del('${entry.id}')">删除</a>&nbsp;
				</td>
			</tr>
			</c:forEach>
			</table>
     	 <yk:page url="${yk}/trade/AsileBusiness/list.do" id="logForm" submitForm="queryForm" joy="true"/>
</div>

<script type="text/javascript">
function show(id){
	window.open('${yk}/trade/AsileBusiness/show.do?'+$('#pkName').val()+'='+id,'','height=600,width=600,resizable=yes,location=no,scrollbars');
}
function edit(id){
	window.open('${yk}/trade/AsileBusiness/edit.do?'+$('#pkName').val()+'='+id,'','height=600,width=600,resizable=yes,location=no,scrollbars');
}

$(function(){
	
	$('#btnedit').click(function(){
		var $id = $('[name=ids]:checkbox:checked');
		
		if($id.length==0){
			alert("请选择要修改的信息！");
			return false;
		}
		window.open('${yk}/trade/AsileBusiness/edit.do?'+$('#pkName').val()+'='+$id.val(),'','height=600,width=600,resizable=yes,location=no,scrollbars');
	});
	
	$('#btnadd').click(function(){
		window.open('${yk}/trade/AsileBusiness/create.do','','height=600,width=600,resizable=yes,location=no,scrollbars');
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
			$('#businessCode').val('');
			$('#businessName').val('');
			$('#remark').val('');
			$('#createTimeBegin').val('');
			$('#createTimeEnd').val('');
			$('#isSyn').val('');
			$('#asileCode').val('');
	});
});

function del(id){
	var ids = [];
	ids.push(id);
	v_deleteItems(ids);
}

function v_deleteItems(ids){
	if(ids.length>0 && confirm("确定要删除吗？")){
		$.post( "${yk}/trade/AsileBusiness/delete.do", {"items":ids.join(',')}, 
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


