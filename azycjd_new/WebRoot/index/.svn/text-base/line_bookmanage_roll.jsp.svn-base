<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<jsp:include page="checkNovelId.jsp" flush="false"></jsp:include>
<style type="text/css">
	.div_css_test{display: none;}
	.fenjuan_items{padding: 15px;}
	.fenjuanTitle{ font-family:"黑体"; font-size:14px; padding-left: 25px; height:40px; cursor:pointer; line-height:40px; background-color:#f0f0f0;}
	.chapter_title{ color:#0099CC;}
	#AnzhiFenJuanFormIndex tr{ background-color:#FFFFFF !important;}
</style>
<script type="text/javascript">
	function showDivFn(id){
		$("#"+id).slideToggle();
	}
	function showNoPassVote(info){
		/* $.jBox.messager(info,"拒绝说明",10000); */
		$.jBox("<div class='youqintisi_css'>"+info+"</div>",{
			title: "<div style='font-size:14px;'>友情提示</div>",
			width: 350,
			height: 170,
			top:240,
			persistent: false,
			buttons: { '关闭': true },
			closed:function(){
				$("#body_index").css("background","url("+path+"/index/images/bg.png) repeat-x #f0f0f0").css("padding","0px").css("margin","0px");
			}
		});
	}
</script>
<div id="addFenJuanDiv" style="padding: 30px;">
	<div class="divItemsCss">
		<input id='addanzhifenjuan' type='button' class='resetBtnCss' value='添加分卷' onclick="$('#AnzhiFenJuanFormActionDiv').slideToggle()"/>
	</div> 
	<div id="AnzhiFenJuanFormActionDiv" style="display: none;">
		<form id="AnzhiFenJuanFormActionIndex" action="<%=request.getContextPath()%>/anzhifenjuan/addAnzhiFenJuan.do" method="post">
			<div class="inputItemsCssss">
				<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
				<input type="hidden" class="txtCss" name="novelId" id="novelId" value="${param.novelId}" alt=""/>
				<div class="divItemsCss"><font class='textTitleCss'>分卷标题：</font><input type="text" class="txtCss" name="juanName" id="juanName" value="${pojo.juanName}" alt="\S{1,30};请输入分卷名称"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写分卷标题</font></div>
				<div class="divItemsCss"><font class='textTitleCss'>分卷备注：</font><input type="text" class="txtCss" name="juanVote" id="juanVote" value="${pojo.juanVote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写分卷备注</font></div>
				<div class="divItemsCss">
					<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiFenJuanFormActionIndex',this)"/>
				</div>
			</div>
		</form>
	</div>
</div>
<form id="AnzhiFenJuanFormIndex" action="anzhifenjuan/findAnzhiFenJuanAll.do?novelId=${param.novelId}" method="post">
	<div class="divTableCss" style="min-height: 300px; padding: 15px;">
	  <c:set var="chaper_num_index" value="1"></c:set>
	  <c:forEach items="${anzhifenjuanList.list }" var="s" varStatus="ind">
	  	<div class="fenjuan_items">
	  		<div class="fenjuanTitle" onclick="showDivFn('div${s.id }')">${10*(anzhifenjuanList.num-1)+ind.index+1}分卷：${s.juanName }</div>
	  		<div id="div${s.id }" class="div_css_test" style="width:95%;margin: 0 auto;">
				<table width="100%" border="0">
				  <tr class="chapter_title">
				  	<td width="45%">章节名</td>
					<td width="10%">字数</td>
					<td width="20%">上传时间</td>
					<td width="25%">操作</td>
				  </tr>
				  <c:forEach items="${s.ls }" var="k">
		  			<tr>
					  	<td class="${k.readType eq 0?'free_chapter':'vip_chapter' }">第${chaper_num_index}章 ${k.chapterTitle }
					  		<c:if test="${k.state eq 1 }">
								&nbsp;[<a style="color:#d60a0a;" href="<%=request.getContextPath() %>/anzhichapter/read.do?chapterId=${k.id}" target="_blank">预览</a>]
							</c:if>
							<c:if test="${k.state ne 1 }">
								&nbsp;[<a style="color:blue;" href="<%=request.getContextPath() %>/anzhichapter/indexLook.do?anzhichapterId=${k.id}" target="_blank">预览</a>]
							</c:if>
					  	</td>
					  	<td>${k.chapterCharNum }</td>
						<td>
							<fmt:formatDate value="${k.addTime }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
							<div id="actiondiv${k.id }">
								<c:if test="${k.state eq 0 && k.noPassVote ne 'no'}">
									<a href="javascript:;" onclick="showNoPassVote('${k.noPassVote}')">已拒绝</a>
								</c:if>
								<c:if test="${k.state eq 0 }">
									<a id="anzhichapter/findAnzhiChapterById.do#anzhichapterId=${k.id }#novelId=${param.novelId }#linenumber=11#index=8#chooseIndex=0" href="javascript:;" onclick="getJspData(this)">修改/调卷</a>
								   &nbsp;|&nbsp;<a href="javascript:;" onclick="getJspDataByUrl('index/reason.jsp#tableId=${k.id}#tabNameIndex=1#actionType=9#stateValue=4#actionUrl=anzhifenjuan/findAnzhiFenJuanAll.do#t=${param.novelId}')">删除</a>
								</c:if>
								<c:if test="${k.state eq 1 }">
									已发布&nbsp;|&nbsp;
									<c:if test="${k.readType eq 0 }">
										<a id="anzhichapter/findAnzhiChapterById.do#anzhichapterId=${k.id }#novelId=${param.novelId }#linenumber=11#index=8#chooseIndex=0" href="javascript:;" onclick="getJspData(this)">修改/调卷</a>
									</c:if>
									<c:if test="${k.readType eq 1 }">
										<select onchange="updateFenJuan(${k.id },this)">
											<c:forEach items="${anzhifenjuanList.list }" var="d">
												<c:if test="${d.id eq k.fenJuanId }">
													<option value="${d.id }" selected="selected">${d.juanName }</option>
												</c:if>
												<c:if test="${d.id ne k.fenJuanId }">
													<option value="${d.id }">${d.juanName }</option>
												</c:if>
											</c:forEach>
										</select>
									</c:if>
								</c:if>
								<c:if test="${k.state eq 2 }">
									定时发布&nbsp;|&nbsp;<a id="anzhichapter/findAnzhiChapterById.do#anzhichapterId=${k.id }#novelId=${param.novelId }#linenumber=11#index=8#chooseIndex=0" href="javascript:;" onclick="getJspData(this)">修改/调卷</a>
								</c:if>
								<c:if test="${k.state eq 3 }">
									<font style="color:red;">待审核</font>
								</c:if>
								<c:if test="${k.state eq 4 }">
									<font style="color:red;">删除审核中</font>
								</c:if>
							</div>
						</td>
					  </tr>
					  <c:set var="chaper_num_index" value="${chaper_num_index+1 }"></c:set>
		 		 </c:forEach>
				</table>
			</div>
	  	</div>
	  </c:forEach>
	  
	</div>
	<div style="padding: 15px;">
		<jsp:include page="../next_page.jsp" flush="false">
			<jsp:param value="anzhifenjuan/findAnzhiFenJuanAll.do?novelId=${param.novelId}&&linenumber=11&&index=8&&chooseIndex=1" name="url"/>
			<jsp:param value="${anzhifenjuanList.totalNum }" name="totalNum"/>
			<jsp:param value="${anzhifenjuanList.num }" name="num"/>
			<jsp:param value="AnzhiFenJuanFormIndex" name="formId"/>
			<jsp:param value="${anzhifenjuanList.total }" name="total"/>
			<jsp:param value="${param.size}" name="size"/>
		</jsp:include>
	</div>
	
</form>


<jsp:include page="index_foot.jsp" flush="false"></jsp:include>