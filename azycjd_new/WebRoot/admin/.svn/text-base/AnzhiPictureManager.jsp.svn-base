<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			图片管理
		</div>
	</div>
	<form id="AnzhiPictureForm" action="anzhipicture/findAnzhiPictureAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				图片名称：<input class="inputTextCss" type="text" id="pictureName" name="pictureName" class="txt" value="${param.pictureName}"/>
			</div>
			<div class='searchDivItemText' id="pictureStateTypeDatadfghjk">
				<script language="javascript">
					showSelect("state","state","${param.state}",pictureStateTypeData,"pictureStateTypeDatadfghjk","启用状态：",true,135);
				</script>
			</div>
			<div class='searchDivItemText' id="dfgpictureType">
				<script language="javascript">
					showSelect("pictureType","pictureType","${param.pictureType}",pictureTypeData,"dfgpictureType","图片类型：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhipicture/findAnzhiPictureAll.do','AnzhiPictureForm')"/>
				<input id='addanzhipicture' type='button' class='addItemsRecord' value='添加记录' onclick="window.location.href='<%=request.getContextPath()%>/admin/getHtmlEdit.jsp?needLoadJsp=pictureAction'"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>图片名称</td>
					<td>图片说明</td>
					<td>图片类型</td>
					<td>状态</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhipictureList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.pictureName }</td>
						<td>${s.pictureVote }</td>
						<td>${pictureType[s.pictureType] }</td>
						<td>${s.state eq 0?'未启用':'启用' }</td>
						<td>${s.addTime }</td>
						<td>
							<a href="${s.pictureUrl }" target="_blank">[预览]</a>
							<a id='updateanzhipicture${s.id}' class='updateBtnCss' href='javascript:;' onclick="window.location.href='<%=request.getContextPath()%>/anzhipicture/findAnzhiPictureById.do?anzhipictureId=${s.id}'">[修改]</a>
							<a id='deleteanzhipicture${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhipicture/delAnzhiPicture.do?anzhipictureId=${s.id }',this,'deleteanzhipicture')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhipicture/findAnzhiPictureAll.do" name="url"/>
				<jsp:param value="${anzhipictureList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhipictureList.num }" name="num"/>
				<jsp:param value="AnzhiPictureForm" name="formId"/>
				<jsp:param value="${anzhipictureList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
