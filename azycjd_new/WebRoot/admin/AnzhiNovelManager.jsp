<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			书籍管理
		</div>
	</div>
	<form id="AnzhiNovelForm" action="anzhinovel/findAnzhiNovelAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				小说名称：<input class="inputTextCss" type="text" id="novelTitle" name="novelTitle" class="txt" value="${param.novelTitle}"/>
			</div>
			<div class='searchDivItemText'>
				小说作者：<input class="inputTextCss" type="text" id="authorWriterName" name="authorWriterName" class="txt" value="${param.authorWriterName}"/>
			</div>
			<div class='searchDivItemText'>
				小说类型：<input class="inputTextCss" type="text" id="novelType" name="novelType" class="txt" value="${param.novelType}"/>
			</div>
			<div class='searchDivItemText'>
				我的编辑：<input class="inputTextCss" type="text" id="myEditor" name="myEditor" class="txt" value="${param.myEditor}"/>
			</div>
			<div class='searchDivItemText' id="stateataeelects">
				<script language="javascript">
					showSelect("state","state","${param.state}",novelStateTypeData,"stateataeelects","小说状态：",true,135);
				</script>
			</div>
			<div class='searchDivItemText' id="authorizationLevelataeelects">
				<script language="javascript">
					showSelect("authorizationLevel","authorizationLevel","${param.authorizationLevel}",authorizationLevelTypeData,"authorizationLevelataeelects","授权级别：",true,135);
				</script>
			</div>
			<div class='searchDivItemText' id="isSignedeelects">
				<script language="javascript">
					showSelect("isSigned","isSigned","${param.isSigned}",isSignedTypeData,"isSignedeelects","是否签约：",true,135);
				</script>
			</div>
			<div class='searchDivItemText' id="isJinbitaeelects">
				<script language="javascript">
					showSelect("isJinbi","isJinbi","${param.isJinbi}",isJinbiTypeData,"isJinbitaeelects","撞金币：",true,135);
				</script>
			</div>
			<div class='searchDivItemText' id="advTypeisWangwens">
				<script language="javascript">
					showSelect("isWangwen","isWangwen","${param.isWangwen}",isWangwenTypeData,"advTypeisWangwens","网文大赛：",true,135);
				</script>
			</div>
			
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhinovel/findAnzhiNovelAll.do','AnzhiNovelForm')"/>
				<!-- <input class="saveBtnCss" type="button" value="数据生成" onclick="createNovelDataAll(this)"/> -->
				<input class="saveBtnCss" type="button" value="生成Html" onclick="createHtmlNovel()"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>小说名称</td>
					<td>小说作者</td>
					<td>状态</td>
					<td>最新更新</td>
					<td>点击数</td>
					<td>订阅数</td>
					<td>总评数</td>
					<td>推荐数</td>
					<td>总字数</td>
					<td>收藏数</td>
					<td>是否签约</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinovelList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td class="novel_title_click">
							<a href="javascript:window.open('<%=request.getContextPath()%>/novel/${s.id }.jsp')" target="_blank">${s.novelTitle }</a>
						</td>
						<td>${s.authorWriterName }</td>
						<td>${s.state  eq 0?'未发表':(s.state  eq 0?'连载中':'完结')}</td>
						<td>${s.updateTime }</td>
						<td>${s.clickNum }</td>
						<td>${s.totalDingyueNum }</td>
						<td>${s.totalCommentNum }</td>
						<td>${s.totalRecommand }</td>
						<td>${s.totalCharNum }</td>
						<td>${s.totalSaveNum }</td>
						<td>${s.isSigned eq 0?'未签约':'已签约'}</td>
						<td>
							<a id='updateanzhinovel${s.id}2' class='updateBtnCss' href='javascript:;' onclick="window.location.href='<%=request.getContextPath()%>/anzhinovel/findAnzhiNovelById.do?novelId=${s.id}'">[查看]</a>
							<a id='updateanzhinovel${s.id}3' class='updateBtnCss' href='javascript:;' onclick="window.open('<%=request.getContextPath() %>/anzhinovel/txt.do?novelId=${s.id}')">[生成TXT]</a>
							<a id='updateanzhinovel${s.id}4' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhifenjuan/findAnzhiFenJuanManage.do?novelId=${s.id}',this,'updateanzhinovel')">[章节管理]</a>
							<a href="javascript:;" onclick="loadUpdatePageData('anzhicomment/anzhiCommentAllManageAdmin.do?tableId=${s.id}')">[评论管理]</a>
							<a id='deleteanzhinovel${s.id}5' class='delBtnCss' href='javascript:;' onclick="del('anzhinovel/delAnzhiNovel.do?anzhinovelId=${s.id }',this,'deleteanzhinovel')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinovel/findAnzhiNovelAll.do" name="url"/>
				<jsp:param value="${anzhinovelList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinovelList.num }" name="num"/>
				<jsp:param value="AnzhiNovelForm" name="formId"/>
				<jsp:param value="${anzhinovelList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
