<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<form class="formCss" id="writetuijianform" action="anzhinovelmultifunction/findAnzhiNovelMultifunctionMyTuijian.do?pageName=index/writer_info_tui_jian&&linenumber=8&&chooseIndex=3" method="post">
	<div class="second_title_css">
		<input class="addBtnCss" type="button" value="新增推荐" id="index/writer_info_new_tuijian.jsp#linenumber=8#index=5#chooseIndex=3" onclick="getJspData(this)" />
	</div>
	<div class="divTableCss">
		<table class="tableCss" width="100%" border="0">
		  <tr class="tableTitleCss">
		  	<td>序号</td>
			<td>小说名称</td>
			<td>作者</td>
			<td>最新章节</td>
			<td>更新时间</td>
			<td>字数</td>
			<td>操作</td>
		  </tr>
		  <c:forEach items="${anzhinovelmultifunctionList.list}" var="a" varStatus="ind">
		  	  <tr>
			  	<td>${ind.index+1 }</td>
				<td><a href="projects.jsp">${a.novelTitle }</a></td>
				<td><a href="author_info.jsp">${a.authorWriterName }</a></td>
				<td><a href="read.jsp">${a.newNovelName }</a></td>
				<td>${a.updateTime }</td>
				<td>${a.newNovelchapterNum }</td>
				<td>
					<a href="javascript:;" onclick="delRecordBack('anzhinovelmultifunction/delAnzhiNovelMultifunctionTuijian.do#anzhinovelmultifunctionId=${a.id}')">删除</a>
				</td>
			  </tr>
		  </c:forEach>
		</table>
	</div>
	<jsp:include page="../next_page.jsp" flush="false">
		<jsp:param value="anzhinovelmultifunction/findAnzhiNovelMultifunctionMyTuijian.do?pageName=index/writer_info_tui_jian&&linenumber=8&&chooseIndex=3" name="url"/>
		<jsp:param value="${anzhinovelmultifunctionList.totalNum }" name="totalNum"/>
		<jsp:param value="${anzhinovelmultifunctionList.num }" name="num"/>
		<jsp:param value="writetuijianform" name="formId"/>
		<jsp:param value="${anzhinovelmultifunctionList.total }" name="total"/>
		<jsp:param value="${param.size}" name="size"/>
	</jsp:include>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
