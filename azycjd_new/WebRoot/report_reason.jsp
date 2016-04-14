<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("contextPath", path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<script language="javascript">var path='<%=path%>';</script>
	<script language="javascript">var chapterId='${param.chapterId}';</script>
	<script language="javascript">var novelId='${param.novelId}';</script>
	<script language="javascript">var memberId='${loginUsers.id}';</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index/css/index.css"/>
	<script language="javascript" src="<%=path%>/js/jquery.js"></script>
	<script language="javascript" src="<%=path%>/index/js/validateData.js"></script>
	<script language="javascript" src="<%=path%>/index/js/selectData.js"></script>
	<script language="javascript" src="<%=path%>/index/js/validate.js"></script>
	<jsp:include page="htmlEdit.jsp" flush="false" />
	<script type="text/javascript">
		function saveReportReason(obj){
			if(chapterId==''||novelId==''){
				alert("参数异常");
				return;
			}
			if(memberId==""){
				alert("您还没有登录呢");
				return;
			}
			if($("#reportReason").val()==""||$("#reportVote").val()==""||$("#reportReason").val()==null){
				alert("举报类型或举报描述不能为空");
				return;
			}
			if(confirm("您确定举报该章节吗?")){
				obj.style.display="none";
				$.post(path+"/anzhireport/addAnzhiReport.do",{
					tableId:novelId,
					tableType:chapterId,
					reportReason:$("#reportReason").val(),
					reportVote:$("#reportVote").val()
				},function(res){
					if(res=="yes"){
						alert("举报提交成功！");
						window.parent.window.jBox.close();
					}else{
						alert(res);
						obj.style.display="block";
					}
				});
			}
			
		}
	</script>
  </head>
  
  <body>
    <div>
    	<form class="formCss" id="my_information">
    		<div class="divItemsCss">举报原因：<input type="text" style="width:320px;" class="selectTxtCss" id="reportReasonInput" name="reportReasonInput"></div>
    		<div class="divItemsCss">
				<p>原因具体描述：</p>
				<p><textarea class="htmlEditCss" id="reportVote" name="reportVote" placeholder="请输入举报描述信息" style="height:230px;"></textarea></p>
			</div>
			<div class="divItemsCss">
				<input type="button" value="提交" class="saveBtnCss" onclick="saveReportReason(this)">
			</div>
    	</form>
    	
    </div>
  </body>
</html>
