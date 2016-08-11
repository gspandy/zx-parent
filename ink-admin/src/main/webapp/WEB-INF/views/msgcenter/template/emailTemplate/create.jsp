<%@ page import="com.ink.msgcenter.core.po.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=EmailTemplate.TABLE_ALIAS%>新增</title>
	<%@ include file="/gen-commons/taglibs.jsp" %>
<script type="text/javascript" charset="utf-8" src="${yk}/gen-commons/ueditor1_4_3_2/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${yk}/gen-commons/ueditor1_4_3_2/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${yk}/gen-commons/ueditor1_4_3_2/lang/zh-cn/zh-cn.js"></script>

<style type="text/css">
    div{
        width:100%;
    }
</style>
</head>
<body>
<div class="title01">
	<h2>新增<%=EmailTemplate.TABLE_ALIAS%></h2>
</div>
	<form id="form1" action="${yk}/msgcenter/EmailTemplate/save.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
			<input id="status" name="status" type="hidden" value="0"/>
			<tr>	
				<td class="txtr" style="width: 188px">
					商户ID：
				</td>	
				<td>
				<yk:select codeName="name" table="merchant_info" codeValue="id" id="merctId" name="merctId"  serviceName="msgcenterDubboBaseService"/>
				</td>
			</tr>
			<tr>
				<td class="txtr" style="width: 188px">
					模板名称：
				</td>	
				<td>
				<input id="tempName" name="tempName" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					邮件主题：
				</td>	
				<td>
				<input id="mailSubject" name="mailSubject" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					模板内容：
				</td>	
				<td>
				<script id="editor" type="text/plain" style="width:350px;height:300px;"></script>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					模板类型 ：
				</td>	
				<td>
					<yk:constantConvert htmlTag="select" dataTag="tempType" name="tempType" emptyTip="1" isAutoItem="false" sysTag="msgcenter"/>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					解析方式 ：
				</td>	
				<td>
					<yk:constantConvert htmlTag="select" dataTag="parseMethod" name="parseMethod" emptyTip="1" isAutoItem="false" sysTag="msgcenter"/>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					模板备注：
				</td>	
				<td>
				<input id="tempRemark" name="tempRemark" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					模板参数：
				</td>	
				<td>
				<input id="tempParam" name="tempParam" type="text" class="input04"   />
				
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

var editor = UE.getEditor('editor',{  
	//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个  
	toolbars:[['fullscreen', 'source', '|', 'undo', 'redo', '|',  
               'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',  
               'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',  
               'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',  
               'directionalityltr', 'directionalityrtl', 'indent', '|',  
               'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',  
               'link', 'unlink', 'anchor',  '|',  
               'horizontal', 'date', 'time', 'spechars', '|',  
               'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',  
               'print', 'preview', 'searchreplace', 'help', 'drafts']  ],  
	//focus时自动清空初始化时的内容  
	autoClearinitialContent:true,  
	//关闭字数统计  
	wordCount:false,  
	//关闭elementPath  
	elementPathEnabled:false
});  
</script>
</html>

