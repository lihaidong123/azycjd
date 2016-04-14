<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<script language="javascript" src="<%=request.getContextPath() %>/js/comment.js"></script>
<form class="formCss" method="post" id="AnzhiCommentFormManage" action="anzhicomment/anzhiCommentAllManage.do?linenumber=11&&tableId=${param.tableId}">
	<div class="htmlTitleCss">
		<div class="htmlTitleCsss_one" style="width: auto;">书评管理[${novelTitle }]</div>
	</div>
	<div class="divTableCss">
		<c:forEach items="${anzhicommentList.list}" var="s" varStatus="ind">
			<div class="comment_items" id="comment_items_div_${s.id }">
				<table width="100%">
					<tbody>
						<tr>
							<td valign="top" width="42">
								<img src="${s.memberHeadImg }" width="41" height="41">
							</td>
							<td valign="top">
								<div class="comment_head">
									<div class="comment_member_nick">
										<a href="<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=${s.memberId }" target="_blank">${s.memberNick }</a>
									</div>
									<div class="comment_title">${s.commentTitle }</div>
									<div class="comment_dianzan" id="dianZanComment${s.id }">点赞(${s.dianZanNum })</div>
									<div class="comment_reply">
										回复(${s.replyNum })
									</div>
								</div>
								<div class="comment_content">${s.commentContent }</div>
								<div class="comment_time" id="comment_time${s.id }">
									<fmt:formatDate value="${s.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<%-- [ <a href="javascript:;" onclick="delRecordBack('anzhicomment/delAnzhiComment.do#anzhicommentId=${s.id}#tableId=${param.tableId }')">删除</a> ] --%>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</div>
	<jsp:include page="../next_page.jsp" flush="false">
		<jsp:param value="anzhicomment/anzhiCommentAllManage.do?linenumber=11&&tableId=${param.tableId}" name="url"/>
		<jsp:param value="${anzhicommentList.totalNum }" name="totalNum"/>
		<jsp:param value="${anzhicommentList.num }" name="num"/>
		<jsp:param value="AnzhiCommentFormManage" name="formId"/>
		<jsp:param value="${anzhicommentList.total }" name="total"/>
		<jsp:param value="${param.size}" name="size"/>
	</jsp:include>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
