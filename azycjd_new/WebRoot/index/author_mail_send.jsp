<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="my_news_message"  method="post" action="<%=request.getContextPath() %>/anzhimessage/addAnzhiMessage.do">
		<div>
			<input type="hidden" id="messageType" name="messageType" value="2">
			<div class="divItemsCss">留言标题：<input type="text" class="txtCss" id="messageTitle" name="messageTitle" alt="\S{1,30};消息标题长度应为1-30之间！"></div>
			<div class="divItemsCss">收消息者：<input type="text" class="txtCss" id="jieshouren" name="jieshouren" alt="\S{1,30};接受者账号或昵称长度应为1-30之间！">**请输入接受人的账号或昵称</div>
			<div style="background-color:#ffffff; width:95%; overflow:auto; margin:0 auto; margin-top:20px; border:#ececec 1px solid; border-radius:5px; padding-top:10px;">
				<div style=" margin:0 auto;width:95%;">
					<div style=" border-bottom:#CCCCCC 1px solid;">
						<textarea id="messageContent" name="messageContent" class="textarea_css" placeholder="请输入消息内容..." style="height:110px; width:100%; border:none;resize: none;"></textarea>
					</div>
					<div class="shupin_css_foot" style="overflow:auto; padding-top:10px; padding-bottom:10px;">
						<div style="background:url(images/biaoqing.png) no-repeat 1px 1px; color:#666666; width:60px; font-size:13px; float:left;cursor:pointer; padding-left:30px;" onclick="$('#messageContentBiaoQing').slideToggle()">添加表情</div>
						<div id="remainCharNum" class="remainCharNum">还可以输入120字</div>
						<div style="margin-left:100px; padding-top:4px;" onclick="loadimage()">
							<img alt="code..." name="randImage" id="randImage" src="./image.jsp" width="60" height="20" border="1"/>
						</div>
						<div style="padding-top:4px;">
							<input type="text" class="txt" id="randCode" name="randCode" placeholder="输入验证码" style=" width:90px;" />
						</div>
						<div class="addCommentDiv" onclick="ajaxSubmit('my_news_message',this)">发送消息</div>
					</div>
				</div>
				<jsp:include page="../biaoqing.jsp" flush="false">
					<jsp:param value="messageContent" name="textAreaId"/>
				</jsp:include>
			</div>
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>