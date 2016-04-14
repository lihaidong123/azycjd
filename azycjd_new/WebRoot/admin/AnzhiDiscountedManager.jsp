<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			优惠书坊管理
		</div>
	</div>
	<form id="AnzhiDiscountedForm" action="anzhidiscounted/findAnzhiDiscountedAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText' id="advTypediscountedTypes">
				<script language="javascript">
					showSelect("discountedType","discountedType","${param.discountedType}",discountedTypeTypeData,"advTypediscountedTypes","优惠类型：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhidiscounted/findAnzhiDiscountedAll.do','AnzhiDiscountedForm')"/>
				<input id='addanzhidiscounted' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhidiscounted/anzhidiscountedAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>小说名称</td>
					<td>优惠类型</td>
					<td>截止日期</td>
					<td>优惠折扣</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhidiscountedList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td><a href="<%=request.getContextPath()%>/novel/${s.novelId }.jsp" target="_blank">${s.novelTitle }</a></td>
						<td>${s.discountedTypeName }</td>
						<td>
							<fmt:formatDate value="${s.discountedEndDate }" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td>${s.discountedRebate }</td>
						<td>
							<fmt:formatDate value="${s.addTime }" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td>
							<a id='updateanzhidiscounted${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhidiscounted/findAnzhiDiscountedById.do?anzhidiscountedId=${s.id}',this,'updateanzhidiscounted')">[查看]</a>
							<a id='deleteanzhidiscounted${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhidiscounted/delAnzhiDiscounted.do?anzhidiscountedId=${s.id }',this,'deleteanzhidiscounted')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhidiscounted/findAnzhiDiscountedAll.do" name="url"/>
				<jsp:param value="${anzhidiscountedList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhidiscountedList.num }" name="num"/>
				<jsp:param value="AnzhiDiscountedForm" name="formId"/>
				<jsp:param value="${anzhidiscountedList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
