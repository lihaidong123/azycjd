<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script language="javascript" src="<%=request.getContextPath() %>/js/jquery.jplayer.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/musicPlayer.css" />
<script language="javascript" src="<%=request.getContextPath() %>/js/musicPlayer.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/js/comment.js"></script>
<style type="text/css">
	.comment_items{min-height:50px; background-color:#ffffff; padding-top:15px; margin:0 auto; width:100%;border-bottom:#eaeff1 1px solid; padding-bottom:3px;}
	.comment_items_ou{min-height:50px; padding-top:15px; background-color:#f5fcf8; margin:0 auto; width:100%;border-bottom:#eaeff1 1px solid; padding-bottom:3px;}
	.comment_head div{ float:left;}
	.comment_member_nick{ color:#009966;  width:80px; font-family:"宋体"; font-size:14px; padding-left:8px;}
	.comment_time{ color:#b4b9bb;width:600px;font-size:12px; margin-left:5px; }
	.comment_title{width:400px;font-size:13px; color:#2c2b2b ; border:#ffffff 1px solid;margin-left:5px; }
	.comment_dianzan{ width: 60px; font-size: 13px;}
	.comment_reply{background:url(../images/reply.png) no-repeat;  width: 60px;cursor:pointer; padding-left:23px; height:22px; line-height:22px; font-size:12px; margin-left:40px;}
	.comment_items a{text-decoration: none; color: #666666;}
	.comment_items a:hover{color:red; text-decoration:underline;}
	.comment_content{ clear:both; line-height:22px; padding:10px;width:92%; font-size:13px; color:#6f7872;}
	.commentTotal{ margin-left:40px; color:#999999; font-size:13px;}
	
</style>

<form class="formCss" method="post" id="AnzhiCommentFormManageAdmin" action="anzhicomment/pinglunguanli.do">
	<div class="divInitOne">
		<div class="divInitTwo">
			评论管理
		</div>
	</div>
	<div class="searchItemsCssss" style="background-color: #ffffff;border: none;border-bottom: #f0f0f0 1px solid;">
		<div class='searchDivItemText'>
			读者昵称：<input class="inputTextCss" type="text" id="memberNick" name="memberNick" class="txt" value="${param.memberNick}"/>
		</div>
		<div class='searchDivItemText'>
			小说名称：<input class="inputTextCss" type="text" id="novelTitle" name="novelTitle" class="txt" value="${param.novelTitle}"/>
		</div>
		<div class='searchDivItemText' style="clear: both;">
			开始时间：<input class="inputTextCss" type="text" id="begTime" name="begTime" readonly="readonly" class="txt" onClick="WdatePicker()" value="${param.begTime}"/>
		</div>
		<div class='searchDivItemText'>
			结束时间：<input class="inputTextCss" type="text" id="endTime" name="endTime" readonly="readonly" class="txt" onClick="WdatePicker()" value="${param.endTime}"/>
		</div>
		
		<div style="clear: both;">
			<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhicomment/pinglunguanli.do','AnzhiCommentFormManageAdmin')"/>
		</div>
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
									<div style="font-size: 12px;cursor: pointer; padding-left: 15px;" onclick="allLoadPage('anzhicomment/commentActionAdmin.do?commentId=${s.id}&&novelId=${s.tableId }')">
										回复(${s.replyNum })
									</div>
								</div>
								<div class="comment_content">${s.commentContent }</div>
								<div class="comment_time" id="comment_time${s.id }">
									<fmt:formatDate value="${s.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<c:if test="${s.state ne 2 }">
										[ <a class="updateRecordCss_a" href="javascript:;" onclick="del('anzhicomment/delAnzhiCommentAdmin.do?anzhicommentId=${s.id}&&tableId=${param.tableId }&&types=0')">删除</a> ]
									</c:if>
									<c:if test="${s.state eq 2 }">
										[ <a class="updateRecordCss_a" href="javascript:;" onclick="del('anzhicomment/delAnzhiCommentAdmin.do?anzhicommentId=${s.id}&&tableId=${param.tableId }&&types=1')">恢复</a> ]
									</c:if>
									
									<c:if test="${s.isMarrow eq 0 }">
										[ <a class="updateRecordCss_a" href="javascript:;" onclick="updateRecord(0,1,this,${s.id},'${param.tableId }')">加精</a> ]
									</c:if>
									<c:if test="${s.isMarrow eq 1 }">
										[ <a class="updateRecordCss_a" href="javascript:;" onclick="updateRecord(0,0,this,${s.id},'${param.tableId }')">取消加精</a> ]
									</c:if>
									
									<c:if test="${s.isTop eq 0 }">
										[ <a class="updateRecordCss_a" href="javascript:;" onclick="updateRecord(1,1,this,${s.id},'${param.tableId }')">置顶</a> ]
									</c:if>
									<c:if test="${s.isTop eq 1 }">
										[ <a class="updateRecordCss_a" href="javascript:;" onclick="updateRecord(1,0,this,${s.id},'${param.tableId }')">取消置顶</a> ]
									</c:if>
									<span style="padding-left: 15px;color:#333333;">[<a href="<%=request.getContextPath()%>/novel/${s.tableId}.jsp" target="_blank">${s.novelTitle }</a>]</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</div>
	<jsp:include page="../next_page.jsp" flush="false">
		<jsp:param value="anzhicomment/pinglunguanli.do" name="url"/>
		<jsp:param value="${anzhicommentList.totalNum }" name="totalNum"/>
		<jsp:param value="${anzhicommentList.num }" name="num"/>
		<jsp:param value="AnzhiCommentFormManageAdmin" name="formId"/>
		<jsp:param value="${anzhicommentList.total }" name="total"/>
		<jsp:param value="${param.size}" name="size"/>
	</jsp:include>
</form>
<script type="text/javascript">
	$(function(){
		$("#AnzhiCommentFormManageAdmin").bind('keydown', function (e) {
	        var key = e.which;
	        if (key == 13) {
	            direcNum("anzhicomment/pinglunguanli.do","AnzhiCommentFormManageAdmin");
	        }
	    });
	});
</script>