<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="m_head.jsp"></jsp:include>
<style type="text/css">
	#menu_div_head{display:none;}
</style>
<div>
	<div class="paytype_one" style="margin-top: 20px;">
		 《${novelTitle }》评论
	</div>
	<c:forEach items="${pinglunlist.list}" var="s" varStatus="ind">
		<div class="pinglun_one">
			<div class="pl_info">
				<div class="pl_infotx"><img src="${s.memberHeadImg }" width="30px" height="30px"></img></div>
				<div class="pl_infomz">${s.memberNick }</div>
				<div class="pl_infosj"><fmt:formatDate value="${s.addTime }" pattern="yyyy-MM-dd HH:mm"/></div>
			</div>
			<div class="pl_content">
				${s.commentContent }
			</div>
			<div class="pl_huifu">
				<div><img src="<%=request.getContextPath() %>/mobile/images/plhuifuimg.jpg" width="20px" height="16px"></img></div>
				<div>&nbsp;回复&nbsp;${s.replyNum }条</div>
			</div>
		</div>
	</c:forEach>
	
	<div style="margin-top: 60px;">
		<div style=" border-bottom:#CCCCCC 1px solid; padding-bottom: 7px;">
			<input type="text" style="width: 100%; border:#c3bdbb 1px solid; line-height: 30px; height:30px; padding-left: 10px; font-size: 16px;" id="comment_title" name="comment_title" placeholder="请输入书评标题"/>
		</div>
		<div style=" border-bottom:#CCCCCC 1px solid; margin-top: 10px;">
			<textarea id="commentContent" name="commentContent" class="commentHtmlEditCss" placeholder="请输入书评内容..." style="height:90px; width:100%; border:none;resize: none;"></textarea>
		</div>
		<div style="margin-top: 15px;" class="btn_m_css" onClick="saveComment(this,${param.novelId },'${loginUsers.id}',0,0)">
			评论
		</div>
	</div>
	<div style="height: 200px;"></div>
</div>
<jsp:include page="m_foot.jsp"></jsp:include>
