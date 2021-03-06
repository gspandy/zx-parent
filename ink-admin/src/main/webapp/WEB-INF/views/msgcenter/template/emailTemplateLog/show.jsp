<%@ page import="com.ink.msgcenter.core.po.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=EmailTemplateLog.TABLE_ALIAS%>信息</title>
	<%@ include file="/gen-commons/taglibs.jsp" %>
<link href="${yk}/gen-commons/umeditor1_2_2-utf8-jsp/themes/default/css/umeditor.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" charset="utf-8" src="${yk}/gen-commons/umeditor1_2_2-utf8-jsp/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${yk}/gen-commons/umeditor1_2_2-utf8-jsp/umeditor.min.js"></script>
<script type="text/javascript" src="${yk}/gen-commons/umeditor1_2_2-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
	<div class="title01">
	<h2><%=EmailTemplateLog.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px">模板ID:</td>	
			<td><c:out value="${model.templateId}"/>
			
			</td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">商户:</td>	
			<td>
			<yk:code2name columnName="name" tableName="merchant_info" where=" id=? " paramValue="${model.merctId}" serviceName="msgcenterDubboBaseService"/>
			</td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">商户代码:</td>	
			<td><c:out value="${model.merctCode}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">模板名称:</td>	
			<td><c:out value="${model.tempName}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">模板内容:</td>	
			<td>
				<script type="text/plain" id="myEditor" style="width:350px;height:160px;">
    				${model.tempContent}
				</script>
			</td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">模板类型:</td>	
			<td><c:out value="${model.tempType}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">模板参数:</td>	
			<td><c:out value="${model.tempParam}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">解析方式:</td>	
			<td><c:out value="${model.parseMethod}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">模板备注:</td>	
			<td><c:out value="${model.tempRemark}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">修改内容:</td>	
			<td><c:out value="${model.logRemark}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">操作人ID:</td>	
			<td><c:out value="${model.operatorId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">操作人姓名:</td>	
			<td><c:out value="${model.operatorName}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">操作时间:</td>	
			<td><fmt:formatDate value="${model.operateTime}" pattern="yyyy-mm-dd HH:mm:ss"/></td>
		</tr>
	</table>
	</body>
<script type="text/javascript">
$(function(){
	UM.getEditor('myEditor').setDisabled('fullscreen');
    disableBtn("enable");
});

//实例化编辑器
var um = UM.getEditor('myEditor',{
    toolbars:[[]]
});

</script>
</html>