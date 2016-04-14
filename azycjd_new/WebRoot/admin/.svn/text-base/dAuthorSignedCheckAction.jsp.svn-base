<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			作者签约申请操作
		</div>
	</div>
	<form id="AnzhiChapterFormAction" action="<%=request.getContextPath()%>/anzhichapter/addAnzhiChapter.do" method="post">
		<div class="inputItemsCssss" id="needDisableDiv">
			<div class="textItem"><font class='textTitleCss'>作者笔名：</font><input type="text" class="txt" name="authorWriterName" id="authorWriterName" value="${pojo.authorWriterName}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>作者电话：</font><input type="text" class="txt" name="authorTel" id="authorTel" value="${pojo.authorTel}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left:12px;">作者QQ：</font><input type="text" class="txt" name="authorQq" id="authorQq" value="${pojo.authorQq}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>真实姓名：</font><input type="text" class="txt" name="authorRealname" id="authorRealname" value="${pojo.authorRealname}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left:27px;">住址：</font><input type="text" class="txt" name="authorAddress" id="authorAddress" value="${pojo.authorAddress}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>作者邮编：</font><input type="text" class="txt" name="authorPost" id="authorPost" value="${pojo.authorPost}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>作者邮箱：</font><input type="text" class="txt" name="authorEmail" id="authorEmail" value="${pojo.authorEmail}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left:5px;">作者MSN：</font><input type="text" class="txt" name="authorMsn" id="authorMsn" value="${pojo.authorMsn}" alt=""/></div>
	    	<div class="textItem"><font class='textTitleCss'>证件类型：</font><input type="text" class="txt" name="authorCredenttype" id="authorCredenttype" value="${pojo.authorCredenttype}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>证件号码：</font><input type="text" class="txt" name="authorCredentcode" id="authorCredentcode" value="${pojo.authorCredentcode}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>作者简介：</font>
				<br>
				${pojo.authorInfo}
			</div>
		</div>
	</form>
	<jsp:include page="AnzhiHandleAction.jsp" flush="false">
		<jsp:param value="${param.tableId }" name="tableId"/>
		<jsp:param value="5" name="handleType"/>
		<jsp:param value="anzhiauthor/signedCheck.do" name="actionUrl"/>
	</jsp:include>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
