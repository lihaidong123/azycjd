<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="top.jsp"></jsp:include>
<style type="text/css">
	.tableCss{margin-top:5px; font-family: '黑体'; }
	.tableCss table{ border-collapse:collapse;}
	.tableCss tr{ line-height:35px;}
	.tableCss td{border:#c4d1da 1px solid;font-size: 13px; padding-left:10px; font-weight: normal;}
	.titleCss{ font-weight:bold; color:#525556; background-color:#d8e3e9 !important;line-height:40px !important;}
	.titleCss:hover{background-color:#dce1e4;}
	.tableCss a{ text-decoration:none; color:#0066CC;}
	.tableCss a:hover{ text-decoration:underline;}
</style>
	<div style="background-color: #ffffff; border-radius: 5px; padding: 15px; padding-bottom: 100px;">
		<div>
			<table width="100%">
				<tr>
					<td valign="top" width="120">
						<img src="${memberPojo.memberHeadImg }" width="120" height="120"/>
					</td>
					<td valign="top">
						<div class="novel_comment_div">
							<div style="font-size:40px;font-weight: bolder;font-family:'黑体';">${memberPojo.memberNick}</div>
							<div style="margin-top: 10px;">注册时间：<span style="color: #666666;font-size: 12px;"><fmt:formatDate value="${memberPojo.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></div>
							<div style="height: auto;overflow: auto;">简介:${memberPojo.vote}</div>
							<c:if test="${isFriend eq 'yes' }">
								<div class="self_btn" style="margin-left:10px;margin-top:15px;"><a href="javascript:;" onclick="$('#pinglun_divs').slideToggle()">发送消息</a></div>
							</c:if>
							<c:if test="${isFriend eq 'no' }">
								<div class="self_btn" style="margin-left:10px;margin-top:15px;"><a href="javascript:;" onclick="addFriend('${memberPojo.id}','${loginUsers.id }',this)">加为好友</a></div>
							</c:if>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<c:if test="${isFriend eq 'yes' }">
			<div id="pinglun_divs" style="display: none;">
				<form class="formCss" id="my_news_message" method="post" action="<%=request.getContextPath() %>/anzhimessage/addAnzhiMessage.do">
					<div>
						<input type="hidden" id="messageType" name="messageType" value="1">
						<input type="hidden" class="txtCss" id="messageTitle" name="messageTitle" value="">
						<input type="hidden" class="txtCss" id="jieshouren" name="jieshouren" value="${memberPojo.memberNick }">
						<div style="background-color:#ffffff; width:95%; overflow:auto; margin:0 auto; margin-top:20px; border:#ececec 1px solid; border-radius:5px; padding-top:10px;">
							<div style=" margin:0 auto;width:95%;">
								<div style=" border-bottom:#CCCCCC 1px solid;">
									<textarea id="messageContent" name="messageContent" placeholder="请输入消息内容..."  class="textarea_css" style="height:110px; width:100%; border:none;resize: none;"></textarea>
								</div>
								<div class="shupin_css_foot" style="overflow:auto; padding-top:10px; padding-bottom:10px;">
									<div style="background:url(images/biaoqing.png) no-repeat 1px 1px; color:#666666; width:60px; font-size:13px; float:left;cursor:pointer; padding-left:30px;" onclick="$('#messageContentBiaoQing').slideToggle()">添加表情</div>
									<div id="remainCharNum" class="remainCharNum">还可以输入2000字</div>
									<div style="margin-left:100px; padding-top:4px;" onclick="loadimage()">
										<img alt="code..." name="randImage" id="randImage" src="./image.jsp" width="60" height="20" border="1"/>
									</div>
									<div style="padding-top:4px;">
										<input type="text" class="txt" id="randCode" name="randCode" placeholder="输入验证码" style=" width:90px;" />
									</div>
									<div class="addCommentDiv" onclick="ajaxSubmit('my_news_message',this)">发送消息</div>
								</div>
							</div>
							<jsp:include page="biaoqing.jsp" flush="false">
								<jsp:param value="messageContent" name="textAreaId"/>
							</jsp:include>
						</div>
					</div>
				</form>
			</div>
		</c:if>
		<c:if test="${not empty anzhinovelList }">
			<div class="shupingqu">
		    	<div class="shupingqu_two">
		    		<div class="shupingqu_title"> ${memberPojo.memberNick}的书架</div>
					<form id="AnzhiNovelForm" action="<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=${memberPojo.id}" method="post">
						<div class="tableCss">
							<table width="100%" border="0">
								<tr class="titleCss">
									<td>序号</td>
									<td>小说名称</td>
									<td>小说作者</td>
									<td>更新时间</td>
									<td>点击数</td>
									<td>操作</td>
								</tr>
								<c:forEach items="${anzhinovelList.list}" var="s" varStatus="ind">
									<tr>
										<td>${ind.index+1 }</td>
										<td>${s.novelTitle }</td>
										<td>${s.authorWriterName }</td>
										<td>${s.updateTime }</td>
										<td>${s.clickNum }</td>
										<td>
											<a class='updateBtnCss' href='<%=request.getContextPath()%>/novel/${s.id}' target="_blank">[点击阅读]</a>
										</td>
									</tr>
								</c:forEach>
							</table>
							<jsp:include page="next_page.jsp" flush="false">
								<jsp:param value="anzhimember/memberInfo.do?memberId=${memberPojo.id}" name="url"/>
								<jsp:param value="${anzhinovelList.totalNum }" name="totalNum"/>
								<jsp:param value="${anzhinovelList.num }" name="num"/>
								<jsp:param value="AnzhiNovelForm" name="formId"/>
								<jsp:param value="${anzhinovelList.total }" name="total"/>
								<jsp:param value="${param.size}" name="size"/>
							</jsp:include>
						</div>
					</form>
		    	</div>   	
		    </div>
		</c:if>
	</div>
<jsp:include page="foot.jsp"></jsp:include>