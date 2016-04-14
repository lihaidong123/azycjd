<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编礼品管理
		</div>
	</div>
	<form id="AnzhiWebEditorGoodsForm" action="anzhiwebeditorgoods/findAnzhiWebEditorGoodsAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				礼品名称：<input class="inputTextCss" type="text" id="goodsName" name="goodsName" class="txt" value="${param.goodsName}"/>
			</div>
			<div class='searchDivItemText'>
				礼品类型：<input class="inputTextCss" type="text" id="goodsType" name="goodsType" class="txt" value="${param.goodsType}"/>
			</div>
			<div class='searchDivItemText' id="pictureStateTypeDataDatatwens">
				<script language="javascript">
					showSelect("state","state","${param.state}",pictureStateTypeData,"pictureStateTypeDataDatatwens","礼品状态：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditorgoods/findAnzhiWebEditorGoodsAll.do','AnzhiWebEditorGoodsForm')"/>
				<input id='addanzhiwebeditorgoods' type='button' class='addItemsRecord' value='添加记录' onclick="window.location.href='<%=request.getContextPath()%>/admin/getHtmlEdit.jsp?needLoadJsp=AnzhiWebEditorGoodsAction'"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>礼品名称</td>
					<td>兑换积分</td>
					<td>礼品类型</td>
					<td>状态</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditorgoodsList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.goodsName }</td>
						<td>${s.goodsScore }</td>
						<td>${s.goodsType }</td>
						<td>${s.state eq 0?'未启用':'启用' }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhiwebeditorgoods${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiwebeditorgoods/findAnzhiWebEditorGoodsById.do?anzhiwebeditorgoodsId=${s.id}',this,'updateanzhiwebeditorgoods')">[查看]</a>
							<a id='deleteanzhiwebeditorgoods${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditorgoods/delAnzhiWebEditorGoods.do?anzhiwebeditorgoodsId=${s.id }',this,'deleteanzhiwebeditorgoods')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditorgoods/findAnzhiWebEditorGoodsAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditorgoodsList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditorgoodsList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorGoodsForm" name="formId"/>
				<jsp:param value="${anzhiwebeditorgoodsList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
