
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>编辑</title>
	<%@ include file="/gen-commons/taglibs.jsp" %>
</head>
<body>
<div class="title01">
	<h2>修改/h2>
</div>
	<form id="form1" action="${yk}/trade/AsileBusiness/update.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					业务code:
				</td>	
				<td>
				<input id="businessCode" name="businessCode" value="<c:out value="${model.businessCode}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					业务名称:
				</td>	
				<td>
				<input id="businessName" name="businessName" value="<c:out value="${model.businessName}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			
			
			<%-- <tr>	
				<td class="txtr" style="width: 188px">
					创建时间:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="createTimeString" value="<c:out value="${model.createTimeString}"/>" name="createTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr> --%>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					调用方式:
				</td>	
				<td>
				<yk:constantConvert  htmlTag="select" dataTag="" data="${statusData}" paramValue="${model.isSyn}" emptyTip="1" codeTag="code"  isAutoItem="false" nameTag="value" name="isSyn" />
				<%-- <input id="isSyn" name="isSyn" value="<c:out value="${model.isSyn}"/>" type="text" class="input04"   /> --%>
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					渠道编号:
				</td>	
				<td>
				<yk:constantConvert  htmlTag="select" dataTag="" data="${asileData}" paramValue="${model.asileCode}" emptyTip="1" codeTag="asileCode"  isAutoItem="false" nameTag="asileName" name="asileCode" />
				<%-- <input id="asileCode" name="asileCode" value="<c:out value="${model.asileCode}"/>" type="text" class="input04"   /> --%>
				
				</td>
			</tr>
			<tr>	
				<td class="txtr" style="width: 188px">
					备注:
				</td>	
				<td>
				<input id="remark" name="remark" value="<c:out value="${model.remark}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			<tr>	
				<td class="txtc" colspan="2">
					<input type="button" class="btn01"  value="提交" onclick="$('#form1').submit();"/>
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