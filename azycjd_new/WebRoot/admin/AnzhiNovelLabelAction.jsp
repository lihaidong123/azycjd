<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			小说标签操作
		</div>
	</div>
	<form id="AnzhiNovelLabelFormAction" action="<%=request.getContextPath()%>/anzhinovellabel/addAnzhiNovelLabel.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="state" id="state" value="0" alt=""/>
			<div class="textItem"><font class='textTitleCss'>标签名称：</font><input type="text" class="txt" name="labelName" id="labelName" value="${pojo.labelName}" alt=".{1,50};标签长度应为1-50！"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写标签名称</font></div>
			<div class="textItem"><font class='textTitleCss'>所属标签:</font>
				<select name="fatherId" id="fatherId" style="width:200px;height: 27px;">
					<option value="0">父级标签</option>
					<c:forEach items="${anzhinovellabelList.list}" var="s">
						<option value="${s.id }" <c:if test="${s.id == pojo.fatherId }">selected</c:if>>${s.labelName }</option>
					</c:forEach>
				</select>
				&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请选择父级标签</font>
			</div>
			<div class="textItem"><font class='textTitleCss'>备注说明：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注说明</font></div>
			<!-- <div class='searchDivItemText' id="stateTypeData">
				<script language="javascript">
					showSelect("state","state","${pojo.state}",stateTypeData,"stateTypeData","启用状态：",false,145);
				</script>
			</div> -->
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiNovelLabelFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
