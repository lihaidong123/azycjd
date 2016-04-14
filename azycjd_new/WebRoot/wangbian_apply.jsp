<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="htmlEdit.jsp" flush="false" />
	<script language="javascript" src="<%=request.getContextPath() %>/index/js/My97DatePicker/WdatePicker.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index/css/index.css"/>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/index.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/validateData.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/selectData.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/validate.js"></script>
	<div class="div_title_css_main" style="background-color: #ffffff;">
		<div class="div_title_css_sec" style="margin: 0 auto; width:60%; padding-bottom:10px; text-align: center; padding-left: 0px; margin-top: 20px;">申请成为网编</div>
		<form method="post" id="authorapplyform" action="anzhiwebeditorapply/addAnzhiWebEditorApply.do">
			<div class="div_title_css_conetent">
				<div>
					<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
					<input type="hidden" class="txt" name="memberId" id="memberId" value="${loginUsers.id}" alt=""/>
				
					<div class="textItem"><font class='textTitleCss' style="padding-left: 28px;">姓名：</font><input type="text" class="txt" name="xingming" id="xingming" value="${pojo.xingming}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写姓名</font></div>
					<div class="textItem"><font class='textTitleCss' style="padding-left: 28px;">性别：</font><input type="text" class="txt" name="xingbie" id="xingbie" value="${pojo.xingbie}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写性别</font></div>
					<div class="textItem"><font class='textTitleCss' style="padding-left: 13px;">编辑名：</font><input type="text" class="txt" name="bianjiming" id="bianjiming" value="${pojo.bianjiming}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写编辑名</font></div>
					<div class="textItem"><font class='textTitleCss' style="padding-left: 33px;">QQ：</font><input type="text" class="txt" name="qq" id="qq" value="${pojo.qq}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写QQ</font></div>
					<div class="textItem"><font class='textTitleCss'>联系电话：</font><input type="text" class="txt" name="tel" id="tel" value="${pojo.tel}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写电话</font></div>
					<div class="textItem"><font class='textTitleCss'>出生日期：</font><input type="text" class="txt" name="birthdayss" id="birthdayss" readonly="readonly" class="Wdate" onClick="WdatePicker()" value="${pojo.birthdays}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写年龄</font></div>
					<div class="textItem"><font class='textTitleCss'>身份证号：</font><input type="text" class="txt" name="shengfenzhenghao" id="shengfenzhenghao" value="${pojo.shengfenzhenghao}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写身份证号</font></div>
					<div class="textItem"><font class='textTitleCss'>目前职业：</font><input type="text" class="txt" name="zhiye" id="zhiye" value="${pojo.zhiye}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写目前职业</font></div>
					<div class="divItemsCss">
						<p>备注说明：</p>
						<p><textarea style="height:230px; width: 90%;" id="editorVote" name="editorVote"></textarea></p>
					</div>
					<div class="divItemsCss">
						<input type="button" value="保存" class="saveBtnCss" onclick="ajaxSubmit('authorapplyform',this)"/>
						<input type="reset" value="重置" class="resetBtnCss" />
					</div>
				</div>
			</div>
		</form>
	</div>
<jsp:include page="foot.jsp"></jsp:include>