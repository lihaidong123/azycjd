<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<jsp:include page="checkNovelId.jsp" flush="false"></jsp:include>
<script language="javascript">
	var isSign=false;
	var oldNovelTitle="";
	$(function(){
		writeNovelType("novel_type_div");
		setChooseType();
	});
	
	function setChooseType(){
		var novelType=$("#novelType").val().split(/['\/','@',';']/);//古代言情@架空玄幻;异族恋情;远古神话;/玄幻奇幻@异界争霸;异类兽族;/历史军事@外国历史;两宋元明;/
		$("#novel_type_div input").each(function(){
			for(var i=0;i<novelType.length;i++){
				if($(this).val()==novelType[i]){
					$(this)[0].checked=true;
					break;
				}
			}
		});
		
		var novelLabel=$("#novelLabel").val().split(",");
		$(".novellabelCss").each(function(){
			for(var i=0;i<novelLabel.length;i++){
				if($(this).val()==novelLabel[i]){
					$(this)[0].checked=true;
					break;
				}
			}
		});
	}
</script>
<style type="text/css">
	.bigTypeTd{ width:100px; color:#CC0000; font-weight:bold;}
	.novel_type{ padding-bottom:10px; margin-top:10px; border-bottom:#CCCCCC 1px solid;}
	.bigTypeTd div{ margin-top:10px;}
	.smallTypeTd div{ float:left; margin-left:7px; margin-top:10px;}
</style>
<form class="formCss" id="update_novel_form" action="<%=request.getContextPath() %>/anzhinovel/addAnzhiNovel.do" method="post">
	<div class="htmlTitleCss">
		<div class="htmlTitleCsss_one">作品修改</div>
	</div>
	<c:if test="${pojo.state eq 3 }">
		<div style="padding-top: 20px;">当前小说已经完结，不能修改！如需要修改请联系管理员！</div>
	</c:if>
	<c:if test="${pojo.state ne 3 }">
		<c:if test="${pojo.isSigned eq 1  }">
			<div style="padding-top: 20px;">友情提示：当前小说已经签约，如果修改了作品名称，需要管理员审核后才能生效！</div>
			<script language="javascript">
				isSign=true;
				oldNovelTitle="${pojo.novelTitle }";
			</script>
		</c:if>
		<div>
			<input type="hidden" id="id" name="id" value="${pojo.id }">
			<input type="hidden" id="novelType" name="novelType" value="${pojo.novelType }">
			<div class="divItemsCss">作品名称:
				<input type="text" class="txtCss" id="novelTitle" value="${pojo.novelTitle }" name="novelTitle" alt="\S{1,30};作品名称长度需是1-30之间">
			</div>
			<div class="divItemsCss">摘要说明:
				<input type="text" class="txtCss" style="width:320px;" value="${pojo.novelSummary }" id="novelSummary" name="novelSummary" alt="\S{1,30};摘要说明长度需是1-30之间">
			</div>
			<div class="divItemsCss">作品类型:
				<div style="margin-top: 10px;"><input type="button" value="展开/收缩" class="resetBtnCss" onclick="$('#novel_type_div').slideToggle()"></div>
				<div id="novel_type_div" style="padding-bottom: 20px;display: none;">
	
				</div>
			</div>
			<div class="divItemsCss">
				<div>
					作品标签：<input type="text" style="width:620px;" readonly="readonly" value="${pojo.novelLabel }" class="txtCss" id="novelLabel" name="novelLabel" onfocus="$('#novelTanleDiv').slideDown()">
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
				<%--<input type="text" style="width:300px;" readonly="readonly" class="selectTxtCss" id="postedWayInput" name="postedWayInput" value="${pojo.postedWay }"> --%>
				<c:if test="${pojo.postedWay eq 0 }">原创首发</c:if>
				<c:if test="${pojo.postedWay eq 1 }">他站首发</c:if>
			</div>
			<c:if test="${pojo.state <4 }">
				<div class="divItemsCss">小说状态:
					<input type="text" style="width:300px;" class="selectTxtCss" id="stateInput" name="stateInput" value="${pojo.state }">
				</div>
			</c:if>
			<%-- <div class="divItemsCss">关键词语:
				<input type="text" style="width:480px;" class="txtCss" value="${pojo.categories }" id="categories" name="categories">
			</div>
			<div class="divItemsCss">作品主角:
				<input type="text" style="width:370px;" class="txtCss" value="${pojo.leadingRole }" id="leadingRole" name="leadingRole">
			</div>
			<div class="divItemsCss">作品配角:
				<input type="text" style="width:370px;" class="txtCss" value="${pojo.supportingRole }" id="supportingRole" name="supportingRole">
			</div> --%>
			
			<div class="divItemsCss">作品封面:
				<input type="text" style="width:360px;" class="txtUploadCss" id="novelImg" value="${pojo.novelImg }" name="novelImg">&nbsp;&nbsp;&nbsp;
				<input type="button" id="novelImgBtn" value="上传" class="uploadBtnCss">
			</div>
			<div class="divItemsCss">我的编辑:
				<input type="text" style="width:220px;" class="txtCss" value="${pojo.myEditor }" id="myEditor" name="myEditor">
			</div>
			<div class="divItemsCss">
				<p>作品简介:</p>
				<p><textarea style="height:230px; width:80%;" id="vote" name="vote">${pojo.vote }</textarea></p>
			</div>
			<div class="divItemsCss">
				<input type="button" value="保存" class="saveBtnCss" onclick="ajaxFormSubmit('update_novel_form')">
				<input type="reset" value="重置" class="resetBtnCss">
			</div> 
		</div>
	</c:if>
	
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>