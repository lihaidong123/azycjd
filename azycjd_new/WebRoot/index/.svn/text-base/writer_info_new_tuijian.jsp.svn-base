<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="newtuijianform" method="post" action="<%=request.getContextPath() %>/anzhinovelmultifunction/addAnzhiNovelMultifunction.do">
		<div>
			<div class="divItemsCss">小说编号：
				<input type="text" class="txtCss" name="novelId" id="novelId" alt="[0-9]{1,20};编号输入错误" value="${param.novelId }" onblur="checkFindNovelById(this)"/>
				<span class="novelId" style="color:red;"></span>
			</div>
			<div class="divItemsCss">小说名称：
				<input type="text" class="txtCss" name="novelTitle" id="novelTitle" value="${param.novelTitle }" readonly="readonly"/>
				<input type="hidden" name="actionType" value="3"/>
			</div>
			<div class="divItemsCss">小说作者：
				<input type="text" class="txtCss" name="authorId" id="authorId" value="${param.authorId }" readonly="readonly"/>
			</div>
			<div class="divItemsCss">
				<input type="button" value="确认" class="saveBtnCss" onclick="ajaxFormSubmit('newtuijianform',this)">
				<input type="button" value="重置" class="resetBtnCss">
			</div> 
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>