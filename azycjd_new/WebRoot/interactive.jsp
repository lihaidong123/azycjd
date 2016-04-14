<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="htmlEdit.jsp" flush="false" />
<script language="javascript">var loginMemberId='${loginUsers.id}';</script>
<div class="interactivemain" id="mainContent">
	<div class="div_title_css_sec" style="margin: 0 auto; width:60%; padding-bottom:10px; text-align: center; padding-left: 0px; margin-top: 20px;">互动专区</div>
	<form action="anzhiinteractive/findAnzhiInteractiveAllByType.do?interactiveType=${param.interactivetype}" id="interactivedateform">
	<c:forEach items="${anzhiinteractiveList.list}" var="s" varStatus="ind">
	<div class="divTableCss">
		<div class="signTitleDiv">
			<div style="width: 50px;">${ind.index+1 }</div>
			<div style="width: 150px;">${s.memberNick }</div>
			<div style="width: 630px;text-align: right;"><fmt:formatDate value="${s.addTime }" pattern="yyyy-MM-dd HH:mm"/></div>
		 </div>
		 <div class="signContentDiv" style="padding-left:20px;width:95%;">
			${s.interactiveContent }
		 </div>
	</div>
	</c:forEach>
	</form>
	<jsp:include page="next_page.jsp" flush="false">
		<jsp:param value="anzhiinteractive/findAnzhiInteractiveAllByType.do?interactiveType=${param.interactivetype}" name="url"/>
		<jsp:param value="${anzhiinteractiveList.totalNum }" name="totalNum"/>
		<jsp:param value="${anzhiinteractiveList.num }" name="num"/>
		<jsp:param value="interactivedateform" name="formId"/>
		<jsp:param value="${anzhiinteractiveList.total }" name="total"/>
		<jsp:param value="${param.size}" name="size"/>
	</jsp:include>
	<form method="post" id="interactiveform" action="anzhiinteractive/addAnzhiInteractive.do?interactiveType=${param.interactivetype }">
		<div style="width:680px;min-height:300px;margin-left:80px;">
			<div class="divItemsCss">
				<font>主题：</font><br>
				<input type="text" style="width: 640px;" class="txtCss"	id="interactiveTitle" name="interactiveTitle" alt="[\u4E00-\u9FA5A-Za-z\d]{1,};请输入主题">
			</div>
			<div class="divItemsCss">
				<font>内容：</font>
				<textarea class="htmlEditCss" style="height: 230px;" name="interactiveContent" id="interactiveContent"></textarea>
			</div>
			<div class="divItemsCss">
				<input type="button" value="保存" class="saveBtnCss" onclick="interactiveSend('interactiveform',this,loginMemberId)"/>
				<input type="reset" value="重置" class="resetBtnCss" />
			</div>
		</div>
	</form>
</div>
