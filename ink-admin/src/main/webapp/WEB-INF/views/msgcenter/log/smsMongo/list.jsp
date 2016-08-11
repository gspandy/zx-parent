<%@ page import="com.ink.msgcenter.core.po.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=SmsLog.TABLE_ALIAS%> 维护</title>
	<%@ include file="/gen-commons/taglibs.jsp" %>
</head>
<body>
<div class="title01 title01_x">
	<h2>搜索<span class="zksq"><!-- <a href="" title="收起展开"><img alt="展开收起按钮" height="7" src="${yk}/images/zksq.png" width="13" /></a> --></span></h2>
</div>
<form id="queryForm" name="queryForm" action="<c:url value="/msgcenter/SmsMongo/list.do"/>" method="post" style="display: inline;">
	<input type="hidden" id="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>"/>
	<input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>"/>
	<input type="hidden" id="queryType" name="queryType" value="<c:out value="${queryType}" default="0"/>"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table00">
		<tr>	
			<td class="txtr" style="width: 100px">商户：</td>		
			<td>
				<yk:select codeName="name" table="merchant_info" codeValue="id" id="merctId" name="merctId" select="${merctId }" where=" status != 2 " serviceName="msgcenterDubboBaseService"/>
			</td>
			<td class="txtr" style="width: 100px">通道：</td>		
			<td>
				<input type="hidden" id="chnIdvalue" value="${chnId }"></input>
				<select id="chnId" name="chnId">
				</select>
			</td>
			<!-- 
			<td class="txtr" style="width: 100px">商户代码：</td>		
			<td>
				<input value="<c:out value="${merctCode}"/>" id="merctCode" name="merctCode" maxlength="10"/>
			</td>
			 -->
			<td class="txtr" style="width: 100px">模板ID：</td>		
			<td>
				<input value="<c:out value="${tempId}"/>" id="tempId" name="tempId" maxlength="19"/>
			</td>
			<td class="txtr" style="width: 100px">手机号：</td>		
			<td>
				<input value="<c:out value="${mobile}"/>" id="mobile" name="mobile" maxlength="20"/>
			</td>
		</tr>	
		<tr>
			<td class="txtr" style="width: 100px">业务单号：</td>		
			<td>
				<input value="<c:out value="${infoCode}"/>" id="infoCode" name="infoCode" maxlength="50"/>
			</td>	
			<%-- <td class="txtr" style="width: 100px">短信代码：</td>		
			<td>
				<yk:select codeName="sms_code" table="sms_code" codeValue="sms_code" id="smsCode" name="smsCode" select="${smsCode }" where=" status = ? " paramValue="0"></yk:select>
			</td> --%>
			<td class="txtr" style="width: 100px">发送状态：</td>		
			<td>
				<select id="sendStatus" name="sendStatus">
					<option value="" <c:if test="${sendStatus == ''}">selected="selected"</c:if>>不限</option>
					<option value="0" <c:if test="${sendStatus eq '0'}">selected="selected"</c:if>>待发送</option>	
					<option value="1" <c:if test="${sendStatus eq '1'}">selected="selected"</c:if>>已发送</option>
					<option value="2" <c:if test="${sendStatus eq '2'}">selected="selected"</c:if>>发送失败</option>
				</select>			
			</td>
			<td class="txtr" style="width: 100px">响应代码：</td>		
			<td>
				<input value="<c:out value="${responseCode}"/>" id="responseCode" name="responseCode" maxlength="5"/>
			</td>
			<td class="txtr" style="width: 100px">短信类型：</td>		
			<td>
				<select id="smsType" name="smsType">
					<option value="" <c:if test="${smsType == ''}">selected="selected"</c:if>>不限</option>
					<option value="1" <c:if test="${smsType eq '1'}">selected="selected"</c:if>>下行短信</option>
					<option value="2" <c:if test="${smsType eq '2'}">selected="selected"</c:if>>上行短信</option>
				</select>	
			</td>
		</tr>	
		<%-- <tr>
			
			<td class="txtr" style="width: 100px">状态报告：</td>		
			<td>
				<select id="reportStatus" name="reportStatus">
					<option value="" <c:if test="${reportStatus == ''}">selected="selected"</c:if>>不限</option>
					<option value="1" <c:if test="${reportStatus eq '0'}">selected="selected"</c:if>>未接受</option>
					<option value="2" <c:if test="${reportStatus eq '1'}">selected="selected"</c:if>>已接受</option>
				</select>	
			</td>
		</tr> --%>
	</table>
	<br/>
	<div align="center">
		<input type="submit" class="btn01" value="精确查询" onclick="return check()"/>
		<!-- <input type="submit" class="btn01" value="模糊查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('1');"/> -->
		<input type="button" class="btn01" value="清 空" id="btnclear"/>
	</div>
</form>
	<br></br>
	<div class="title01">
	<h2><%=SmsLog.TABLE_ALIAS%>列表</h2>
