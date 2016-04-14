<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编礼品兑换管理
		</div>
	</div>
	<form id="AnzhiWebEditorGoodsChangeForm" action="anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText' <c:if test="${loginWebEditorUser ne null  }">style="display:none;"</c:if>>
				网编编号：<input class="inputTextCss" type="text" id="editorNo" name="editorNo" class="txt" value="${param.editorNo}"/>
			</div>
			<div class='searchDivItemText' <c:if test="${loginWebEditorUser ne null  }">style="display:none;"</c:if>>
				网编名称：<input class="inputTextCss" type="text" id="editorName" name="editorName" class="txt" value="${param.editorName}"/>
			</div>
			<div class='searchDivItemText'>
				礼品名称：<input class="inputTextCss" type="text" id="goodsName" name="goodsName" class="txt" value="${param.goodsName}"/>
			</div>
			<div class='searchDivItemText'>
				礼品类型：<input class="inputTextCss" type="text" id="goodsType" name="goodsType" class="txt" value="${param.goodsType}"/>
			</div>
			<div class='searchDivItemText'>
				兑换说明：<input class="inputTextCss" type="text" id="changeVote" name="changeVote" class="txt" value="${param.changeVote}"/>
			</div>
			<div class='searchDivItemText' id="stateens">
				<script language="javascript">
					showSelect("state","state","${param.state}",checkTypeData,"stateens","兑换状态：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll.do','AnzhiWebEditorGoodsChangeForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>网编编号</td>
					<td>礼品名称</td>
					<td>兑换说明</td>
					<td>状态</td>
					<td>兑换时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditorgoodschangeList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.anzhiWebEditor.editorNo }[${s.anzhiWebEditor.editorName }]</td>
						<td>${s.goodsName }</td>
						<td>${s.changeVote }</td>
						<td>
							<c:if test="${s.state eq 0 }">未处理</c:if>
							<c:if test="${s.state eq 1 }">已通过</c:if>
							<c:if test="${s.state eq 2 }">待处理</c:if>
							<c:if test="${s.state eq 3 }">已拒绝</c:if>
						</td>
						<td>${s.addTime }</td>
						<td>
							<c:if test="${s.state eq 0 }">
								<a id='updateanzhiwebeditorgoodschange${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeById.do?anzhiwebeditorgoodschangeId=${s.id}',this,'updateanzhiwebeditorgoodschange')">[查看]</a>
							</c:if>
							<c:if test="${loginUsers.memberType eq 2 && s.state eq 0 }">
								<a class='updateBtnCss' href='javascript:;' onclick="adminCheck(${s.id},'${s.anzhiWebEditor.editorName }积分兑换[${s.goodsName }]',13)">[审核]</a>
							</c:if>
							<%-- <a id='deleteanzhiwebeditorgoodschange${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditorgoodschange/delAnzhiWebEditorGoodsChange.do?anzhiwebeditorgoodschangeId=${s.id }',this,'deleteanzhiwebeditorgoodschange')">[删除]</a> --%>
						</td>
					</tr>
					<!-- 加载处理结果 -->
					<jsp:include page="get_handle_result.jsp" flush="false">
						<jsp:param value="7" name="colspanNum"/>
						<jsp:param value="${s.id }" name="tableId"/>
						<jsp:param value="13" name="handleType"/>
					</jsp:include>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditorgoodschangeList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditorgoodschangeList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorGoodsChangeForm" name="formId"/>
				<jsp:param value="${anzhiwebeditorgoodschangeList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
