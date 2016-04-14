<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="top.jsp"></jsp:include>
	<script language="javascript" src="<%=request.getContextPath() %>/js/jquery.jplayer.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/musicPlayer.css" />
	<script language="javascript" src="<%=request.getContextPath() %>/js/musicPlayer.js"></script>
	<script language="javascript" src="<%=request.getContextPath() %>/js/comment.js"></script>
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
							<div style="font-size:40px;font-weight: bolder;font-family:'黑体';">${pojo.novelTitle}</div>
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
		
		<div style="border-top:#e5e6e6 3px solid;">
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
		
		<div>
			<div class="read_pl">
				<div style="padding:15px;">
					<table width="100%">
						<tr>
							<td valign="top" width="14%" align="center">
								<div style="background:url(images/7_p_3.png) no-repeat 5px 4px; padding-left:28px; font-size:16px;">回复<span style="font-size:13px; padding-left:7px;">共${anzhicommentList.total }条</span></div>
								<div style="font-family:'宋体'; font-size:14px; margin-top:10px;">
									<c:if test="${empty loginUsers }">
										您必须登录才能评论
									</c:if>
									<c:if test="${not empty loginUsers }">
										${loginUsers.memberNick }
									</c:if>
								</div>
							</td>
							<td valign="top" width="86%">
								<div style="background-color:#FFFFFF; width:100%; border-radius:5px; padding-top:10px;">
									<div style=" margin:0 auto;width:95%;">
										<div style=" border-bottom:#CCCCCC 1px solid; padding-bottom: 7px;">
											<input type="text" class="comment_title_input" id="comment_title" name="comment_title" placeholder="请输入书评标题"/>
										</div>
										<div style=" border-bottom:#CCCCCC 1px solid; margin-top: 10px;">
											<textarea id="commentContent" name="commentContent" class="commentHtmlEditCss" placeholder="请输入书评内容..." style="height:90px; width:100%; border:none;resize: none;"></textarea>
										</div>
										<div class="shupin_css_foot" style="overflow:auto; padding-top:10px; padding-bottom:10px;">
											<div id="upload_video_div" style="background:url(images/biaoqing.png) no-repeat 1px 1px; color:#666666; width:55px; font-size:13px; float:left;cursor:pointer; padding-left:30px;" onclick="$('#video_div').slideToggle();">添加视频</div>
											<div id="remainCharNum" class="remainCharNum">还可以输入2000字</div>
											<div style="margin-left:220px; padding-top:4px;" onclick="loadimage()">
												<img alt="code..." name="randImage" id="randImage" src="./image.jsp" width="60" height="20" border="1"/>
											</div>
											<div style="padding-top:4px;">
												<input type="text" class="txt" id="randCode" name="randCode" placeholder="输入验证码" style=" width:90px;" />
											</div>
											<div class="addCommentDiv" onclick="saveComment(this,'${param.novelId }','${loginUsers.id}','${param.commentId }',0)">提交书评</div>
										</div>
										<div id="video_div" style="display: none;">
											<div class="video_tips">
												请输入FLASH视频地址：<input id="videoUrl" type="text" style="width:500px;" value="" class="videoUrlCss"/>
												<input class="addVideoCss" type="button" style="margin-left: 15px;" value="添加" onclick="addVideo()"/>
											</div>
											<div style="text-align: center;padding-bottom: 25px;">
												<span class="video_tips_span">本站支持：优酷、爱奇艺、腾讯、搜狐、土豆网站FLASH视频</span>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
		    </div>
		</div>
		
		<div class="shupingqu" style="margin-top: 15px;">
	    	<div class="shupingqu_two">
	    		<div class="shupingqu_title">${commentPojo.memberNick} 对 ${pojo.novelTitle }的评论回复[${anzhicommentList.total }条]<span class="look_more_comment" onclick="window.open('<%=request.getContextPath() %>/anzhicomment/findMyAnzhiCommentAllIndex.do?novelId=${param.novelId }')">所有评论</span></div>
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
											<div class="comment_head">
								    			<div class="comment_member_nick"><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=${s.memberId}' target='_blank'>${s.memberNick }</a>
								    				<c:if test="${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq 'admin'}">
								    					<span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(${s.id},${s.tableId },this)'>删除</a>]</span>
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
			    		 <jsp:include page="next_page.jsp" flush="false">
							<jsp:param value="anzhicomment/commentAction.do?commentId=${param.commentId }&&novelId=${param.novelId }" name="url"/>
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