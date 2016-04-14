<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			${param.handleType eq 10?"作者删文":"作者删章节"}记录查询&nbsp;&nbsp;&nbsp;[<a href="javascript:;" onclick="allLoadPage('<%=request.getContextPath()%>/${param.handleType eq 10?'anzhinovel/delNovelCheck.do':'anzhichapter/delChapterCheck.do'}')">${param.handleType eq 10?"作者删文":"作者删章节"}审核</a>]
		</div>
	</div>
	<form id="AnzhiHandleForm" action="anzhihandle/AnzhiHandleManager.do?handleType=${param.handleType }" method="post">
		<div class="searchItemsCssss">
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhihandle/AnzhiHandleManager.do?handleType=${param.handleType }','AnzhiHandleForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>记录说明</td>
				</tr>
				<c:forEach items="${anzhihandleList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.handleVote }</td>
					</tr>
					<c:forEach items="${s.ls}" var="k" varStatus="ind">
						<tr>
							<td colspan="2">
								<div id="handle_result${param.tableId }" class="handle_result_css">
									<div class='handle_result_item'>
										<div>处理结果:${k.handleResult eq 0?"不通过":"通过"}</div>
										<div>处理说明:${k.handleVote}</div>
										<div>处理人员:${k.memberNick};处理时间:<fmt:formatDate value="${k.addTime}" pattern="yyyy/MM/dd HH:mm"/></div>
									</div>
								</div>		
							</td>
						</tr>
					</c:forEach>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhihandle/AnzhiHandleManager.do?handleType=${param.handleType }" name="url"/>
				<jsp:param value="${anzhihandleList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhihandleList.num }" name="num"/>
				<jsp:param value="AnzhiHandleForm" name="formId"/>
				<jsp:param value="${anzhihandleList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
