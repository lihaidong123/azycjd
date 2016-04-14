<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="htmlEditAdmin.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编个人信息
		</div>
	</div>
	<form id="updateAnzhiWebEditorFormAction" action="<%=request.getContextPath()%>/anzhiwebeditor/updateAnzhiWebEditorMyInfo.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${loginWebEditorUser.id}" alt=""/>
			<input type="hidden" class="txt" name="state" id="state" value="${loginWebEditorUser.state}" alt=""/>
			<input type="hidden" class="txt" name="editorScore" id="editorScore" readonly="readonly" value="${loginWebEditorUser.editorScore}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>网编编号：</font><input type="text" class="txt" readonly="readonly" name="editorNo" id="editorNo" value="${loginWebEditorUser.editorNo}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>网编届别：</font><input type="text" class="txt" readonly="readonly" name="editorJiebie" id="editorJiebie" value="${loginWebEditorUser.editorJiebie}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>网编名称：</font><input type="text" class="txt" readonly="readonly" name="editorName" id="editorName" value="${loginWebEditorUser.editorName}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>身份证号：</font><input type="text" class="txt" name="editorCode" id="editorCode" value="${loginWebEditorUser.editorCode}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写身份证号</font></div>
			<div class="textItem"><font class='textTitleCss'>家庭住址：</font><input type="text" class="txt" name="editorAddress" id="editorAddress" value="${loginWebEditorUser.editorAddress}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写家庭住址</font></div>
			<div class="textItem"><font class='textTitleCss'>联系电话：</font><input type="text" class="txt" name="editorTel" id="editorTel" value="${loginWebEditorUser.editorTel}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写联系电话</font></div>
			<div class="textItem"><font class='textTitleCss'>网编Q&nbsp;Q：</font><input type="text" class="txt" name="editorQq" id="editorQq" value="${loginWebEditorUser.editorQq}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写网编QQ</font></div>
			<div class="textItem"><font class='textTitleCss'>师傅昵称：</font><input type="text" class="txt" name="editorShifu" id="editorShifu" value="${loginWebEditorUser.editorShifu}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写师傅网编昵称</font></div>
			<div class="textItem"><font class='textTitleCss'>网编头像：</font><input type="text" class="txt" id="editorHeadImg" readonly="readonly" name="editorHeadImg" value="${loginWebEditorUser.editorHeadImg }">&nbsp;&nbsp;&nbsp;<input type="button" id="editorHeadImgBtn" value="上传" class="uploadBtnCss"><font class='textTipsCss' style="margin-left: 15px;">*图片尺寸：95*94</font></div>
			<div class="textItem">
				<p>备注说明：</p>
				<p><textarea style="height:230px; width: 90%;" id="editorVote" name="editorVote">${loginWebEditorUser.editorVote}</textarea></p>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('updateAnzhiWebEditorFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
