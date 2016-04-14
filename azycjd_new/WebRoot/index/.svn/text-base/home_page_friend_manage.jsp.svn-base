<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<style type="text/css">
		.selectDivCss{margin-left:2px !important; }
		.saveBtnCss{ width:60px !important;letter-spacing:2px !important;}
	</style>
	<div>
		<c:forEach items="${memberlist.list }" var="member" varStatus="a">
			<div class="friend_item_css">
				<div class="friend_item_top_css">
					<div class="friend_item_img_css"><img  src="${member.memberHeadImg }" width="41" height="41"></div>
					<div class="friend_item_content_css">
						<div class="friend_item_name_css">${member.memberNick }&nbsp;&nbsp;&nbsp;
						 	<fmt:formatDate value="${member.addTime }" pattern="yyyy-MM-dd HH:mm"/>
					    </div>
						<div class="friend_item_intro_css">${fn:substring(member.vote,0,46 )}
							<a href="javascript:;" onclick="delRecordBack('anzhifriend/delMyAnzhiFriend.do#anzhifriendId=${member.id }')">删除</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>