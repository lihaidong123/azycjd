<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			会员管理
		</div>
	</div>
	<form id="AnzhiMemberForm" action="anzhimember/findAnzhiMemberAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				读者账号：<input class="inputTextCss" type="text" id="memberNo" name="memberNo" class="txt" value="${param.memberNo}"/>
			</div>
			<div class='searchDivItemText'>
				读者姓名：<input class="inputTextCss" type="text" id="menberPassword" name="menberPassword" class="txt" value="${param.menberPassword}"/>
			</div>
			<div class='searchDivItemText'>
				读者昵称：<input class="inputTextCss" type="text" id="memberNick" name="memberNick" class="txt" value="${param.memberNick}"/>
			</div>
			<div class='searchDivItemText'>
				读者Q&nbsp;&nbsp;Q：<input class="inputTextCss" type="text" id="memberQq" name="memberQq" class="txt" value="${param.memberQq}"/>
			</div>
			<div class='searchDivItemText'>
				联系电话：<input class="inputTextCss" type="text" id="memberTel" name="memberTel" class="txt" value="${param.memberTel}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhimember/findAnzhiMemberAll.do','AnzhiMemberForm')"/>
				<input class="saveBtnCss" type="button" style="width:190px;" value="批量赠送阅读币" onclick="direcNum('anzhimember/piliangReadMoney.do','AnzhiMemberForm')"/>
				<!-- <input id='addanzhimember' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhimember/anzhimemberAction.do')"/> -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>读者账号</td>
					<td>读者昵称</td>
					<!-- <td>读者QQ</td> -->
					<td>读者性别</td>
					<td>真实姓名</td>
					<!-- <td>联系电话</td> -->
					<td>安之币</td>
					<td>阅读币</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhimemberList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.memberNo }</td>
						<td>${s.memberNick }</td>
						<%-- <td>${s.memberQq }</td> --%>
						<td>${s.memberSex }</td>
						<td>${s.memberRealName }</td>
						<%-- <td>${s.memberTel }</td> --%>
						<td>${s.memberMoney }</td>
						<td>${s.readMoney }</td>
						<td>
							<c:if test="${s.isAddComment eq 0 }">
								<a id='updateanzhimember${s.id}2' class='updateBtnCss' href='javascript:;' onclick="updateRecord(2,1,this,'${s.id}',0)">[禁言]</a>
							</c:if>
							<c:if test="${s.isAddComment eq 1 }">
								<a id='updateanzhimember${s.id}3' class='updateBtnCss' href='javascript:;' onclick="updateRecord(2,0,this,'${s.id}',0)">[取消禁言]</a>
							</c:if>
							<c:if test="${s.isNoLogin eq 0 }">
								<a id='updateanzhimember${s.id}4' class='updateBtnCss' href='javascript:;' onclick="updateRecord(3,1,this,'${s.id}',0)">[封号]</a>
							</c:if>
							<c:if test="${s.isNoLogin eq 1 }">
								<a id='updateanzhimember${s.id}5' class='updateBtnCss' href='javascript:;' onclick="updateRecord(3,0,this,'${s.id}',0)">[取消封号]</a>
							</c:if>
							<a id='updateanzhimember${s.id}3456' class='updateBtnCss' href='javascript:;' onclick="resetMemberPass('${s.memberNick}','${s.id }',this)">[重置密码]</a>
							<a id='updateanzhimember${s.id}7' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhinovelreadmoneyrecord/anzhinovelreadmoneyrecordAction.do?memberId=${s.id}',this,'updateanzhimember')">[赠送阅读币]</a>
							<a id='updateanzhimember${s.id}9' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhimember/findAnzhiMemberById.do?anzhimemberId=${s.id}',this,'updateanzhimember')">[查看]</a>
							<a id='deleteanzhimember${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhimember/delAnzhiMember.do?anzhimemberId=${s.id }',this,'deleteanzhimember')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhimember/findAnzhiMemberAll.do" name="url"/>
				<jsp:param value="${anzhimemberList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhimemberList.num }" name="num"/>
				<jsp:param value="AnzhiMemberForm" name="formId"/>
				<jsp:param value="${anzhimemberList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
