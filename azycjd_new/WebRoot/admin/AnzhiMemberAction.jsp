<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiMember操作
		</div>
	</div>
	<form id="AnzhiMemberFormAction" action="<%=request.getContextPath()%>/anzhimember/addAnzhiMember.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>读者头像：</font>
				<img src="${pojo.memberHeadImg}" width="120" height="120"></img>
			</div>
			<div class="textItem"><font class='textTitleCss'>读者账号：</font><input type="text" class="txt" name="memberNo" id="memberNo" value="${pojo.memberNo}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者账号</font></div>
			<div class="textItem"><font class='textTitleCss'>读者姓名：</font><input type="text" class="txt" name="memberRealName" id="memberRealName" value="${pojo.memberRealName}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者姓名</font></div>
			<div class="textItem"><font class='textTitleCss'>读者昵称：</font><input type="text" class="txt" name="memberNick" id="memberNick" value="${pojo.memberNick}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者昵称</font></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left:12px;">读者QQ：</font><input type="text" class="txt" name="memberQq" id="memberQq" value="${pojo.memberQq}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者QQ</font></div>
			<div class="textItem"><font class='textTitleCss'>读者性别：</font><input type="text" class="txt" name="memberSex" id="memberSex" value="${pojo.memberSex}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者性别</font></div>
			<div class="textItem"><font class='textTitleCss'>现居地址：</font><input type="text" class="txt" name="memberAddress" id="memberAddress" value="${pojo.memberAddress}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写现居地址</font></div>
			<div class="textItem"><font class='textTitleCss'>注册时间：</font><input type="text" class="txt" name="addTimes" id="addTime" value="<fmt:formatDate value="${pojo.addTime }" pattern="yyyy/MM/dd HH:mm"/>" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写注册时间</font></div>
			<div class="textItem"><font class='textTitleCss'>读者生日：</font><input type="text" class="txt" name="memberBirthdays" id="memberBirthday" value="<fmt:formatDate value="${pojo.memberBirthday }" pattern="yyyy/MM/dd HH:mm"/>" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者生日</font></div>
			<div class="textItem"><font class='textTitleCss'>读者邮箱：</font><input type="text" class="txt" name="memberEmail" id="memberEmail" value="${pojo.memberEmail}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者邮箱</font></div>
			<div class="textItem"><font class='textTitleCss'>读者简介：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者简介</font></div>
			<div class="textItem"><font class='textTitleCss'>真实姓名：</font><input type="text" class="txt" name="memberRealName" id="memberRealName" value="${pojo.memberRealName}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写真实姓名</font></div>
			<div class="textItem"><font class='textTitleCss'>证件号码：</font><input type="text" class="txt" name="memberCode" id="memberCode" value="${pojo.memberCode}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写身份证号码</font></div>
			<div class="textItem"><font class='textTitleCss'>联系电话：</font><input type="text" class="txt" name="memberTel" id="memberTel" value="${pojo.memberTel}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写联系电话</font></div>
			<div class="textItem"><font class='textTitleCss'>读者经验：</font><input type="text" class="txt" name="memberExperience" id="memberExperience" value="${pojo.memberExperience}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者经验</font></div>
			<div class="textItem"><font class='textTitleCss'>剩余安之币：</font><input type="text" class="txt" name="memberMoney" id="memberMoney" value="${pojo.memberMoney}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写剩余安之币</font></div>
			<div class="searchDivItemText"><font class='textTitleCss'>读者状态：</font>
				<select name="state" id="state">
					<option value="0">启用</option>
					<option value="1">禁用</option>
				</select>
			</div>
			<input type="hidden" class="txt" name="memberHeadImg" id="memberHeadImg" value="${pojo.memberHeadImg}" alt=""/>
			<input type="hidden" class="txt" name="isAccptMessage" id="isAccptMessage" value="${pojo.isAccptMessage}" alt=""/>
			<input type="hidden" class="txt" name="bookshelfPublic" id="bookshelfPublic" value="${pojo.bookshelfPublic}" alt=""/>
			<input type="hidden" class="txt" name="memberType" id="memberType" value="${pojo.memberType}" alt=""/>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiMemberFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
