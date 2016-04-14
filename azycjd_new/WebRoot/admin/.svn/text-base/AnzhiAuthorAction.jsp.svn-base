<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			作者操作
		</div>
	</div>
	<form id="AnzhiAuthorFormAction" action="<%=request.getContextPath()%>/anzhiauthor/addAnzhiAuthor.do" method="post">
		<div class="inputItemsCssss">
			<div class="textItem">
				<font class='textTitleCss'>作者头像：</font>
				<img src="${pojo.authorImage}" width="120" height="120"></img>
			</div>
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<!-- <div class="textItem"><font class='textTitleCss'>读者id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者id</font></div> -->
			<div class="textItem"><font class='textTitleCss'>作者笔名：</font><input type="text" class="txt" name="authorWriterName" id="authorWriterName" value="${pojo.authorWriterName}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作家笔名</font></div>
			<div class="textItem"><font class='textTitleCss'>作者电话：</font><input type="text" class="txt" name="authorTel" id="authorTel" value="${pojo.authorTel}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作者电话</font></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left:12px;">作者QQ：</font><input type="text" class="txt" name="authorQq" id="authorQq" value="${pojo.authorQq}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作者QQ</font></div>
			<!-- <div class="textItem"><font class='textTitleCss'>作者头像：</font><input type="text" class="txt" name="authorImage" id="authorImage" value="${pojo.authorImage}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作者头像</font></div> -->
			<div class="textItem"><font class='textTitleCss'>真实姓名：</font><input type="text" class="txt" name="authorRealname" id="authorRealname" value="${pojo.authorRealname}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写真实姓名</font></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left:27px;">住址：</font><input type="text" class="txt" name="authorAddress" id="authorAddress" value="${pojo.authorAddress}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写住址</font></div>
			<div class="textItem"><font class='textTitleCss'>作者邮编：</font><input type="text" class="txt" name="authorPost" id="authorPost" value="${pojo.authorPost}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作者邮政编码</font></div>
			<div class="textItem"><font class='textTitleCss'>作者邮箱：</font><input type="text" class="txt" name="authorEmail" id="authorEmail" value="${pojo.authorEmail}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作者电子邮箱</font></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left:5px;">作者MSN：</font><input type="text" class="txt" name="authorMsn" id="authorMsn" value="${pojo.authorMsn}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作者MSN</font></div>
	    <!--<div class="textItem"><font class='textTitleCss'>证件类型：</font><input type="text" class="txt" name="authorCredenttype" id="authorCredenttype" value="${pojo.authorCredenttype}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写证件类型</font></div> -->
			<div class="textItem"><font class='textTitleCss'>证件号码：</font><input type="text" class="txt" name="authorCredentcode" id="authorCredentcode" value="${pojo.authorCredentcode}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写证件号码</font></div>
			<div class="textItem"><font class='textTitleCss'>作者简介：</font><input type="text" class="txt" name="authorInfo" id="authorInfo" value="${pojo.authorInfo}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作者简介</font></div>
		<!--<div class="textItem"><font class='textTitleCss'>作者状态(0-未通过 1-通过)：</font><input type="text" class="txt" name="authorState" id="authorState" value="${pojo.authorState}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作者状态(0-未通过 1-通过)</font></div>
			<div class="textItem"><font class='textTitleCss'>申请时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写申请时间</font></div> -->
			<div class="textItem"><font class='textTitleCss'>备注信息：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注信息</font></div>
			<input type="hidden" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>
			<input type="hidden" class="txt" name="authorImage" id="authorImage" value="${pojo.authorImage}" alt=""/>
			<input type="hidden" class="txt" name="authorCredenttype" id="authorCredenttype" value="${pojo.authorCredenttype}" alt=""/>
			<input type="hidden" class="txt" name="authorState" id="authorState" value="${pojo.authorState}" alt=""/>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiAuthorFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
