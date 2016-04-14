<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<script type="text/javascript">
	function showIdShuqian(id){
		if($("#shuqianDiv"+id)[0].style.display==""||$("#shuqianDiv"+id)[0].style.display=="none"){
			$("#shuqianDiv"+id)[0].style.display="block";
		}else{
			$("#shuqianDiv"+id)[0].style.display="none";
		}
	}
</script>
<form class="formCss" id="cavecollectionform" action="anzhinovelmultifunction/findAnzhiNovelMultifunctionMyShoucang.do?pageName=index/line_cave_collection&&linenumber=3&&index=6&&chooseIndex=0" method="post">
	<div class="divTableCss">
		<table class="tableCss" width="100%" border="0">
		  <tr class="tableTitleCss">
		  	<td>序号</td>
			<td>阅读小说</td>
			<td>作者</td>
			<td>最新章节</td>
			<td>更新时间</td>
			<td>字数</td>
			<td>操作</td>
		  </tr>
		  <c:forEach items="${anzhinovelmultifunctionList.list }" var="sc" varStatus="ind">
		  <tr>
		  	<td>${ind.index+1 }</td>
			<td>
				<a href="<%=request.getContextPath()%>/novel/${sc.novelId}.jsp" target="_blank">${sc.novelTitle }</a>
				<c:if test="${fn:length(sc.anzhiBookmarkLs) ne 0 }">
					<img title="书签" style="vertical-align: middle; cursor: pointer;" src="<%=request.getContextPath()%>/index/images/shuqian.png" onclick="showIdShuqian('${sc.id }')"/>
				</c:if>
			</td>
			<td><a href="<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=${sc.memberAuthorId}" target="_blank">${sc.authorWriterName }</a></td>
			<td><a href="read.jsp">${sc.newNovelName}</a></td>
			<td>
				<fmt:formatDate value="${sc.updateTime }" pattern="yyyy-MM-dd  HH:mm"/>
			</td>
			<td>${sc.totalCharNum }</td>
			<td>
				<a href="<%=request.getContextPath() %>/novel/${sc.novelId }.jsp" target="_blank">点击阅读</a>&nbsp;
				<a href="javascript:;" onclick="delRecordBack('anzhinovelmultifunction/delAnzhiNovelMultifunction.do#anzhinovelmultifunctionId=${sc.id}')">删除</a>
				<c:if test="${fn:length(sc.anzhiBookmarkLs) ne 0 }">
					<a href="javascript:;" onclick="showIdShuqian('${sc.id }')">书签</a>
				</c:if>
			</td>
		  </tr>
		  <c:if test="${fn:length(sc.anzhiBookmarkLs) ne 0 }">
		  	<tr>
		  		<td colspan="7">
		  			<div id="shuqianDiv${sc.id }" style="display: none;">
		  				<c:forEach items="${sc.anzhiBookmarkLs }" var="s" varStatus="ind">
		  					<div class="shuqian_table">
				  				<div class="shuqian_table_title">
				  					<a href="<%=request.getContextPath()%>/anzhichapter/read.do?chapterId=${s.chapterId}&&readAddress=${s.readAddress}" target="_blank">${s.chapterTitle }</a>
				  				</div>
				  				<div class="shuqian_addTime">
				  					<fmt:formatDate value="${s.addTime }" pattern="yyyy/MM/dd  HH:mm"/>
				  				</div>
				  				<div class="shuqian_goread">
				  					<a href="<%=request.getContextPath()%>/anzhichapter/read.do?chapterId=${s.chapterId}&&readAddress=${s.readAddress}" target="_blank">继续阅读</a>
				  				</div>
				  			</div>
		  				</c:forEach>
		  			</div>
		  		</td>
		  	</tr>
		  </c:if>
		  </c:forEach>
		</table>
	</div>
	<jsp:include page="../next_page.jsp" flush="false">
		<jsp:param value="anzhinovelmultifunction/findAnzhiNovelMultifunctionMyShoucang.do?pageName=index/line_cave_collection&&linenumber=3&&index=6&&chooseIndex=0" name="url"/>
		<jsp:param value="${anzhinovelmultifunctionList.totalNum }" name="totalNum"/>
		<jsp:param value="${anzhinovelmultifunctionList.num }" name="num"/>
		<jsp:param value="cavecollectionform" name="formId"/>
		<jsp:param value="${anzhinovelmultifunctionList.total }" name="total"/>
		<jsp:param value="${param.size}" name="size"/>
	</jsp:include>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
