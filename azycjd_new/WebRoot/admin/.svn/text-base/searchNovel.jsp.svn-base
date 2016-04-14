<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="textItem">
	<c:if test="${param.includeAuthor eq 'yes'}">
		<font class='textTitleCss'>小说名称：</font><input type="text" class="txt" style="width: 50%;" placeholder="支持书名模糊查询、作者名匹配查询" name="novelSearchTitle" id="novelSearchTitle" alt=""/>
	</c:if>
	<c:if test="${param.includeAuthor ne 'yes'}">
		<font class='textTitleCss'>小说名称：</font><input type="text" class="txt" style="width: 50%;" placeholder="支持书名模糊查询" name="novelSearchTitle" id="novelSearchTitle" alt=""/>
	</c:if>
	<input class="buttonBtnCss" type="button" value="查询" onClick="searchNovelByTitle()"/>
</div>
<div class="textItem" id="searchNovelData" style="padding: 0px;">
	
</div>
<c:if test="${not empty loginUsers }">
	<script language="javascript">var loginSession='${loginUsers.id}';</script>
</c:if>
<c:if test="${not empty loginWebEditorUser }">
	<script language="javascript">var loginSession='${loginWebEditorUser.id}';</script>
</c:if>
<script language="javascript">var searchNovelJsp=true;</script>
<script language="javascript">var includeAuthor='${param.includeAuthor}';</script>