<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网站相关信息管理
		</div>
	</div>
	<form id="AnzhiOtherContentForm" action="anzhiothercontent/findAnzhiOtherContentAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				关于我们：<input class="inputTextCss" type="text" id="abotus" name="abotus" class="txt" value="${param.abotus}"/>
			</div>
			<div class='searchDivItemText'>
				用户指南：<input class="inputTextCss" type="text" id="yonghuzhinan" name="yonghuzhinan" class="txt" value="${param.yonghuzhinan}"/>
			</div>
			<div class='searchDivItemText'>
				诚聘英才：<input class="inputTextCss" type="text" id="chengpinyingcai" name="chengpinyingcai" class="txt" value="${param.chengpinyingcai}"/>
			</div>
			<div class='searchDivItemText'>
				联系我们：<input class="inputTextCss" type="text" id="lianxiwomen" name="lianxiwomen" class="txt" value="${param.lianxiwomen}"/>
			</div>
			<div class='searchDivItemText'>
				编辑专区：<input class="inputTextCss" type="text" id="bianjizhuanqu" name="bianjizhuanqu" class="txt" value="${param.bianjizhuanqu}"/>
			</div>
			<div class='searchDivItemText'>
				版权维护：<input class="inputTextCss" type="text" id="banquanweihu" name="banquanweihu" class="txt" value="${param.banquanweihu}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiothercontent/findAnzhiOtherContentAll.do','AnzhiOtherContentForm')"/>
				<!-- <input id='addanzhiothercontent' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiothercontent/anzhiothercontentAction.do')"/> -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>关于我们</td>
					<td>用户指南</td>
					<td>诚聘英才</td>
					<td>联系我们</td>
					<td>编辑专区</td>
					<td>版权维护</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiothercontentList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${fn:substring(s.abotus,50,60)}</td>
						<td>${fn:substring(s.yonghuzhinan,50,60) }</td>
						<td>${fn:substring(s.chengpinyingcai,50,60) }</td>
						<td>${fn:substring(s.lianxiwomen,50,60) }</td>
						<td>${fn:substring(s.bianjizhuanqu,50,60) }</td>
						<td>${fn:substring(s.banquanweihu,50,60) }</td>
						<td>
							<a id='updateanzhiothercontent${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiothercontent/findAnzhiOtherContentById.do?anzhiothercontentId=${s.id}',this,'updateanzhiothercontent')">[查看]</a>
							<!-- <a id='deleteanzhiothercontent${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiothercontent/delAnzhiOtherContent.do?anzhiothercontentId=${s.id }',this,'deleteanzhiothercontent')">[删除]</a> -->
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiothercontent/findAnzhiOtherContentAll.do" name="url"/>
				<jsp:param value="${anzhiothercontentList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiothercontentList.num }" name="num"/>
				<jsp:param value="AnzhiOtherContentForm" name="formId"/>
				<jsp:param value="${anzhiothercontentList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
