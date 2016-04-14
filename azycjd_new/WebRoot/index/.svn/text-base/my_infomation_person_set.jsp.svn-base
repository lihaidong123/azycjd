<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>	
	<form class="formCss" id="personsetform" method="post" action="<%=request.getContextPath() %>/anzhimember/updateAnzhiMemberMySelf.do?type=1">
		<div>
			<div class="divItemsCss"><font style="padding-left:0px">站内信是否接受：</font>
				<input type="text" style="width:320px;" class="selectTxtCss" id="isAccptMessageInput" name="isAccptMessageInput" value="2">
			</div>
			<div class="divItemsCss"><font style="padding-left:15px">书架是否公开：</font>
				<input type="text" style="width:320px;" class="selectTxtCss" id="bookshelfPublicInput" name="bookshelfPublicInput" value="${loginUsers.bookshelfPublic }">
			</div>
			<div class="divItemsCss">
				<input type="button" value="保存" class="saveBtnCss" onclick="ajaxFormSubmit('personsetform',this)">
				<input type="button" value="重置" class="resetBtnCss">
			</div> 
		</div>
	</form>
	<style>
		.selectDivCss{margin-left:118px !important;}
	</style>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>