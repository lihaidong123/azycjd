<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<div class="formCss" id="day_registration_form">
	<div class="divTableCss">
		<div class="signTitleDiv">
			<div style="width: 50px;">序号</div>
			<div style="width: 120px;">状态</div>
			<div style="width: 380px;">作品名称</div>
			<div style="width: 150px;">操作</div>
		 </div>
		  <c:forEach items="${AnzhiNovelList.list}" var="a" varStatus="ind">
			 <div class="signContentDiv">
				<div style="width: 50px;">${ind.index +1 }</div>
				<div style="width: 120px;">
					<c:if test="${a.state ==2}">连载中</c:if>
					<c:if test="${a.state ==3}">已完结</c:if>
					<c:if test="${a.state ==7}">签约申请中</c:if>
				</div>
				<div style="width: 380px;">${a.novelTitle }</div>
				<div style="width: 150px;cursor: pointer;" class="sqqy">申请签约</div>
			 </div>
			 <form>
				 <div class="sqDiv" id="sqContent1">
				 	<div class="sqcontentone">申请内容</div>
				 	<div style="width: 65px;height:40px;line-height:40px;">申请理由：</div>
				 	<div style="width: 530px;">
				 		<textarea style="min-width: 480px;height: 100px;max-height: 110px;max-width: 510px;" placeholder="请输入签约申请理由"></textarea>
				 	</div>
				 	<div style="float:left;margin-top:10px;">
				 		<input type="button" value="提交" class="saveBtnCss">
				 	</div>
				 	<div onclick="closeSign('1')" style="float:left;margin-top:10px;">
				 		<input type="button" value="关闭" class="resetBtnCss">
				 	</div>
				 </div>
			 </form>
		 </c:forEach>
	</div>
	<jsp:include page="../next_page.jsp" flush="false"></jsp:include>
</div>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
