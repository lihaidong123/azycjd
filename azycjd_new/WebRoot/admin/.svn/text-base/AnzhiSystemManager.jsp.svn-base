<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiSystem管理
		</div>
	</div>
	<form id="AnzhiSystemForm" action="anzhisystem/findAnzhiSystemAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				关于我们：<input class="inputTextCss" type="text" id="aboutUs" name="aboutUs" class="txt" value="${param.aboutUs}"/>
			</div>
			<div class='searchDivItemText'>
				用户指南：<input class="inputTextCss" type="text" id="userGuide" name="userGuide" class="txt" value="${param.userGuide}"/>
			</div>
			<div class='searchDivItemText'>
				作者投稿：<input class="inputTextCss" type="text" id="authorProject" name="authorProject" class="txt" value="${param.authorProject}"/>
			</div>
			<div class='searchDivItemText'>
				诚聘英才：<input class="inputTextCss" type="text" id="talentsWanted" name="talentsWanted" class="txt" value="${param.talentsWanted}"/>
			</div>
			<div class='searchDivItemText'>
				联系我们：<input class="inputTextCss" type="text" id="touchUs" name="touchUs" class="txt" value="${param.touchUs}"/>
			</div>
			<div class='searchDivItemText'>
				合作渠道：<input class="inputTextCss" type="text" id="channelsCooperation" name="channelsCooperation" class="txt" value="${param.channelsCooperation}"/>
			</div>
			<div class='searchDivItemText'>
				编辑专区：<input class="inputTextCss" type="text" id="editArea" name="editArea" class="txt" value="${param.editArea}"/>
			</div>
			<div class='searchDivItemText'>
				版权维护：<input class="inputTextCss" type="text" id="copyrightProtection" name="copyrightProtection" class="txt" value="${param.copyrightProtection}"/>
			</div>
			<div class='searchDivItemText'>
				备注信息：<input class="inputTextCss" type="text" id="vote" name="vote" class="txt" value="${param.vote}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhisystem/findAnzhiSystemAll.do','AnzhiSystemForm')"/>
				<input id='addanzhisystem' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhisystem/anzhisystemAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>关于我们</td>
					<td>用户指南</td>
					<td>作者投稿</td>
					<td>诚聘英才</td>
					<td>联系我们</td>
					<td>合作渠道</td>
					<td>编辑专区</td>
					<td>版权维护</td>
					<td>备注信息</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhisystemList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.aboutUs }</td>
						<td>${s.userGuide }</td>
						<td>${s.authorProject }</td>
						<td>${s.talentsWanted }</td>
						<td>${s.touchUs }</td>
						<td>${s.channelsCooperation }</td>
						<td>${s.editArea }</td>
						<td>${s.copyrightProtection }</td>
						<td>${s.vote }</td>
						<td>
							<a id='updateanzhisystem${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhisystem/findAnzhiSystemById.do?anzhisystemId=${s.id}',this,'updateanzhisystem')">[查看]</a>
							<a id='deleteanzhisystem${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhisystem/delAnzhiSystem.do?anzhisystemId=${s.id }',this,'deleteanzhisystem')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhisystem/findAnzhiSystemAll.do" name="url"/>
				<jsp:param value="${anzhisystemList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhisystemList.num }" name="num"/>
				<jsp:param value="AnzhiSystemForm" name="formId"/>
				<jsp:param value="${anzhisystemList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
