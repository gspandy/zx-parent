<%@ page import="com.ink.monitor.core.po.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>平台系统编辑</title>
	<%@ include file="/gen-commons/taglibs.jsp" %>
	<script type="text/javascript" src="${yk}/static/common/maintain.js"></script>
</head>
<body>
<div class="title01">
	<h2>修改平台系统信息</h2>
</div>
	<form id="form1" action="${yk}/monitor/dict/source/update.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
			<input id="createTime" name="createTime" value="<c:out value="${model.createTime}"/>" type="hidden"/>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					平台系统名<label style="color: red">*</label>:
				</td>	
				<td>
				<input id="name" name="name" value="<c:out value="${model.name}"/>" type="text" class="input04"  required="true" />
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					平台系统码<label style="color: red">*</label>:
				</td>	
				<td>
				<input id="code" name="code" value="<c:out value="${model.code}"/>" type="text" class="input04" readonly />
				</td>
			</tr>
			<tr>
				<td class="txtr" style="width: 188px">
					节点数:
				</td>	
				<td>
				<input id="count" name="count" value="<c:out value="${model.count}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			<tr>
				<td class="txtr" style="width: 188px">
					Ip列表:
				</td>	
				<td>
				<input id="ipList" name="ipList" value="<c:out value="${model.ipList}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			<tr>
				<td class="txtr" style="width: 188px">
					状态<label style="color: red">*</label>:
				</td>	
				<td>
					<yk:constantConvert htmlTag="select" dataTag="status" name="status" paramValue="${model.status}" sysTag="monitor"/>
				</td>
			</tr>
			<tr>
				<td class="txtr" style="width: 188px">
					描述:
				</td>	
				<td>
				<input id="opDesc" name="opDesc" value="<c:out value="${model.opDesc}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			<tr>	
				<td class="txtc" colspan="2">
					<input type="button" class="btn01" id="subSave" value="提交" />
					<input type="button" class="btn01"  value="取消" onclick="window.close();"/>
					<input type="reset" class="btn01"  value="重置"/>
				</td>	
			</tr>
		</table>
	</form>
	
</body>
<script type="text/javascript">
$(function(){
	var options = {
	         beforeSubmit:   validateForm,   // pre-submit callback 表单提交前被调用的回调函数
	         success:        callBack   // post-submit callback   表单提交成功后被调用的回调函数
	     }; 
	$('#form1').ajaxForm(options);

	$("#subSave").click(function() {
		if (validateLengthFrom("name", 1, "系统名不能为空")
			&&validateLengthFrom("status", 1, "请选择状态")
		) {
			$('#form1').submit();
		}
	});
});

window.onbeforeunload=function(){
	window.opener.document.queryForm.submit();
}

function validateForm(){
	return true;
}
function callBack(data){
	if(data==1)	{
		alert("保存成功！");
		window.close();
	}else{
		alert("保存失败！");
	}
}
</script>
</html>