<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编用户管理
		</div>
	</div>
	<form id="AnzhiWebEditorForm" action="anzhiwebeditor/findAnzhiWebEditorAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				网编编号：<input class="inputTextCss" type="text" id="editorNo" name="editorNo" class="txt" value="${param.editorNo}"/>
			</div>
			<div class='searchDivItemText'>
				网编届别：<input class="inputTextCss" type="text" id="editorJiebie" name="editorJiebie" class="txt" value="${param.editorJiebie}"/>
			</div>
			<div class='searchDivItemText'>
				网编名称：<input class="inputTextCss" type="text" id="editorName" name="editorName" class="txt" value="${param.editorName}"/>
			</div>
			<div class='searchDivItemText'>
				身份证号：<input class="inputTextCss" type="text" id="editorCode" name="editorCode" class="txt" value="${param.editorCode}"/>
			</div>
			<div class='searchDivItemText'>
				家庭住址：<input class="inputTextCss" type="text" id="editorAddress" name="editorAddress" class="txt" value="${param.editorAddress}"/>
			</div>
			<div class='searchDivItemText'>
				联系电话：<input class="inputTextCss" type="text" id="editorTel" name="editorTel" class="txt" value="${param.editorTel}"/>
			</div>
			<div class='searchDivItemText'>
				网编QQ：<input class="inputTextCss" type="text" id="editorQq" name="editorQq" class="txt" value="${param.editorQq}"/>
			</div>
			<div class='searchDivItemText'>
				助教昵称：<input class="inputTextCss" type="text" id="editorShifu" name="editorShifu" class="txt" value="${param.editorShifu}"/>
			</div>
			<div class='searchDivItemText' id="editorLevelTypeDatatwens">
				<script language="javascript">
					showSelect("editorLevel","editorLevel","${param.editorLevel}",editorLevelTypeData,"editorLevelTypeDatatwens","网编级别：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditor/findAnzhiWebEditorAll.do','AnzhiWebEditorForm')"/>
				<input id='addanzhiwebeditor' type='button' class='addItemsRecord' value='添加记录'  onclick="window.location.href='<%=request.getContextPath()%>/admin/getHtmlEdit.jsp?needLoadJsp=AnzhiWebEditorAction'"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>网编编号</td>
					<td>网编届别</td>
					<td>网编名称</td>
					<td>联系电话</td>
					<td>网编QQ</td>
					<td>积分</td>
					<td>网编级别</td>
					<td>助教昵称</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditorList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.editorNo }</td>
						<td>${s.editorJiebie }</td>
						<td>${s.editorName }</td>
						<td>${s.editorTel }</td>
						<td>${s.editorQq }</td>
						<td>${s.editorScore }</td>
						<td>${s.editorLevel }</td>
						<td>${s.editorShifu }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhiwebeditor${s.id}' class='updateBtnCss' href='javascript:;' onclick="window.location.href='<%=request.getContextPath()%>/anzhiwebeditor/findAnzhiWebEditorById.do?anzhiwebeditorId=${s.id}&&editorId=${s.id }'">[查看]</a>
							<a id='deleteanzhiwebeditor${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditor/delAnzhiWebEditor.do?anzhiwebeditorId=${s.id }',this,'deleteanzhiwebeditor')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditor/findAnzhiWebEditorAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditorList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditorList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorForm" name="formId"/>
				<jsp:param value="${anzhiwebeditorList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
