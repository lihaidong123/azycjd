<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编推文管理
		</div>
	</div>
	<form id="AnzhiWebEditorTuijianForm" action="anzhiwebeditortuijian/findAnzhiWebEditorTuijianAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText' <c:if test="${loginWebEditorUser ne null  }">style="display:none;"</c:if>>
				网编编号：<input class="inputTextCss" type="text" id="editorNo" name="editorNo" class="txt" value="${param.editorNo}"/>
			</div>
			<div class='searchDivItemText' <c:if test="${loginWebEditorUser ne null  }">style="display:none;"</c:if>>
				网编名称：<input class="inputTextCss" type="text" id="editorName" name="editorName" class="txt" value="${param.editorName}"/>
			</div>
			<div class='searchDivItemText'>
				推文名称：<input class="inputTextCss" type="text" id="tuijianName" name="tuijianName" class="txt" value="${param.tuijianName}"/>
			</div>
			<div class='searchDivItemText'>
				推文说明：<input class="inputTextCss" type="text" id="tuijianVote" name="tuijianVote" class="txt" value="${param.tuijianVote}"/>
			</div>
			<div class='searchDivItemText'>
				推文链接：<input class="inputTextCss" type="text" id="tuijianUrl" name="tuijianUrl" class="txt" value="${param.tuijianUrl}"/>
			</div>
			<div class='searchDivItemText' id="isJiajingangwens">
				<script language="javascript">
					showSelect("isJiajing","isJiajing","${param.isJiajing}",checkTuiJianTypeData,"isJiajingangwens","是否加精：",true,135);
				</script>
			</div>
			<div class='searchDivItemText' id="isHotwens">
				<script language="javascript">
					showSelect("isHot","isHot","${param.isHot}",checkTuiJianTypeData,"isHotwens","是否热帖：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditortuijian/findAnzhiWebEditorTuijianAll.do','AnzhiWebEditorTuijianForm')"/>
				<!-- <input id='addanzhiwebeditortuijian' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiwebeditortuijian/anzhiwebeditortuijianAction.do')"/>
			 -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>网编编号</td>
					<td>推文名称</td>
					<td>是否加精</td>
					<td>是否热帖</td>
					<td>推文时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditortuijianList.list}" var="s" varStatus="ind">
					<tr title="${s.tuijianVote }">
						<td>${ind.index+1 }</td>
						<td>${s.anzhiWebEditor.editorNo }[${s.anzhiWebEditor.editorName }]</td>
						<td>${s.tuijianName }</td>	
						<td>
							<c:if test="${s.isJiajing eq 0 }">未加精
								<c:if test="${not empty loginWebEditorUser }">
									<a class='tuijiancss' href="JavaScript:;" onclick="updateTuiJian(1,2,this,${s.id})">[申请]</a>
								</c:if>
							</c:if>
							<c:if test="${s.isJiajing eq 1 }">已加精</c:if>
							<c:if test="${s.isJiajing eq 2 }">
								<c:if test="${not empty loginWebEditorUser }">
									申请中
								</c:if>
								<c:if test="${loginUsers.memberType eq 2 && s.isJiajing eq 2}">
									<a class='updateBtnCss' href='javascript:;' onclick="adminCheck(${s.id},'${s.anzhiWebEditor.editorName }申请推文加精',15)">[审核]</a>
								</c:if>
							</c:if>
							<c:if test="${s.isJiajing eq 3 }">加精申请不通过</c:if>
						</td>
						<td>
							<c:if test="${s.isHot eq 0 }">未热帖
								<c:if test="${not empty loginWebEditorUser }">
									<a class='tuijiancss' href="JavaScript:;" onclick="updateTuiJian(2,2,this,${s.id})">[申请]</a>
								</c:if>
							</c:if>
							<c:if test="${s.isHot eq 1 }">热帖</c:if>
							<c:if test="${s.isHot eq 2 }">
								<c:if test="${not empty loginWebEditorUser }">
									申请中
								</c:if>
								<c:if test="${loginUsers.memberType eq 2 && s.isHot eq 2}">
									<a class='updateBtnCss' href='javascript:;' onclick="adminCheck(${s.id},'${s.anzhiWebEditor.editorName }申请推文热帖',16)">[审核]</a>
								</c:if>
							</c:if>
							<c:if test="${s.isHot eq 3 }">热帖申请不通过</c:if>
						</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhiwebeditortuijian${s.id}' class='updateBtnCss' href="${s.tuijianUrl }" target="_blank">[前往链接]</a>
							<a id='updateanzhiwebeditortuijian${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiwebeditortuijian/findAnzhiWebEditorTuijianById.do?anzhiwebeditortuijianId=${s.id}',this,'updateanzhiwebeditortuijian')">[查看]</a>
							<a id='deleteanzhiwebeditortuijian${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditortuijian/delAnzhiWebEditorTuijian.do?anzhiwebeditortuijianId=${s.id }',this,'deleteanzhiwebeditortuijian')">[删除]</a>
						</td>
					</tr>
					<!-- 加载处理结果 -->
					<jsp:include page="get_handle_result.jsp" flush="false">
						<jsp:param value="7" name="colspanNum"/>
						<jsp:param value="${s.id }" name="tableId"/>
						<jsp:param value="15" name="handleType"/>
					</jsp:include>
					
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditortuijian/findAnzhiWebEditorTuijianAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditortuijianList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditortuijianList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorTuijianForm" name="formId"/>
				<jsp:param value="${anzhiwebeditortuijianList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
