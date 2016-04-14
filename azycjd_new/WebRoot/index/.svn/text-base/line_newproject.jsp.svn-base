<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<script language="javascript">
	$(function(){
		writeNovelType("novel_type_div");
	});
</script>
<style type="text/css">
	.bigTypeTd{ width:100px; color:#CC0000; font-weight:bold;}
	.novel_type{ padding-bottom:10px; margin-top:10px; border-bottom:#CCCCCC 1px solid;}
	.bigTypeTd div{ margin-top:10px;}
	.smallTypeTd div{ float:left; margin-left:7px; margin-top:10px;}
</style>
<form class="formCss" id="create_novel_form" action="<%=request.getContextPath() %>/anzhinovel/addAnzhiNovelNew.do?step=one" method="post">
	<div class="htmlTitleCss">
		<div class="htmlTitleCsss_one">新建作品</div>
	</div>
	<div>
		<input type="hidden" id="novelType" name="novelType">
		<div class="divItemsCss">作品名称:
			<input type="text" class="txtCss" id="novelTitle" name="novelTitle">
		</div>
		<div class="divItemsCss">摘要说明:
			<input type="text" class="txtCss" style="width:320px;" id="novelSummary" name="novelSummary" alt=".{1,30};摘要说明长度需是1-30之间">
		</div>
		<div class="divItemsCss">作品类型:
			<input type="button" value="展开/收缩" class="zhankaizhedie" onclick="$('#novel_type_div').slideToggle()">
			<div id="novel_type_div" style="padding-bottom: 20px;display: none;">

			</div>
		</div>
		<div class="divItemsCss">
			<div>
				作品标签：<input type="text" style="width:620px;" readonly="readonly" class="txtCss" id="novelLabel" name="novelLabel" onfocus="$('#novelTanleDiv').slideDown()">
			</div>
			<div id="novelTanleDiv">
				<table width="100%">
					<c:forEach items="${novelLableList }" var="s" varStatus="ind">
						<tr>
							<td style="color: #48668e;padding-right:20px; text-align:right; font-weight: bold;" width="80" valign="top">${s.labelName }</td>
							<td valign="top" class="${ind.index%2==0?'qi_label_css':'ou_label_css' }">
								<ul>
									<c:forEach items="${s.childRenLs }" var="k">
										<li><input type="checkbox" name="label${s.id }" id="novellabelCss${k.id }" class="novellabelCss" value="${k.labelName }">${k.labelName }</li>
									</c:forEach>
								</ul>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<input type="button" class="zhankaizhedie" value="收缩" style="width: 80px;" onclick="$('#novelTanleDiv').slideUp();"/>
				</div>
			</div>
		</div>
		<div class="divItemsCss">发表方式:
			<input type="text" style="width:300px;" class="selectTxtCss" id="postedWayInput" name="postedWayInput" value="0">
		</div>
		<div class="divItemsCss">小说状态:
			<input type="text" style="width:300px;" class="selectTxtCss" id="stateInput" name="stateInput" value="2">
		</div>
		<!-- <div class="divItemsCss">关键词语:
			<input type="text" style="width:480px;" class="txtCss" id="categories" name="categories" value="">
		</div>
		<div class="divItemsCss">作品主角:
			<input type="text" style="width:370px;" class="txtCss" id="leadingRole" name="leadingRole" value="">
		</div>
		<div class="divItemsCss">作品配角:
			<input type="text" style="width:370px;" class="txtCss" id="supportingRole" name="supportingRole" value="">
		</div> -->
		<div class="divItemsCss">作品封面:
			<input type="text" style="width:360px;" class="txtUploadCss" id="novelImg" readonly="readonly" name="novelImg" alt=".{1,200};请上传封面">&nbsp;&nbsp;&nbsp;
			<input type="button" id="novelImgBtn" value="上传" class="uploadBtnCss">
		</div>
		<div class="divItemsCss">
			我的编辑：<input type="button" value="我的编辑" class="saveBtnCss" onclick="$('#myEditor')[0].style.visibility='visible'">
			<input type="text" style="width:220px;visibility:hidden;" class="txtCss" id="myEditor" name="myEditor">
		</div>
		<div class="divItemsCss">
			<p>作品简介:</p>
			<p><textarea style="height:230px; width:80%;" id="vote" name="vote"></textarea></p>
		</div>
		<div class="divItemsCss">
			<input type="button" value="下一步" class="saveBtnCss" onclick="ajaxFormSubmit('create_novel_form')">
			<input type="reset" value="重置" class="resetBtnCss">
		</div> 
		</div>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>