<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			公告管理
		</div>
	</div>
	<form id="AnzhiNewsForm" action="anzhinews/findAnzhiNewsAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				公告标题：<input class="inputTextCss" type="text" id="newsTitle" name="newsTitle" class="txt" value="${param.newsTitle}"/>
			</div>
			<div class='searchDivItemText' id="advTypeDataeelects">
				<script language="javascript">
					showSelect("newsType","newsType","${param.newsType}",advTypeData,"advTypeDataeelects","公告类型：",true,145);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhinews/findAnzhiNewsAll.do','AnzhiNewsForm')"/>
				<input id='addanzhinews' type='button' class='addItemsRecord' value='添加记录' onclick="window.location.href='<%=request.getContextPath()%>/admin/getHtmlEdit.jsp?needLoadJsp=newsAction'"/>
				<input class="saveBtnCss" type="button" value="静态生成" onclick="createHtml(this)"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>公告标题</td>
					<td>类型</td>
					<td>状态</td>
					<td>点击数</td>
					<td>公告时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinewsList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.newsTitle }</td>
						<td>${s.newsType eq 0?'网站公告':(s.newsType eq 1?'读者公告':(s.newsType eq 1?'作家公告':'小说详情界面公告')) }</td>
						<td>${s.newsState eq 0?'置顶':'不置顶' }</td>
						<td>${s.newsClicknum }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='deleteanzhinews${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhinews/delAnzhiNews.do?anzhinewsId=${s.id }',this,'deleteanzhinews')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinews/findAnzhiNewsAll.do" name="url"/>
				<jsp:param value="${anzhinewsList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinewsList.num }" name="num"/>
				<jsp:param value="AnzhiNewsForm" name="formId"/>
				<jsp:param value="${anzhinewsList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
