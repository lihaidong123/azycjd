<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute(request.getParameter("needLoadJsp"), "yes");
if(request.getParameter("needLoadJsp").equals("webEditorInfo")||request.getParameter("needLoadJsp").equals("AnzhiWebEditorWorkAction")){
	%>
	<script type="text/javascript">
		window.location.href="<%=request.getContextPath() %>/admin/index.jsp";
	</script>
	<%
	return;
}
response.sendRedirect(request.getContextPath()+"/admin/index.jsp");
%>
