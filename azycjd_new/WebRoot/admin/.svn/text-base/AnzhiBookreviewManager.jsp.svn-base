<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiBookreview管理
		</div>
	</div>
	<form id="AnzhiBookreviewForm" action="anzhibookreview/findAnzhiBookreviewAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				小说id：<input class="inputTextCss" type="text" id="novelId" name="novelId" class="txt" value="${param.novelId}"/>
			</div>
			<div class='searchDivItemText'>
				读者id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				书评标题：<input class="inputTextCss" type="text" id="bookreviewTitle" name="bookreviewTitle" class="txt" value="${param.bookreviewTitle}"/>
			</div>
			<div class='searchDivItemText'>
				书评内容：<input class="inputTextCss" type="text" id="bookreviewContent" name="bookreviewContent" class="txt" value="${param.bookreviewContent}"/>
			</div>
			<div class='searchDivItemText'>
				书评点击量：<input class="inputTextCss" type="text" id="bookreviewClicknum" name="bookreviewClicknum" class="txt" value="${param.bookreviewClicknum}"/>
			</div>
			<div class='searchDivItemText'>
				书评回复量：<input class="inputTextCss" type="text" id="bookreviewReplynum" name="bookreviewReplynum" class="txt" value="${param.bookreviewReplynum}"/>
			</div>
			<div class='searchDivItemText'>
				回复时间：<input class="inputTextCss" type="text" id="bookreviewReplyaddTime" name="bookreviewReplyaddTime" class="txt" value="${param.bookreviewReplyaddTime}"/>
			</div>
			<div class='searchDivItemText'>
				是否置顶：<input class="inputTextCss" type="text" id="isTop" name="isTop" class="txt" value="${param.isTop}"/>
			</div>
			<div class='searchDivItemText'>
				是否精华：<input class="inputTextCss" type="text" id="isMarrow" name="isMarrow" class="txt" value="${param.isMarrow}"/>
			</div>
			<div class='searchDivItemText'>
				是否悬赏：<input class="inputTextCss" type="text" id="isReward" name="isReward" class="txt" value="${param.isReward}"/>
			</div>
			<div class='searchDivItemText'>
				备注信息：<input class="inputTextCss" type="text" id="vote" name="vote" class="txt" value="${param.vote}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhibookreview/findAnzhiBookreviewAll.do','AnzhiBookreviewForm')"/>
				<input id='addanzhibookreview' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhibookreview/anzhibookreviewAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>小说id</td>
					<td>读者id</td>
					<td>书评标题</td>
					<td>书评内容</td>
					<td>书评点击量</td>
					<td>书评回复量</td>
					<td>回复时间</td>
					<td>是否置顶</td>
					<td>是否精华</td>
					<td>是否悬赏</td>
					<td>备注信息</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhibookreviewList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.novelId }</td>
						<td>${s.memberId }</td>
						<td>${s.bookreviewTitle }</td>
						<td>${s.bookreviewContent }</td>
						<td>${s.bookreviewClicknum }</td>
						<td>${s.bookreviewReplynum }</td>
						<td>${s.bookreviewReplyaddTime }</td>
						<td>${s.isTop }</td>
						<td>${s.isMarrow }</td>
						<td>${s.isReward }</td>
						<td>${s.vote }</td>
						<td>
							<a id='updateanzhibookreview${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhibookreview/findAnzhiBookreviewById.do?anzhibookreviewId=${s.id}',this,'updateanzhibookreview')">[查看]</a>
							<a id='deleteanzhibookreview${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhibookreview/delAnzhiBookreview.do?anzhibookreviewId=${s.id }',this,'deleteanzhibookreview')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhibookreview/findAnzhiBookreviewAll.do" name="url"/>
				<jsp:param value="${anzhibookreviewList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhibookreviewList.num }" name="num"/>
				<jsp:param value="AnzhiBookreviewForm" name="formId"/>
				<jsp:param value="${anzhibookreviewList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
