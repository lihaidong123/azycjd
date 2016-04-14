<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiNovelReward管理
		</div>
	</div>
	<form id="AnzhiNovelRewardForm" action="anzhinovelreward/findAnzhiNovelRewardAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				小说id：<input class="inputTextCss" type="text" id="novelId" name="novelId" class="txt" value="${param.novelId}"/>
			</div>
			<div class='searchDivItemText'>
				章节id：<input class="inputTextCss" type="text" id="chapterId" name="chapterId" class="txt" value="${param.chapterId}"/>
			</div>
			<div class='searchDivItemText'>
				用户id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				打赏类型(0-推荐票 1-催更票 2-月票 )：<input class="inputTextCss" type="text" id="rewardType" name="rewardType" class="txt" value="${param.rewardType}"/>
			</div>
			<div class='searchDivItemText'>
				打赏数量：<input class="inputTextCss" type="text" id="rewardNum" name="rewardNum" class="txt" value="${param.rewardNum}"/>
			</div>
			<div class='searchDivItemText'>
				打赏安之币：<input class="inputTextCss" type="text" id="rewardAnzhiMoney" name="rewardAnzhiMoney" class="txt" value="${param.rewardAnzhiMoney}"/>
			</div>
			<div class='searchDivItemText'>
				状态：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhinovelreward/findAnzhiNovelRewardAll.do','AnzhiNovelRewardForm')"/>
				<input id='addanzhinovelreward' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhinovelreward/anzhinovelrewardAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>小说id</td>
					<td>章节id</td>
					<td>用户id</td>
					<td>打赏类型(0-推荐票 1-催更票 2-月票 )</td>
					<td>打赏数量</td>
					<td>打赏安之币</td>
					<td>状态</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinovelrewardList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.novelId }</td>
						<td>${s.chapterId }</td>
						<td>${s.memberId }</td>
						<td>${s.rewardType }</td>
						<td>${s.rewardNum }</td>
						<td>${s.rewardAnzhiMoney }</td>
						<td>${s.state }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhinovelreward${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhinovelreward/findAnzhiNovelRewardById.do?anzhinovelrewardId=${s.id}',this,'updateanzhinovelreward')">[查看]</a>
							<a id='deleteanzhinovelreward${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhinovelreward/delAnzhiNovelReward.do?anzhinovelrewardId=${s.id }',this,'deleteanzhinovelreward')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinovelreward/findAnzhiNovelRewardAll.do" name="url"/>
				<jsp:param value="${anzhinovelrewardList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinovelrewardList.num }" name="num"/>
				<jsp:param value="AnzhiNovelRewardForm" name="formId"/>
				<jsp:param value="${anzhinovelrewardList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
