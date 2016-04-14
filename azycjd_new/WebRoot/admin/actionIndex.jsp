<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.anzhi.web.pojo.AnzhiMember"%>
<%@page import="com.anzhi.web.pojo.AnzhiWebEditor"%>
<%
if(session.getAttribute("loginUsers")==null&&session.getAttribute("loginWebEditorUser")==null){
	%>
	<script type="text/javascript">
		window.location.href="<%=request.getContextPath() %>/index.html";
	</script>
	<%
	return;
}
if(session.getAttribute("loginUsers")!=null){
	AnzhiMember am=(AnzhiMember)session.getAttribute("loginUsers");
	if(!am.getMemberType().equals(2)){
		%>
		<script type="text/javascript">
			window.location.href="<%=request.getContextPath() %>/index.html";
		</script>
		<%
		return;
	}
}
if(session.getAttribute("loginWebEditorUser")!=null){
	AnzhiWebEditor am=(AnzhiWebEditor)session.getAttribute("loginWebEditorUser");
	
}
%>
<style type="text/css">
	.Wdate{ width:200px !important;}
</style>