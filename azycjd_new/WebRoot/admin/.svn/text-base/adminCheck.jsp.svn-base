<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/admin.css"/>
	<script language="javascript" src="<%=path %>/js/jquery.js"></script>
	<script language="javascript">var path='<%=path %>';</script>
	<script language="javascript">var tableId='${param.tableId}';</script>
	<script language="javascript">var types='${param.types}';</script>
	<script type="text/javascript">
		function saveCheck(){
			if(confirm("您确定保存审核结果吗?")){
				$.post(path+"/anzhihandle/adminCheck.do",{
					tableId:tableId,
					types:types,
					vote:$("#jujueyuanyin").val(),
					state:$("#tongguo")[0].checked?1:0
				},function(res){
					alert(res);
					window.parent.window.jBox.close();
				});
			}
		}
	</script>
  </head>
  
  <body>
   
	<div class="inputItemsCssss">
		<div class="textItem">审批处理:<input type="radio" id="tongguo" name="checkState" checked="checked" value="0"/>通过<input type="radio" id="jujue" name="checkState" value="1"/>拒绝</div>
		<div class="textItem">拒绝原因:
			<textarea style="width:80%; height: 100px;" id="jujueyuanyin"></textarea>
		</div>
		<div class="textItem">
			<input type="button" class="saveBtnCss" value="审核" onclick="saveCheck()"/>
		</div>
	</div>
  </body>
</html>
