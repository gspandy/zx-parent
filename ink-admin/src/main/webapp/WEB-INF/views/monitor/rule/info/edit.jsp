<%@ page import="com.ink.monitor.core.po.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>业务监控编辑</title>
	<%@ include file="/gen-commons/taglibs.jsp" %>
	<script type="text/javascript" src="${yk}/static/common/maintain.js"></script>
</head>
<body>
<div class="title01">
	<h2>修改业务监控</h2>
</div>
	<form id="form1" action="${yk}/monitor/rule/info/update.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
			<input id="status" name="status" value="<c:out value="${model.status}"/>" type="hidden"/>
			<input id="createTime" name="createTime" value="<c:out value="${model.createTime}"/>" type="hidden"/>
			<tr>	
				<td class="txtr" style="width: 188px">
					平台系统:
				</td>	
				<td>
					<input id="sysCode" name="sysCode" value="<c:out value="${model.sysCode}"/>" type="hidden" class="input04"  readonly="readonly" />
					<yk:code2name tableName="systerm_source" columnName="name" where="code=?" paramValue="${model.sysCode}" emptyTip="${model.sysCode}" serviceName="monitorDubboBaseService"/>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					功能模块:
				</td>	
				<td>
					<input id="moduleCode" name="moduleCode" value="<c:out value="${model.moduleCode}"/>" type="hidden" class="input04"  readonly="readonly" />
					<yk:code2name tableName="systerm_module" columnName="name" where="code=?" paramValue="${model.moduleCode}" emptyTip="${model.moduleCode}" serviceName="monitorDubboBaseService"/>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					业务模块:
				</td>	
				<td>
					<input id="infoCode" name="infoCode" value="<c:out value="${model.infoCode}"/>" type="hidden" class="input04"  readonly="readonly" />
					<yk:code2name tableName="systerm_info" columnName="name" where="code=?" paramValue="${model.infoCode}" emptyTip="${model.infoCode}" serviceName="monitorDubboBaseService"/>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					预警间隔（单位分钟）:
				</td>	
				<td>
				<input id="warnInterval" name="warnInterval" value="<c:out value="${model.warnInterval}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					预警阀值<label style="color: red">*</label>:
				</td>	
				<td>
				<input id="warnThreshold" name="warnThreshold" value="<c:out value="${model.warnThreshold}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					预警频次<label style="color: red">*</label>:
				</td>	
				<td>
				<input id="warnFrequency" name="warnFrequency" value="<c:out value="${model.warnFrequency}"/>" type="text" class="input04"   />
				
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

	$("#subSave").click(function(){
		if(matchFrom("warnInterval",/^\d+$/,"预警间隔不能为空且必须是数值")
				&& matchFrom("warnThreshold",/^\d+$/,"预警阀值不能为空且必须是数值")
				&& matchFrom("warnFrequency",/^\d+$/,"预警频次不能为空且必须是数值")
		){
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