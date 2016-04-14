<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<style type="text/css">
	.selectDivCss{margin-left: 552px;}
	.div_css_test{display: none;}
</style>
<script type="text/javascript">
	function showDivFn(id){
		$("#"+id).slideToggle();
	}
</script>
	<form id="AnzhiNewsFormIndex" action="anzhinews/findAnzhiNewsAll.do?pageName=index/my_news_system&&linenumber=5&&newsType=1&&index=4&&chooseIndex=0" method="post" class="formCss">
		 <div class="divTableCss">
				<table class="tableCss" width="100%" >
				    <tr  class="tableTitleCss">
				        <td>序号</td>
				        <td>公告标题</td>
				        <td>公告时间</td>
				        <td>操作</td>
				    </tr>
				    <c:forEach items="${anzhinewsList.list}" var="s" varStatus="ind">
						<tr>
					        <td>${ind.index+1 }</td>
					        <td style="cursor: pointer;" onclick="showDivFn('div${s.id }')"><a style="color: blue">${s.newsTitle }</a></td>
					        <td>${s.addTime }</td>
					        <td><a href="javascript:showDivFn('div${s.id }')">查看</a></td>
					    </tr>
					    <tr>
							<td colspan="4">
								<div id="div${s.id }" class="div_css_test">
									${s.newsContent }
									<br/>[<fmt:formatDate value="${s.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/> ]
								</div>
							</td>
						</tr>
					</c:forEach>
			    </table>
			    <jsp:include page="../next_page.jsp" flush="false">
					<jsp:param value="anzhinews/findAnzhiNewsAll.do?pageName=index/my_news_system&&linenumber=5&&newsType=1&&index=4&&chooseIndex=0" name="url"/>
					<jsp:param value="${anzhinewsList.totalNum }" name="totalNum"/>
					<jsp:param value="${anzhinewsList.num }" name="num"/>
					<jsp:param value="AnzhiNewsFormIndex" name="formId"/>
					<jsp:param value="${anzhinewsList.total }" name="total"/>
					<jsp:param value="${param.size}" name="size"/>
				</jsp:include>
		 </div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>