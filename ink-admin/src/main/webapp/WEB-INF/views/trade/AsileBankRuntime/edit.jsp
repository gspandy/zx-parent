
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/gen-commons/taglibs.jsp" %>
</head>
<body>
<div class="title01">
</div>
	<form id="form1" action="${yk}/trade/AsileBankRuntime/update.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					通道名称:
				</td>	
				<td>
				<yk:constantConvert htmlTag="select" paramValue="${model.asileCode}" dataTag="asileName" codeTag="asileCode" nameTag="asileName" data="${asileInfos}" name="asileCode" isAutoItem="false" emptyTip="0"/>
<%-- 				<input id="asileName" name="asileName" value="<c:out value="${model.asileName}"/>" type="text" class="input04"   /> --%>
				
				</td>
			</tr>
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					通道id: -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<%-- 				<input id="asileCode" name="asileCode" value="<c:out value="${model.asileCode}"/>" type="text" class="input04"   /> --%>
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
			<tr>	
				<td class="txtr" style="width: 188px">
					银行名称:
				</td>	
				<td>
				<yk:constantConvert htmlTag="select" dataTag="bankName" codeTag="bankShortName" paramValue="${model.bankShort}" nameTag="bankName" data="${basicBanks}" name="bankCode" isAutoItem="false" emptyTip="0"/>
<%-- 				<input id="bankName" name="bankName" value="<c:out value="${model.bankName}"/>" type="text" class="input04"   /> --%>
				
				</td>
			</tr>
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					银行id: -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<%-- 				<input id="bankCode" name="bankCode" value="<c:out value="${model.bankCode}"/>" type="text" class="input04"   /> --%>
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					通道产品编码: -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<%-- 				<input id="asileProductCode" name="asileProductCode" value="<c:out value="${model.asileProductCode}"/>" type="text" class="input04"   /> --%>
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					通道产品名称: -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<%-- 				<input id="asileProductName" name="asileProductName" value="<c:out value="${model.asileProductName}"/>" type="text" class="input04"   /> --%>
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
			<tr>	
				<td class="txtr" style="width: 188px">
					备注:
				</td>	
				<td>
				<input id="remark" name="remark" value="<c:out value="${model.remark}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<%-- <tr>	
				<td class="txtr" style="width: 188px">
					创建时间:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="createTimeString" value="<c:out value="${model.createTimeString}"/>" name="createTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					createrId:
				</td>	
				<td>
				<input id="createrId" name="createrId" value="<c:out value="${model.createrId}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					创建人:
				</td>	
				<td>
				<input id="createrName" name="createrName" value="<c:out value="${model.createrName}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					updateTime:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="updateTimeString" value="<c:out value="${model.updateTimeString}"/>" name="updateTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					updaterId:
				</td>	
				<td>
				<input id="updaterId" name="updaterId" value="<c:out value="${model.updaterId}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					updaterName:
				</td>	
				<td>
				<input id="updaterName" name="updaterName" value="<c:out value="${model.updaterName}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					是否删除:
				</td>	
				<td>
				<input id="isDelete" name="isDelete" value="<c:out value="${model.isDelete}"/>" type="text" class="input04"   />
				
				</td>
			</tr> --%>
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					版本号: -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<%-- 				<input id="version" name="version" value="<c:out value="${model.version}"/>" type="text" class="input04"   /> --%>
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
			<%-- <tr>	
				<td class="txtr" style="width: 188px">
					isActive:
				</td>	
				<td>
				<input id="isActive" name="isActive" value="<c:out value="${model.isActive}"/>" type="text" class="input04"   />
				
				</td>
			</tr> --%>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					不可用开始时间:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="inactivaStartTimeString" value="<c:out value="${model.inactivaStartTimeString}"/>" name="inactivaStartTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					不可用结束时间:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="inactivaEndTimeString" value="<c:out value="${model.inactivaEndTimeString}"/>" name="inactivaEndTimeString" size="10"  readonly="readonly"/>
				
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