<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编申请操作
		</div>
	</div>
	<form id="AnzhiWebEditorApplyFormAction" action="<%=request.getContextPath()%>/anzhiwebeditorapply/addAnzhiWebEditorApply.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>网编编号：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写网编编号</font></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left: 28px;">姓名：</font><input type="text" class="txt" name="xingming" id="xingming" value="${pojo.xingming}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写姓名</font></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left: 28px;">性别：</font><input type="text" class="txt" name="xingbie" id="xingbie" value="${pojo.xingbie}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写性别</font></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left: 13px;">编辑名：</font><input type="text" class="txt" name="bianjiming" id="bianjiming" value="${pojo.bianjiming}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写编辑名</font></div>
			<div class="textItem"><font class='textTitleCss' style="padding-left: 38px;">QQ：</font><input type="text" class="txt" name="qq" id="qq" value="${pojo.qq}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写QQ</font></div>
			<div class="textItem"><font class='textTitleCss'>联系电话：</font><input type="text" class="txt" name="tel" id="tel" value="${pojo.tel}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写电话</font></div>
			<div class="textItem"><font class='textTitleCss'>出生日期：</font><input type="text" class="txt" name="birthdayss" id="birthdayss" readonly="readonly" class="Wdate" onClick="WdatePicker()" value="${pojo.birthdays}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写年龄</font></div>
			<div class="textItem"><font class='textTitleCss'>身份证号：</font><input type="text" class="txt" name="shengfenzhenghao" id="shengfenzhenghao" value="${pojo.shengfenzhenghao}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写身份证号</font></div>
			<div class="textItem"><font class='textTitleCss'>目前职业：</font><input type="text" class="txt" name="zhiye" id="zhiye" value="${pojo.zhiye}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写目前职业</font></div>
			<div class="textItem"><font class='textTitleCss'>备注说明：</font><input type="text" class="txt" name="editorVote" id="editorVote" value="${pojo.editorVote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注说明</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="关闭" onClick="allLoadPage('anzhiwebeditorapply/findAnzhiWebEditorApplyAll.do')"/>
				<c:if test="${pojo.state eq 0 }">
					<input class="addItemsRecord" type="button" value="审核通过" onClick="updateApply(this,${pojo.id})"/>
				</c:if>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