</div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="tb" class="table02">
			<thead>
			 <tr>
			 	<th>序号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>商户<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>商户代码<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>模板ID<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>手机号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>短信内容<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>业务单号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<!-- <th>短信代码<div style="width: 65px; height: 1px; overflow: hidden;"></div></th> -->
				<th>发送状态<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>响应代码<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>短信类型<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<!-- <th>状态报告<div style="width: 65px; height: 1px; overflow: hidden;"></div></th> -->
				<th>提交时间<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>发送时间<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
			    <th>操作<div style="width: 75px; height: 1px; overflow: hidden;"></div></th>
	        </tr>
	        </thead>
			<c:forEach var="entry" items="${page.result}" varStatus="v">
			<tr>
				<input name="pkName" type="hidden" id="pkName" value="id"/>
				<td>${v.index + 1 }</td>
				<td>
				<div  style="width:100px;white-space:nowrap; text-overflow:ellipsis; -o-text-overflow:ellipsis; overflow: hidden; ">
					<yk:code2name columnName="name" tableName="merchant_info" where="id = ?" paramValue="${entry.merctId}" serviceName="msgcenterDubboBaseService"/>
				</div>
				</td>
				<td>
				<div><c:out value="${entry.merctCode}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.tempId}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.mobile}"/></div>
				</td>
				<td title="${entry.smsMsg}">
				<div style="width:150px;white-space:nowrap; text-overflow:ellipsis; -o-text-overflow:ellipsis; overflow: hidden; "><c:out value="${entry.smsMsg}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.infoCode}"/></div>
				</td>
				<%-- <td>
				<div><c:out value="${entry.smsCode}"/></div>
				</td> --%>
				<td>
				<div>
					<c:choose>
						<c:when test="${entry.sendStatus == 0}">待发送</c:when>
						<c:when test="${entry.sendStatus == 1}">已发送</c:when>
						<c:when test="${entry.sendStatus == 2}">发送失败</c:when>
						<c:otherwise>未定义</c:otherwise>
					</c:choose>
				</div>
				</td>
				<td>
				<div><c:out value="${entry.responseCode}"/></div>
				</td>
				<td>
				<div>
					<c:choose>
						<c:when test="${entry.smsType == 0}">上行短信</c:when>
						<c:when test="${entry.smsType == 1}">下行短信</c:when>
						<c:otherwise>未定义</c:otherwise>
					</c:choose>
				</div>
				</td>
				<%-- <td>
				<div><c:out value="${entry.reportStatus}"/></div>
				</td> --%>
				<td>
				<div><c:out value="${entry.submitTimeString}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.sendTimeString}"/></div>
				</td>
				<td>
						<a href="#" onclick="show('${entry.id}','${entry.merctCode }')">详情</a>&nbsp;
						<!-- <a href="#" onclick="edit('${entry.id}')">修改</a>&nbsp;
						<a href="#" onclick="del('${entry.id}')">删除</a>&nbsp; -->
				</td>
			</tr>
			</c:forEach>
			</table>
     	 <yk:page url="${yk}/msgcenter/SmsMongoLog/list.do" id="logForm" submitForm="queryForm" joy="true"/>
</div>

<script type="text/javascript">
function show(id, merctCode){
	window.open('${yk}/msgcenter/SmsMongo/show.do?'+$('#pkName').val()+'='+id+'&merctCode='+merctCode,'','height=600,width=1000,resizable=yes,location=no,scrollbars');
}

function check(){
	$('#pageNumber').val('1');
	$('#pageSize').val('10');
	$('#queryType').val('0');
	if($.trim($('#merctId').val()) == ""){
		alert('请选择商户!');
		return false;
	}
}

$(function(){
	$('#btnclear').click(function(){
			$('#merctId').val('');
			$('#merctCode').val('');
			$('#chnId').val('');
			$('#chnCode').val('');
			$('#tempId').val('');
			$('#mobile').val('');
			$('#smsMsg').val('');
			$('#infoCode').val('');
			$('#smsCode').val('');
			$('#priority').val('');
			$('#smsId').val('');
			$('#taskId').val('');
			$('#sendStatus').val('');
			$('#responseCode').val('');
			$('#smsType').val('');
			$('#reportStatus').val('');
			$('#submitTimeBegin').val('');
			$('#submitTimeEnd').val('');
			$('#sendTimeBegin').val('');
			$('#sendTimeEnd').val('');
			$('#fixTimeBegin').val('');
			$('#fixTimeEnd').val('');
			$('#reportTimeBegin').val('');
			$('#reportTimeEnd').val('');
			$('#sendException').val('');
	});
	
	$('#merctId').change(function(){ 
		/* $.post("${yk}/merchant/merchantInfo/get.do",{id:$("#merctId").val()},function(data){
			$("#merctCode").val(data.sn);
		},'json'); */
		$('#chnId').empty();
		$('#chnId').append('<option value="">未选择</option>');
		$.post("${yk}/msgcenter/merchant/merchantChn/findSmsByMerctId.do",{merctId:$("#merctId").val()},function(data){
			$.each(data,function(i,value){
				console.info(value);
				var chnv = $("#chnIdvalue").val();
				if(value.id == chnv){
					$("#chnId").append('<option value="'+value.id+'" selected="selected">'+value.name+'</option>');
				}
				$("#chnId").append('<option value="'+value.id+'">'+value.name+'</option>');
			});
		},'json');
		
	}); 
	
	if($("#merctId").val() != ''){
		$('#chnId').append('<option value="">未选择</option>');
		$.post("${yk}/msgcenter/merchant/merchantChn/findSmsByMerctId.do",{merctId:$("#merctId").val()},function(data){
			$.each(data,function(i,value){
				console.info(value);
				var chnv = $("#chnIdvalue").val();
				if(value.id == chnv){
					$("#chnId").append('<option value="'+value.id+'" selected="selected">'+value.name+'</option>');
				}else{
					$("#chnId").append('<option value="'+value.id+'">'+value.name+'</option>');
				}
				
			});
		},'json');
	}
});


</script>
</body>
</html>


