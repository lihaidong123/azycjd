<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			推荐位管理
		</div>
	</div>
	<form id="AnzhiRecommendForm" action="anzhirecommend/findAnzhiRecommendAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText' id="advTyperecommendPositions">
				<script language="javascript">
					showSelect("recommendPositions","recommendPositions","${param.recommendPositions}",recommendPositionTypeData,"advTyperecommendPositions","推荐位置：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhirecommend/findAnzhiRecommendAll.do','AnzhiRecommendForm')"/>
				<input id='addanzhirecommend' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhirecommend/anzhirecommendAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>小说名称</td>
					<td>作家</td>
					<td>推荐位置</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhirecommendList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td><a href="<%=request.getContextPath()%>/novel/${s.novelId }.jsp" target="_blank">${s.novelTitle }</a></td>
						<td>${s.authorwritername }</td>
						<td>${s.recommendPosition }</td>
						<td>
							<fmt:formatDate value="${s.addTime }" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td>
							<a id='updateanzhirecommend${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhirecommend/findAnzhiRecommendById.do?anzhirecommendId=${s.id}',this,'updateanzhirecommend')">[查看]</a>
							<a id='deleteanzhirecommend${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhirecommend/delAnzhiRecommend.do?anzhirecommendId=${s.id }',this,'deleteanzhirecommend')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhirecommend/findAnzhiRecommendAll.do" name="url"/>
				<jsp:param value="${anzhirecommendList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhirecommendList.num }" name="num"/>
				<jsp:param value="AnzhiRecommendForm" name="formId"/>
				<jsp:param value="${anzhirecommendList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
