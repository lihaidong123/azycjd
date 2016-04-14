<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			平台收录管理
		</div>
	</div>
	<form id="AnzhiThirdRecommandForm" action="anzhithirdrecommand/findAnzhiThirdRecommandAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				小说名称：<input class="inputTextCss" type="text" id="novelTitle" name="novelTitle" class="txt" value="${param.novelTitle}"/>
			</div>
			<div class='searchDivItemText' id="sdfshaeelects">
				<script language="javascript">
					showSelect("thirdType","thirdType","${param.thirdType}",thirdRecommandTypeData,"sdfshaeelects","收录平台：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhithirdrecommand/findAnzhiThirdRecommandAll.do','AnzhiThirdRecommandForm')"/>
				<input id='addanzhithirdrecommand' type='button' class='addItemsRecord' value='添加记录' onclick="window.location.href='<%=request.getContextPath()%>/admin/getHtmlEdit.jsp?needLoadJsp=thirdRecommand'"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>小说名称</td>
					<td>收录平台</td>
					<td>备注说明</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhithirdrecommandList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.novelTitle }</td>
						<td>${thirdRecommandTypeData[s.thirdType] }</td>
						<td>${s.recommandVote }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='deleteanzhithirdrecommand${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhithirdrecommand/delAnzhiThirdRecommand.do?anzhithirdrecommandId=${s.id }',this,'deleteanzhithirdrecommand')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhithirdrecommand/findAnzhiThirdRecommandAll.do" name="url"/>
				<jsp:param value="${anzhithirdrecommandList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhithirdrecommandList.num }" name="num"/>
				<jsp:param value="AnzhiThirdRecommandForm" name="formId"/>
				<jsp:param value="${anzhithirdrecommandList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
