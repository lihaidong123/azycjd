<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="m_head.jsp"></jsp:include>
<%
	if(session.getAttribute("loginUsers")==null){
		%>
		<script type="text/javascript">
			window.location.href=path+"/mobile/m_login.jsp";
		</script>
		<%
		return;
	}
 %>
 <script type="text/javascript">
	$(function(){
		$(".shujiabookinfo").css("margin-left",($("#main_contnt_div").width()-142*2)/3+"px");
	});
</script>
<div>
	<div class="shujia_one" style="display: none;">
		<div><img src="<%=request.getContextPath() %>/mobile/images/meiridaodu.png" width="75px" height="40px"></img></div>
		<div style="margin-left:5px;font-size: 14px;">
			<div>第15章 我说走了吗？--《透视眼神》</div>
			<div style="clear: both;">作者：薯条</div>
		</div>
	</div>
	<div class="shujialist">
	   <c:forEach items="${shujialist.list}" var="s" varStatus="ind">
		<div class="shujiabookinfo">
			<div class="sj_name" style="height: auto;padding-top: 3px;" id="imgnovel${shujialist }@${s.id}" onclick="loadNovel(${s.novelId})">
				<img src="${s.novelImg }" width="136"/>
			</div>
			<div class="sj_name" style="font-family:'微软雅黑';padding-top: 3px; font-weight: bold;" id="novel${shujialist }@${s.id}" onclick="loadNovel(${s.novelId})">
				${fn:substring(s.novelTitle,0,8) }
			</div>
			<div class="sj_zuozhe">
				作者:${s.authorWriterName }
			</div>
		</div>
	  </c:forEach>
	</div>
</div>
<jsp:include page="m_foot.jsp"></jsp:include>
