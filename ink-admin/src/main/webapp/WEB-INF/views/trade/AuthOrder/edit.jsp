
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>编辑</title>
	<%@ include file="/gen-commons/taglibs.jsp" %>
</head>
<body>
<div class="title01">
	<h2>修改</h2>
</div>
	<form id="form1" action="${yk}/trade/AuthOrder/update.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					订单号:
				</td>	
				<td>
				<input id="orderId" name="orderId" value="<c:out value="${model.orderId}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					签约申请请求流水号:
				</td>	
				<td>
				<input id="reqId" name="reqId" value="<c:out value="${model.reqId}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					交易码:
				</td>	
				<td>
				<input id="txnCode" name="txnCode" value="<c:out value="${model.txnCode}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					交易名称:
				</td>	
				<td>
				<input id="txnName" name="txnName" value="<c:out value="${model.txnName}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					签约状态:
				</td>	
				<td>
				<input id="status" name="status" value="<c:out value="${model.status}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					渠道编号:
				</td>	
				<td>
				<input id="channelNo" name="channelNo" value="<c:out value="${model.channelNo}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					版本号:
				</td>	
				<td>
				<input id="version" name="version" value="<c:out value="${model.version}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					用户id:
				</td>	
				<td>
				<input id="userId" name="userId" value="<c:out value="${model.userId}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					商户号:
				</td>	
				<td>
				<input id="mchId" name="mchId" value="<c:out value="${model.mchId}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					银行名称简写:
				</td>	
				<td>
				<input id="bankNameShort" name="bankNameShort" value="<c:out value="${model.bankNameShort}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					银行卡号:
				</td>	
				<td>
				<input id="cardNo" name="cardNo" value="<c:out value="${model.cardNo}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					姓名:
				</td>	
				<td>
				<input id="userName" name="userName" value="<c:out value="${model.userName}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					证件号:
				</td>	
				<td>
				<input id="idNo" name="idNo" value="<c:out value="${model.idNo}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					证件类型01-身份证 02-户口本 03-军人身份证 04-港、澳居民往来内地通行证 05-台湾居民来往大陆通行证 06-护照 07-工商营业执照 08-法人证书 09-组织机构代码证 10-其他:
				</td>	
				<td>
				<input id="idType" name="idType" value="<c:out value="${model.idType}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					手机号:
				</td>	
				<td>
				<input id="phone" name="phone" value="<c:out value="${model.phone}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					cvv2:
				</td>	
				<td>
				<input id="cvv2" name="cvv2" value="<c:out value="${model.cvv2}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					有效开始日期:
				</td>	
				<td>
				<input id="expireDate" name="expireDate" value="<c:out value="${model.expireDate}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					最后更新时间:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="lastupdateTimeString" value="<c:out value="${model.lastupdateTimeString}"/>" name="lastupdateTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					创建时间:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="createTimeString" value="<c:out value="${model.createTimeString}"/>" name="createTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					repCode:
				</td>	
				<td>
				<input id="repCode" name="repCode" value="<c:out value="${model.repCode}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					repMsg:
				</td>	
				<td>
				<input id="repMsg" name="repMsg" value="<c:out value="${model.repMsg}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					asileRepCode:
				</td>	
				<td>
				<input id="asileRepCode" name="asileRepCode" value="<c:out value="${model.asileRepCode}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					asileRepMsg:
				</td>	
				<td>
				<input id="asileRepMsg" name="asileRepMsg" value="<c:out value="${model.asileRepMsg}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					银行卡类型0借记卡1贷记卡:
				</td>	
				<td>
				<input id="cardType" name="cardType" value="<c:out value="${model.cardType}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					预签约信息，预签约号:
				</td>	
				<td>
				<input id="signId" name="signId" value="<c:out value="${model.signId}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					渠道返回token:
				</td>	
				<td>
				<input id="token" name="token" value="<c:out value="${model.token}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					tokenCreateTime:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="tokenCreateTimeString" value="<c:out value="${model.tokenCreateTimeString}"/>" name="tokenCreateTimeString" size="10"  readonly="readonly"/>
				
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