<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="adminHtmlEdit.jsp" flush="false" />
<script type="text/javascript">
	$(function(){
		$(".novellabelCss").click(function(){
			novellabelCss($(this)[0]);
		});
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
	.bigTypeTd{ width:120px; color:#CC0000; font-weight:bold;}
	.novel_type{ padding-bottom:10px; margin-top:10px; border-bottom:#CCCCCC 1px solid;}
	.bigTypeTd div{ margin-top:10px;}
	.smallTypeTd div{ float:left; margin-left:7px; margin-top:10px;}
</style>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			小说修改操作
		</div>
	</div>
	<form id="AnzhiNovelFormAction" action="<%=request.getContextPath()%>/anzhinovel/adminUpdateAnzhiNovel.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="authorId" id="authorId" readonly="readonly" value="${pojo.authorId}" alt=""/>
			<input type="hidden" id="novelType" name="novelType" value="${pojo.novelType }">
			<div class="textItem"><font class='textTitleCss'>小说名称：</font><input type="text" class="txt" name="novelTitle" id="novelTitle" value="${pojo.novelTitle}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写小说名称</font></div>
			<div class="textItem"><font class='textTitleCss'>小说摘要：</font><input type="text" class="txt" name="novelSummary" id="novelSummary" value="${pojo.novelSummary}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写小说摘要</font></div>
			<div class="textItem"><font class='textTitleCss'>小说作者：</font><input type="text" class="txt" name="authorWriterName" id="authorWriterName" readonly="readonly" value="${pojo.authorWriterName}" alt=""/></div>

			<div class="textItem"><font class='textTitleCss'>小说类型：</font>
				<div style="margin-top: 10px;"><input type="button" value="展开/收缩" class="resetBtnCss" onclick="$('#novel_type_div').slideToggle()"></div>
				<div id="novel_type_div" style="padding-bottom: 20px;display: none;">
	
				</div>
			</div>

			<div class="textItem">
				<font class='textTitleCss'>作品标签：</font><input type="text" style="width:620px;" readonly="readonly" class="txtCss" id="novelLabel" name="novelLabel" value="${pojo.novelLabel }" onfocus="$('#novelTanleDiv').slideDown()">
			</div>
			<div id="novelTanleDiv">
				<table width="100%">
					<c:forEach items="${novelLableList }" var="s" varStatus="ind">
						<tr>
							<td style="color: #48668e; padding-right:20px; text-align:right; font-weight: bold;" width="80" valign="top">${s.labelName }</td>
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
		
			
			<div class="textItem"><font class='textTitleCss'>小说封面：</font><input type="text" class="txt" name="novelImg" id="novelImg" value="${pojo.novelImg}" alt=""/>
				<input type="button" id="novelImgBtn" value="上传" class="uploadBtnCss">
				&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写小说封面</font>
			</div>

			<div class="textItem"><font class='textTitleCss'>我的编辑：</font><input type="text" class="txt" name="myEditor" id="myEditor" value="${pojo.myEditor}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写我的编辑</font></div>
			<div class='textItem' id="ifffdeelects">
				<script language="javascript">
					showSelect("postedWay","postedWay","${pojo.postedWay}",postedWayTypeDta,"ifffdeelects","发表方式：",false,135);
				</script>
			</div>
			<div class='textItem' id="isSignedeelects">
				<script language="javascript">
					showSelect("isSigned","isSigned","${pojo.isSigned}",isSignedTypeData,"isSignedeelects","是否签约：",false,135);
				</script>
			</div>
			<div class='textItem' id="isJinbitaeelects">
				<script language="javascript">
					showSelect("isJinbi","isJinbi","${pojo.isJinbi}",isJinbiTypeData,"isJinbitaeelects","撞金币：",false,135);
				</script>
			</div>
			<div class='textItem' id="advTypeisWangwens">
				<script language="javascript">
					showSelect("isWangwen","isWangwen","${pojo.isWangwen}",isWangwenTypeData,"advTypeisWangwens","网文大赛：",false,135);
				</script>
			</div>
			<div class="divItemsCss">
				<p>小说介绍：</p>
				<p><textarea style="height:230px; width: 90%;" id="vote" name="vote">${pojo.vote }</textarea></p>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiNovelFormAction',this)"/>
			</div>
			
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
