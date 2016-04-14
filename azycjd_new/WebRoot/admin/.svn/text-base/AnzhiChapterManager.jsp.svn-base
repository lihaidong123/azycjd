<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<style type="text/css">
	
	.fenjuan_items{padding: 15px;}
	.fenjuanTitle{ font-family:"黑体"; font-size:14px; padding-left: 25px; height:40px; cursor:pointer; line-height:40px; background-color:#f0f0f0;}
	.chapter_title{ color:#0099CC;}
	#AnzhiChapterForm tr{ background-color:#FFFFFF !important;}
</style>
<script type="text/javascript">
	function showDivFn(id){
		$("#"+id).slideToggle();
	}
</script>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			章节管理&nbsp;&nbsp;&nbsp;<a href="javaScript:;" onclick="setChapterVip(this,${param.novelId})">手动加V</a>
		</div>
	</div>
	<form id="AnzhiChapterForm" action="anzhichapter/findAnzhiChapterAll.do" method="post">
		<div class="divTableCss" style="min-height: 300px; padding: 15px;">
		  <c:set var="chaper_num_index" value="1"></c:set>
		  <c:forEach items="${anzhifenjuanList.list }" var="s" varStatus="ind">
		  	<div class="fenjuan_items">
		  		<div class="fenjuanTitle" onclick="showDivFn('div${s.id }')">${10*(anzhifenjuanList.num-1)+ind.index+1}分卷：${s.juanName }</div>
		  		<div id="div${s.id }" class="tableCss" style="width:98%;margin: 0 auto;margin-top: 10px;">
					<table width="100%" border="0">
					  <tr class="titleCss">
					  	<td width="50%">章节名</td>
						<td width="10%">字数</td>
						<td width="15%">上传时间</td>
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
								<c:if test="${k.state eq 3 }">
									<font style="color:red;">待审核</font>
								</c:if>
						  	</td>
						  	<td>${k.chapterCharNum }</td>
							<td>${k.lastUpdateTime }</td>
							<td>
								<div id="actiondiv${k.id }">
									<c:if test="${k.state eq 1 && k.readType eq 0}">
										<input id="dfghj${k.id }" type="checkbox" name="jiavip" value="${k.id }" onclick="adminjiav(this)"/>加V
									</c:if>
									<c:if test="${k.state eq 1 && k.readType eq 1}">
										<a href="javascript:;" onclick="updateChapterReadType(${k.id},this)">取消加V</a>
									</c:if>
									<c:if test="${k.state eq 2}">
										未发布
									</c:if>
									<a id='deleteanzhichapter${k.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhichapter/delAnzhiChapterByAdmin.do?anzhichapterId=${k.id }&&novelId=${param.novelId }',this,'deleteanzhichapter')">[删除]</a>
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
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
