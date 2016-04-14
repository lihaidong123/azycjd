<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="tableCss">
		<table width="100%" border="0">
			<tr class="titleCss">
				<td>序号</td>
				<td>小说名称</td>
				<td>小说作者</td>
				<td>最新更新</td>
				<td>点击数</td>
				<td>阅读数</td>
				<td>是否签约</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${anzhinovelList.list}" var="s" varStatus="ind">
				<tr>
					<td>${ind.index+1 }</td>
					<td class="novel_title_click" onclick="window.open('<%=request.getContextPath()%>/novel/${s.id }.jsp')">${s.novelTitle }</td>
					<td>${s.authorWriterName }</td>
					<td>${s.updateTime }</td>
					<td>${s.clickNum }</td>
					<td>${s.readNum }</td>
					<td>${s.isSigned eq 0?'未签约':'已签约'}</td>
					<td>
						<input type="checkbox" name="novelIdCheckBox" value="${s.id }" onclick="chooseSearchNovel()"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
