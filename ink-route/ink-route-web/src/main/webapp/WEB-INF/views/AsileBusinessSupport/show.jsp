
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> 信息</title>
	<%@ include file="/gen-commons/taglibs.jsp" %>
</head>
<body>
	<div class="title01">
	<h2> 详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px">商户号:</td>	
			<td><c:out value="${model.mchId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">渠道号:</td>	
			<td>
			<yk:constantConvert htmlTag="text" dataTag="" data="${asileData}" paramValue="${model.channelNo}" emptyTip=" " codeTag="asileCode" nameTag="asileName"/>
			<%-- <c:out value="${model.channelNo}"/> --%>
			</td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">支付方式:</td>	
			<td>
			
			<yk:constantConvert htmlTag="text" dataTag="" data="${payTypeDate}" paramValue="${model.payType}" emptyTip=" " codeTag="code" nameTag="value"/>
			<%-- <c:out value="${model.payType}"/> --%>
			
			</td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">商户在渠道开通的商户号:</td>	
			<td><c:out value="${model.channelMchId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">渠道提供的终端号:</td>	
			<td><c:out value="${model.terminalId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">证书编号:</td>	
			<td><c:out value="${model.certId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">备注:</td>	
			<td><c:out value="${model.remark}"/></td>
		</tr>
<!-- 		<tr>	 -->
<!-- 			<td class="txtr" style="width: 188px">扩展字段:</td>	 -->
<%-- 			<td><c:out value="${model.ext1}"/></td> --%>
<!-- 		</tr> -->
<!-- 		<tr>	 -->
<!-- 			<td class="txtr" style="width: 188px">1 启用 0 停用:</td>	 -->
<%-- 			<td><c:out value="${model.status}"/></td> --%>
<!-- 		</tr> -->
<!-- 		<tr>	 -->
<!-- 			<td class="txtr" style="width: 188px">扩展字段:</td>	 -->
<%-- 			<td><c:out value="${model.ext2}"/></td> --%>
<!-- 		</tr> -->
		<tr>	
			<td class="txtr" style="width: 188px">创建时间:</td>	
			<td><c:out value="${model.createTimeString}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">最后更新时间:</td>	
			<td><c:out value="${model.lastupdateTimeString}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px">操作人:</td>	
			<td><c:out value="${model.operator}"/></td>
		</tr>
	</table>
	</body>
</html>