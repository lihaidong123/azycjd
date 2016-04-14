<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编驻站操作
		</div>
	</div>
	<form id="AnzhiWebEditorAuthorFormAction" action="<%=request.getContextPath()%>/anzhiwebeditorauthor/addAnzhiWebEditorAuthor.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="editorId" id="editorId" value="${loginWebEditorUser.id}" alt=""/>
			<input type="hidden" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>
			<input type="hidden" class="txt" name="novelId" id="novelId" value="${pojo.novelId}" alt=""/>
			<%-- <div class="textItem"><font class='textTitleCss'>小说编号：</font><input type="text" class="txt" name="novelNo" value="${pojo.novelId }" id="novelNo" alt="" onblur="getNovelInfo(this)"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写小说编号</font></div>
			<div class="textItem"><font class='textTitleCss'>小说名称：</font><input type="text" class="txt" name="novelName" value="${pojo.novelTitle }" id="novelName" alt="" onblur="getNovelInfo(this)"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写小说名称</font></div>
			<div class="textItem"><font class='textTitleCss'>小说作家：</font><input type="text" class="txt" name="authorName" value="${pojo.authorWriterName }" id="authorName" alt="" readonly="readonly"/></div> --%>
			<jsp:include page="searchNovel.jsp" flush="false"/>
			<div class="textItem"><font class='textTitleCss'>备注说明：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注说明</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorAuthorFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
