<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="htmlEditAdmin.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			发布公告
		</div>
	</div>
	<form id="AnzhiNewsFormAction" action="<%=request.getContextPath()%>/anzhinews/addAnzhiNews.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="newsAuthor" id="newsAuthor" value="${loginUsers.memberNo}" alt=""/>
			<input type="hidden" class="txt" name="newsClicknum" id="newsClicknum" value="0" alt=""/>
			<div class="textItem"><font class='textTitleCss'>公告标题：</font><input type="text" class="txt" name="newsTitle" id="newsTitle" value="${pojo.newsTitle}" alt=".{1,50};公告标题长度应为1-50！"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写公告标题</font></div>
			<div class='searchDivItemText' id="advTypeDataeelects">
				<script language="javascript">
					showSelect("newsType","newsType","${pojo.newsType}",advTypeData,"advTypeDataeelects","公告类型：",false,145);
				</script>
			</div>
			<div class='searchDivItemText' id="newsStateelects">
				<script language="javascript">
					showSelect("newsState","newsState","${pojo.newsState}",zhidingTypeData,"newsStateelects","是否置顶：",false,145);
				</script>
			</div>
			<div class="divItemsCss">
				<p>公告内容：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="newsContent" name="newsContent"></textarea></p>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiNewsFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
