<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			福利申请管理
		</div>
	</div>
	<form id="AnzhiBenefitForm" action="anzhibenefit/findAnzhiBenefitAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				小说名称：<input class="inputTextCss" type="text" id="novelId" name="novelId" class="txt" value="${param.novelId}"/>
			</div>
			<div class='searchDivItemText' id="advTypebenefitTypes">
				<script language="javascript">
					showSelect("benefitType","benefitType","${param.benefitType}",benefitTypeTypeData,"advTypebenefitTypes","申请类型：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhibenefit/findAnzhiBenefitAll.do','AnzhiBenefitForm')"/>
				<c:if test="${not empty loginUsers && empty loginWebEditorUser }">
					<input class="searchBtnCss" style="margin-left: 20px;" type="button" value="导出EXCEL" onclick="window.open('<%=request.getContextPath()%>/anzhibenefit/downExcel.do')"/>
				</c:if>
				<!-- <input id='addanzhibenefit' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhibenefit/anzhibenefitAction.do')"/> -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>小说/作者名称</td>
					<td>申请状态</td>
					<td>申请时间</td>
					<td>申请类型</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhibenefitList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>
							<c:if test="${s.novelTitle ne '' }">
								<a href="<%=request.getContextPath()%>/novel/${s.novelId }.jsp" target="_blank">${s.novelTitle }</a>
							</c:if>
							<c:if test="${s.at ne '' }">
								${s.at }
							</c:if>
						</td>
						<td>
							<c:if test="${s.benefitState ==0}">未通过</c:if>
							<c:if test="${s.benefitState ==1}">通过</c:if>
						</td>
						<td>
							<fmt:formatDate value="${s.addTime }" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td>${benefitTypeTypeData[s.benefitType] }</td>
						<td>
							<a id='updateanzhibenefit${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhibenefit/findAnzhiBenefitById.do?anzhibenefitId=${s.id}',this,'updateanzhibenefit')">[查看]</a>
							<a id='deleteanzhibenefit${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhibenefit/delAnzhiBenefit.do?anzhibenefitId=${s.id }',this,'deleteanzhibenefit')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhibenefit/findAnzhiBenefitAll.do" name="url"/>
				<jsp:param value="${anzhibenefitList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhibenefitList.num }" name="num"/>
				<jsp:param value="AnzhiBenefitForm" name="formId"/>
				<jsp:param value="${anzhibenefitList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
