<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<style type="text/css">
	.comment_items{min-height:50px; background-color:#ffffff; padding-top:15px; margin:0 auto; width:100%;border-bottom:#eaeff1 1px solid; padding-bottom:3px;}
	.comment_items_ou{min-height:50px; padding-top:15px; background-color:#f5fcf8; margin:0 auto; width:100%;border-bottom:#eaeff1 1px solid; padding-bottom:3px;}
	.comment_head div{ float:left;}
	.comment_member_nick{ color:#009966;  width:120px; font-family:"宋体"; font-size:14px; padding-left:8px;}
	.comment_time{ color:#b4b9bb;width:400px;font-size:12px; margin-left:5px; }
	.comment_title{width:400px;font-size:13px; color:#2c2b2b ; border:#ffffff 1px solid;margin-left:5px; }
	.comment_dianzan{ width: 60px; font-size: 13px;}
	.comment_reply{background:url(../images/reply.png) no-repeat;  width: 60px;cursor:pointer; padding-left:23px; height:22px; line-height:22px; font-size:12px; margin-left:40px;}
	.comment_items a{text-decoration: none; color: #666666;}
	.comment_items a:hover{color:red; text-decoration:underline;}
	.comment_content{ clear:both; line-height:22px; padding:10px;width:92%; font-size:13px; color:#6f7872;}
	.commentTotal{ margin-left:40px; color:#999999; font-size:13px;}
</style>
	<script language="javascript" src="<%=request.getContextPath() %>/js/jquery.jplayer.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/musicPlayer.css" />
	<script language="javascript" src="<%=request.getContextPath() %>/js/musicPlayer.js"></script>
	<script language="javascript" src="<%=request.getContextPath() %>/js/comment.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#AnzhiCommentFormManageReplyAdmin").bind('keydown', function (e) {
		        var key = e.which;
		        if (key == 13) {
		            direcNum('anzhicomment/commentActionAdmin.do?commentId=${param.commentId}&&novelId=${param.novelId }','AnzhiCommentFormManageReplyAdmin');
		        }
		    });
		});
	</script>
	<div style="background-color: #ffffff; border-radius: 5px; padding: 15px; padding-bottom: 100px;">
		<div class="divInitOne">
			<div class="divInitTwo">
				${pojo.novelTitle}--<a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=${commentPojo.memberId}' target='_blank'>${commentPojo.memberNick }</a>评论回复管理[${anzhicommentList.total }条][<a href="javascript:;" onclick="loadUpdatePageData('anzhicomment/anzhiCommentAllManageAdmin.do?tableId=${param.novelId}')">返回(${pojo.novelTitle})书评管理</a>]
			</div>
		</div>
		<form class="formCss" method="post" id="AnzhiCommentFormManageReplyAdmin" action="anzhicomment/commentActionAdmin.do?commentId=${param.commentId}&&novelId=${param.novelId }">
			<div class="searchItemsCssss" style="background-color: #ffffff;border: none;border-bottom: #f0f0f0 1px solid;">
				<div class='searchDivItemText'>
					读者昵称：<input class="inputTextCss" type="text" id="memberNick" name="memberNick" class="txt" value="${param.memberNick}"/>
				</div>
				<div class='searchDivItemText'>
					开始时间：<input class="inputTextCss" type="text" id="begTime" name="begTime" readonly="readonly" class="txt" onClick="WdatePicker()" value="${param.begTime}"/>
				</div>
				<div class='searchDivItemText'>
					结束时间：<input class="inputTextCss" type="text" id="endTime" name="endTime" readonly="readonly" class="txt" onClick="WdatePicker()" value="${param.endTime}"/>
				</div>
				<div style="clear: both;">
					<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhicomment/commentActionAdmin.do?commentId=${param.commentId}&&novelId=${param.novelId }','AnzhiCommentFormManageReplyAdmin')"/>
				</div>
			</div>
			<div style="border:#e5e6e6 3px solid;">
				<div class='comment_items'>
		    		<table width="100%">
						<tr>
							<td valign="top" width="42">
								<img src="${commentPojo.memberHeadImg }" width="41" height="41"/>
							</td>
							<td valign="top">
								<div class='comment_head'>
					    			<div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=${commentPojo.memberId}' target='_blank'>${commentPojo.memberNick }</a></div>
						    		<div class='comment_time'><fmt:formatDate value="${commentPojo.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					    		</div>
					    		<div class='comment_content'>${commentPojo.commentContent }</div>
							</td>
						</tr>
					</table>
		    	</div>
			</div>
	
			<div class="shupingqu" style="margin-top: 15px;">
		    	<div class="shupingqu_two">
			    	<div class="read_pl_content" >		    		
			    		<c:forEach items="${anzhicommentList.list }" var="s" varStatus="ind">
			    			<div class='comment_items'>
					    		<table width="100%">
									<tr>
										<td valign="top" width="42">
											<img src="${s.memberHeadImg }" width="41" height="41"/>
										</td>
										<td valign="top">
											<div class="comment_head">
								    			<div class="comment_member_nick"><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=${s.memberId}' target='_blank'>${s.memberNick }</a>
								    				<c:if test="${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq 'admin'}">
								    					<span class='admin_del_comment_css'>[<a href='javascript:;' onclick="del('anzhicomment/delAnzhiCommentAdmin.do?anzhicommentId=${s.id}&&commentId=${param.commentId}&&novelId=${param.novelId }&&tableId=${param.novelId }&&types=0&&delReply=yes')">删除</a>]</span>
								    				</c:if>
								    			</div>
									    		<div class="comment_time"><fmt:formatDate value="${s.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
									    		<div class="nowPosition">第${ind.index+1 }楼</div>
								    		</div>
								    		<div class='comment_content'>${s.commentContent }</div>
										</td>
									</tr>
								</table>
					    	</div>
			    		</c:forEach>
			    		 <jsp:include page="../next_page.jsp" flush="false">
							<jsp:param value="anzhicomment/commentActionAdmin.do?commentId=${param.commentId}&&novelId=${param.novelId }" name="url"/>
							<jsp:param value="${anzhicommentList.totalNum }" name="totalNum"/>
							<jsp:param value="${anzhicommentList.num }" name="num"/>
							<jsp:param value="AnzhiCommentFormManageReplyAdmin" name="formId"/>
							<jsp:param value="${anzhicommentList.total }" name="total"/>
							<jsp:param value="${param.size}" name="size"/>
						</jsp:include>					
				    </div>			   
		    	</div>   	
		    </div>
	    </form>
	</div>
