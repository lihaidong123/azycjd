<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="top.jsp"></jsp:include>
	<script language="javascript" src="<%=request.getContextPath() %>/js/jquery.jplayer.min.js"></script>
	<script language="javascript">var loginMemberId='${loginUsers.id}';</script>
	<script language="javascript">var novelId='${param.novelId}';</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/musicPlayer.css" />
	<script language="javascript" src="<%=request.getContextPath() %>/js/musicPlayer.js"></script>
	<script language="javascript" src="<%=request.getContextPath() %>/js/comment.js"></script>
	<script type="text/javascript">
		$(function(){
			var r=/^2\d{4}$/;
			if(r.test(novelId)){
				loadNovelDeTailAll(parseInt(novelId));
			}
		});
	</script>
	<jsp:include page="commentHtmlEdit.jsp" flush="false"></jsp:include>
	<div style="background-color: #ffffff; border-radius: 5px; padding: 15px; padding-bottom: 100px;">
		<div>
			<table width="100%">
				<tr>
					<td valign="top" width="177">
						<img src="${pojo.novelImg }" width="177" height="234"/>
					</td>
					<td valign="top">
						<div class="novel_comment_div">
							<div style="font-size:40px;font-weight: bolder;font-family:'黑体';cursor:pointer;" onclick="javascript:window.open('<%=request.getContextPath()%>/novel/${pojo.id }.jsp')">${pojo.novelTitle}</div>
							<div style="margin-top: 10px;">更新时间：<span style="color: #666666;font-size: 12px;"><fmt:formatDate value="${pojo.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></div>
							<div>小说字数：${pojo.totalCharNum}</div>
							<div>类型：${pojo.novelType}</div>
							<div>总点击:${pojo.clickNum}</div>
							<div class="self_btn" style="margin-left:10px;margin-top:15px;"><a href="<%=request.getContextPath()%>/novel/${pojo.id}/index.jsp">立刻阅读</a></div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="shupingqu">
	    	<div class="shupingqu_two">
	    		<div class="shupingqu_title"> ${pojo.novelTitle }的所有书评<span class="commentTotal">共有${anzhicommentList.total }书评</span></div>
		    	<div class="read_pl_content" >
		    		<form id="replyForm" method="post">
			    		<c:forEach items="${anzhicommentList.list }" var="s" varStatus="ind">
			    			<div class='comment_items'>
					    		<table width="100%">
									<tr>
										<td valign="top" width="42">
											<img src="${s.memberHeadImg }" width="41" height="41"/>
										</td>
										<td valign="top">
											<div class='comment_head'>
								    			<div class='comment_member_nick'>
								    				<c:if test="${s.isTop eq 1 }">[已置顶]</c:if>
								    				<c:if test="${s.isMarrow eq 1 }">[已加精]</c:if>
								    				<a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=${s.memberId}' target='_blank'>${s.memberNick }</a>
								    					<c:if test="${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq 'admin'}">
									    					<span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(${s.id},${s.tableId },this)'>删除</a>]</span>
									    				</c:if>
								    				</div>
									    		<div class='comment_time'><fmt:formatDate value="${s.addTime}" pattern="yyyy/MM/dd HH:mm:ss"/></div>
									    		<div class='comment_dianzan' id="dianZanComment${s.id }" title='亲，赞一个呗' onclick="commentPraise(this,'${loginUsers.id}','${s.tableId }','${s.id }',0)">点赞(${s.dianZanNum })</div>
									    		<div class='comment_reply'><a href="javascript:commentReply('${s.id }','${s.tableId }','${loginUsers.id}')">回复(${s.replyNum})</a></div>
								    		</div>
								    		<div class='comment_content' id="comment_time${s.id }">${s.commentContent }</div>
								    		<c:if test="${s.replyList.total>0 }">
								    			<div class='commentReplyDiv' id='commentReplyDiv${s.id }'>
													<c:forEach items="${s.replyList.list }" var="k" varStatus="indexs">
														<div class='comment_items'>
												    		<table width="100%">
																<tr>
																	<td valign="top" width="42">
																		<img src="${k.memberHeadImg }" width="41" height="41"/>
																	</td>
																	<td valign="top">
																		<div class="comment_head">
															    			<div class="comment_member_nick"><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=${k.memberId}' target='_blank'>${k.memberNick }</a>
															    				<c:if test="${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq 'admin'}">
															    					<span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(${k.id},${k.tableId },this)'>删除</a>]</span>
															    				</c:if>
															    			</div>
																    		<div class="comment_time"><fmt:formatDate value="${k.addTime}" pattern="yyyy/MM/dd HH:mm:ss"/></div>
																    		<div class="nowPosition">第${indexs.index+1 }楼</div>
															    		</div>
															    		<div class='comment_content'>${k.commentContent }</div>
																	</td>
																</tr>
															</table>
												    	</div>
													</c:forEach>
													<c:if test="${s.replyList.total>5 }">
														<div class='moreReplyCss'><a href='javascript:;' onclick="getJspDataByUrl('anzhicomment/commentAction.do#commentId=${s.id }#novelId=${s.tableId }')">查看更多回复</a></div>
													</c:if>
												</div>
								    		</c:if>
										</td>
									</tr>
								</table>
					    	</div>
			    		</c:forEach>
			    		 <jsp:include page="next_page.jsp" flush="false">
							<jsp:param value="anzhicomment/findMyAnzhiCommentAllIndex.do?novelId=${param.novelId }" name="url"/>
							<jsp:param value="${anzhicommentList.totalNum }" name="totalNum"/>
							<jsp:param value="${anzhicommentList.num }" name="num"/>
							<jsp:param value="replyForm" name="formId"/>
							<jsp:param value="${anzhicommentList.total }" name="total"/>
							<jsp:param value="${param.size}" name="size"/>
						</jsp:include>
					</form>
			    </div>
			   
	    	</div>   	
	    </div>
	</div>
	
<jsp:include page="foot.jsp"></jsp:include>