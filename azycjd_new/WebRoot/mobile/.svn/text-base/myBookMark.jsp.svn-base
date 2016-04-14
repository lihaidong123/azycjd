<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="m_head.jsp"></jsp:include>
<style type="text/css">
	#menu_div_head{ display:none;}
	.shuqianmulv{ margin:0 auto; width:230px; overflow:auto;}
	.shuqianmulv ul{ margin:0px; padding:0px; list-style:none; font-family:"黑体";}
	.shuqianmulv li{ float:left; cursor:pointer; width:110px; line-height:36px; text-align:center; font-weight:bold;}
	.user_div_xss div{ line-height:26px;}
</style>
<div id="shuqian_div">
	<div style="clear:both; line-height:60px; padding-left:15px;font-weight:bold;">
		书签
	</div>
	<div class="table_css_mobile">
		<table width="100%" border="0">
		  <tr style="background-color:#FFFFFF;line-height:45px;font-family:'黑体'; font-weight:bold;">
		 	 <td style="font-size:14px; color:#565454;">小说名称</td>
			<td style="font-size:14px; color:#565454;">章节名称</td>
			<td style="font-size:14px;color:#565454;">书签日期</td>
			<td></td>
		  </tr>
		   <c:forEach items="${markData.list }" var="s" varStatus="ind">
		   	  <tr>
		   	  	<td>${s.novelTitle }</td>
				<td>${s.chapterTitle }</td>
				<td><fmt:formatDate value="${s.addTime}" pattern="yyyy/MM/dd HH:mm"/></td>
				<td><a href="<%=request.getContextPath()%>/mobile/readChapter.do?chapterId=${s.chapterId }&&novelId=${param.novelId }&&&&readAddress=${s.readAddress}">阅读</a></td>
			  </tr>
		   </c:forEach>
		</table>
	</div>
</div>

<jsp:include page="m_foot.jsp"></jsp:include>