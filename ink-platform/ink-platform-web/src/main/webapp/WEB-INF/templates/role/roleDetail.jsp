<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	 <link href="static/js/easyui/1.4.2/themes/bootstrap/easyui.css" rel="stylesheet" type="text/css"/>
    <link href="static/js/easyui/1.4.2/themes/icon.css" rel="stylesheet" type="text/css"/>
    <link href="static/css/main.css" rel="stylesheet" type="text/css"/>
    <script src="static/js/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script src="static/js/easyui/1.4.2/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="static/js/global.js" type="text/javascript"></script>	
    <script src="static/js/easyui/1.4.2/locale/easyui-lang-zh_CN.js"></script>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
</head>
<body>
	<div  class="t_table" style="text-align: center; padding: 10px">
	<table  cellpadding="50" cellspacing="10" style="width: 100%"
				align="center">
				<tr>
						<td>角色标识	:</td>
						<td>
						  <span>${secRole.roleCode }</span>
						</td>
					</tr>
					<tr>
						<td>角色名称:</td>
						<td>
						<span>${secRole.roleName }</span>
							
						</td>
					</tr>
				<tr>
						<td>角色描述:</td>
						<td>
						<span>${secRole.remark }</span>
							
						</td>
					 <tr>
						<td>状态:</td>
						<td>
						<c:if test="${secRole.status ==1}">
						<span>启用</span>
						</c:if>
						<c:if test="${secRole.status ==2}">
						<span>停用</span>
						</c:if>
						<c:if test="${secRole.status ==9}">
						<span>注销</span>
						</c:if>
						</td>
					</tr> 
					<%-- <tr>
						<td>备注:</td>
						<td>
						<span>${secRole.remark }</span>
						
						</td>
					</tr> --%>
					<tr>
						<td>创建人:</td>
						<td>
						<span>${creator}</span>
						</td>
					</tr>
					<tr>
						<td>创建时间:</td>
						<td>
						<%-- ${secRole.createTime } --%>
 						<span><fmt:formatDate value="${secRole.createTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						</td>
					</tr>
					<tr>
						<td>修改时间:</td>
						<td>
					<%-- ${secRole.updateTime}  --%>
 					<span><fmt:formatDate value="${secRole.updateTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						
						</td>
					</tr>
				<tr>
						<td>角色权限:</td>
						<td>
						<div style="width: 200px">
						${roleResource }
						</div>
						
						</td>
					</tr>
				</table>
				</div>
</body>
</html>