
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/gen-commons/taglibs.jsp" %>
</head>
<body>
<div class="title01">
</div>
	<form id="form1" action="${yk}/AsileBank/save.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					通道名称<label style="color: red">*</label>：
				</td>	
				<td>
				<yk:constantConvert htmlTag="select" dataTag="asileName" codeTag="id" nameTag="asileName" data="${asileInfos}" name="asileId" isAutoItem="false" emptyTip="0"/>
				
				</td>
			</tr>
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					通道id<label style="color: red">*</label>： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<%-- 				<yk:constantConvert htmlTag="select" dataTag="asileCode" codeTag="asileCode" nameTag="asileCode" data="${asileInfos}" name="asileCode" isAutoItem="false" emptyTip="0"/> --%>
 <!-- 				<input id="asileCode" name="asileCode" type="text" class="input04"   /> --> 
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
			<tr>	
				<td class="txtr" style="width: 188px">
					银行名称<label style="color: red">*</label>：
				</td>	
				<td>
				<yk:constantConvert htmlTag="select" dataTag="bankName" codeTag="id" nameTag="bankName" data="${basicBanks}" name="bankId" isAutoItem="false" emptyTip="0"/>
<!-- 				<input id="bankName" name="bankName" type="text" class="input04"   /> -->
				
				</td>
			</tr>
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					银行id<label style="color: red">*</label>： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="bankCode" name="bankCode" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					通道产品编码： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="asileProductCode" name="asileProductCode" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					通道产品名称： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="asileProductName" name="asileProductName" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					是否直连： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="asileDirectBank" name="asileDirectBank" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					对公对私： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="asilePublicPrivate" name="asilePublicPrivate" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					提供接口方式： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="asileIntefaceType" name="asileIntefaceType" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					鉴权方式： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="asileAuthType" name="asileAuthType" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					鉴权要素(转换为二进制位数表示)： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="asileAuthElements" name="asileAuthElements" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					授权方式： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="asileAuthMode" name="asileAuthMode" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					支持银行卡类型： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="asileBankType" name="asileBankType" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
			<tr>	
				<td class="txtr" style="width: 188px">
					支付类型<label style="color: red">*</label>：
				</td>	
				<td>
				<yk:constantConvert htmlTag="select" dataTag="asilePayType" codeTag="code" nameTag="value" data="${routeBusinessType}" name="asilePayType" isAutoItem="false" emptyTip="0"/>
<!-- 				<input id="asilePayType" name="asilePayType" type="text" class="input04"   /> -->
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					单笔限额<label style="color: red">*</label>：
				</td>	
				<td>
				<input id="asileCrashLimit" name="asileCrashLimit" type="text" class="input04"   />
				
				</td>
			</tr>
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					单卡单日限额： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="cardCrashDayLimit" name="cardCrashDayLimit" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					单卡单月限额： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="cardCrashMonthLimit" name="cardCrashMonthLimit" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					单卡单日限额： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="cardDayLimits" name="cardDayLimits" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					批量限额： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="batchCrashLimit" name="batchCrashLimit" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					批量限次： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="batchLimit" name="batchLimit" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
			<tr>	
				<td class="txtr" style="width: 188px">
					备注：
				</td>	
				<td>
				<input id="remark" name="remark" type="text" class="input04"   />
				
				</td>
			</tr>
			
		<!-- 	<tr>	
				<td class="txtr" style="width: 188px">
					创建时间：
				</td>	
				<td>
				<input onClick="WdatePicker()" id="createTimeString" name="createTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr> -->
			
			<!-- <tr>	
				<td class="txtr" style="width: 188px">
					createrId：
				</td>	
				<td>
				<input id="createrId" name="createrId" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					创建人：
				</td>	
				<td>
				<input id="createrName" name="createrName" type="text" class="input04"   />
				
				</td>
			</tr> -->
			
			<!-- <tr>	
				<td class="txtr" style="width: 188px">
					updateTime：
				</td>	
				<td>
				<input onClick="WdatePicker()" id="updateTimeString" name="updateTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					updaterId：
				</td>	
				<td>
				<input id="updaterId" name="updaterId" type="text" class="input04"   />
				
				</td>
			</tr> 
			
			<tr>	
				<td class="txtr" style="width: 188px">
					updaterName：
				</td>	
				<td>
				<input id="updaterName" name="updaterName" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					是否删除：
				</td>	
				<td>
				<input id="isDelete" name="isDelete" type="text" class="input04"   />
				
				</td>
			</tr>
			-->
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					回盘时间： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input onClick="WdatePicker()" id="asileOnlyTimeString" name="asileOnlyTimeString" size="10"  readonly="readonly"/> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
			<tr>	
				<td class="txtr" style="width: 188px">
					通道服务开始时间：
				</td>	
				<td>
				<input onClick="WdatePicker()" id="asileServiceBeginTimeString" name="asileServiceBeginTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					通道服务结束时间：
				</td>	
				<td>
				<input onClick="WdatePicker()" id="asileServiceEndTimeString" name="asileServiceEndTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					优先级： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="priority" name="priority" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					0是分离，1是不分： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="borrowSplit" name="borrowSplit" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<!-- 					短信发送方： -->
<!-- 				</td>	 -->
<!-- 				<td> -->
<!-- 				<input id="smsSender" name="smsSender" type="text" class="input04"   /> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			
			<tr>	
				<td class="txtr" style="width: 188px">
					银行简码：
				</td>	
				<td>
				<input id="bankShort" name="bankShort" type="text" class="input04"   />
				
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

