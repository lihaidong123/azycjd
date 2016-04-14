<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			推荐位操作
		</div>
	</div>
	<form id="AnzhiRecommendFormAction" action="<%=request.getContextPath()%>/anzhirecommend/addAnzhiRecommend.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="novelId" id="novelId" value="${pojo.novelId}" alt=""/>
			<input type="hidden" class="txt" name="recommendPost" id="recommendPost" value="${pojo.recommendPost}" alt=""/>
			<div class='searchDivItemText' id="advTyperecommendPositions">
				<script language="javascript">
					showSelect("recommendPosition","recommendPosition","${param.recommendPosition}",recommendPositionTypeData,"advTyperecommendPositions","推荐位置：",false,135);
				</script>
			</div>
			<div class="textItem"><font class='textTitleCss'>备注说明：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注说明</font></div>

			<!-- <div class="textItem"><font class='textTitleCss'>推荐页面：</font><input type="text" class="txt" name="recommendPost" id="recommendPost" value="${pojo.recommendPost}" alt="[A-Za-z.A-Za-z]{2,};推荐页面输入错误"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写推荐页面</font></div> -->
			<%-- <div class="textItem"><font class='textTitleCss'>推荐小说：</font>
				<input type="button" class="searchBtnCss" value="增加" id="adminaddtjnovel" onclick="addtuijianxiaoshuo()"/>
			</div>
			<div class="tuijiandeaddress">
				<div class="yaojiadetuijian" style="margin-left:-15px;">
					<div style='margin-left:-15px;'>
						<font class='textTitleCss'>推荐编号：</font><input type='text' class='txt' name='novelId' id='novelId' value="${pojo.novelId }" style='width:80px;' onblur='checkFindNovelByIds(this,1)' alt='[0-9]{1,};推荐编号输入错误'/>
						<font class='textTitleCss'>小说名称：</font><input type='text' class='txt' name='novelTitle' id='novelTitle' value="${pojo.novelTitle }" alt='' onblur='checkFindNovelByName(this,1)'/>
						<font class='textTitleCss'>小说作者：</font><input type='text' class='txt' name='authorwritername' id='authorwritername' value="${pojo.authorwritername }" alt='.+;请输入正确的查询数据' readOnly='readOnly'/>
						<a class='textTitleCss' style='cursor:pointer;' onclick='removetuijianxiaoshuo(this)'>删除</a>
					</div>
				</div>
			</div> --%>
			
			<jsp:include page="searchNovel.jsp" flush="false">
				<jsp:param value="yes" name="includeAuthor"/>
			</jsp:include>
			
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiRecommendFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
