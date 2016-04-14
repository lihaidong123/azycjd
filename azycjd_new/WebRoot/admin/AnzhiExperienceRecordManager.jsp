<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			会员每日任务管理
		</div>
	</div>
	<form id="AnzhiExperienceRecordForm" action="anzhiexperiencerecord/findAnzhiExperienceRecordAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				用户昵称：<input class="inputTextCss" type="text" id="memberNick" name="memberNick" class="txt" value="${param.memberNick}"/>
			</div>
			<div class='searchDivItemText'>
				用户账号：<input class="inputTextCss" type="text" id="memberNo" name="memberNo" class="txt" value="${param.memberNo}"/>
			</div>
			<div class='searchDivItemText' id="ghdhlects">
				<script language="javascript">
					showSelect("experienceType","experienceType","${param.experienceType}",jingyanTypeData,"ghdhlects","任务类型：",true,135);
				</script>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiexperiencerecord/findAnzhiExperienceRecordAll.do','AnzhiExperienceRecordForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>用户昵称</td>
					<td>用户账号</td>
					<td>任务类型</td>
					<td>获得经验</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiexperiencerecordList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.memberNick }</td>
						<td>${s.memberNo }</td>
						<td>${experienceTypeArr[s.experienceType] }</td>
						<td>${s.experienceNum }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='deleteanzhiexperiencerecord${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiexperiencerecord/delAnzhiExperienceRecord.do?anzhiexperiencerecordId=${s.id }',this,'deleteanzhiexperiencerecord')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiexperiencerecord/findAnzhiExperienceRecordAll.do" name="url"/>
				<jsp:param value="${anzhiexperiencerecordList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiexperiencerecordList.num }" name="num"/>
				<jsp:param value="AnzhiExperienceRecordForm" name="formId"/>
				<jsp:param value="${anzhiexperiencerecordList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
