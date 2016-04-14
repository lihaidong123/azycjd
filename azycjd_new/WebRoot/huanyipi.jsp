<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:forEach items="${morelist.list }" var="s" end="1">
	<div class="huanyipi">
		<table width="100%" border="0">
		  <tr>
			<td>
				<div class="recommand_3_css">
					<div class="title_self_css">${s.novelTitle }</div>
					<div>——</div>
					<div>
						${s.authorWriterName } 著
					</div> 
					<div class="book_info">
						${s.vote }
					</div>
					<div>
						<div class="self_btn" style="margin-left:0px;"  onclick="window.location.href='<%=request.getContextPath()%>/novel/${s.id }.jsp'">立刻阅读</div>
					</div>
				</div>
			</td>
			<td width="205">
				<img src="${s.novelImg }" width="205" height="290" onclick="window.location.href='<%=request.getContextPath()%>/novel/${s.id }.jsp'"/>
			</td>
		  </tr>
		</table>
	</div>
</c:forEach>
<script language="javascript">
	$(function(){
		getHtmlContent("book_info",80);
	});
</script>