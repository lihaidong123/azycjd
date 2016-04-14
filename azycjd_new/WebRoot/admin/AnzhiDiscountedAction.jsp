<%@page import="com.anzhi.web.util.DateFormat"%>
<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	DateFormat d=new DateFormat();
	String nowWeedEnd=d.getDateType(3);
 %>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<script type="text/javascript">
	var nowWeedEnd='<%=nowWeedEnd%>';
</script>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			优惠书坊操作
		</div>
	</div>
	<form id="AnzhiDiscountedFormAction" action="<%=request.getContextPath()%>/anzhidiscounted/addAnzhiDiscounted.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="novelId" id="novelId" value="${pojo.novelId}" alt=""/>
			<div class='searchDivItemText' id="advTypediscountedTypes">
				<script language="javascript">
					showSelect("discountedType","discountedType","${param.discountedType}",discountedTypeTypeData,"advTypediscountedTypes","优惠类型：",false,135);
				</script>
			</div>
			<%-- <div class="textItem"><font class='textTitleCss'>推荐小说：</font>
				<input type="button" class="searchBtnCss" value="增加" id="adminaddtjnovel" onclick="addtuijianxiaoshuoer()"/>
			</div>
			<div class="tuijiandeaddress">
				<div class="yaojiadetuijian" style="margin-left:-15px;">
					<div style='margin-left:-15px;'>
						<font class='textTitleCss'>推荐编号：</font><input type='text' class='txt' name='novelId' id='novelId' value="${pojo.novelId }" style='width:80px;' onblur='checkFindNovelByIds(this,2)' alt='[0-9]{1,};推荐编号输入错误'/>
						<font class='textTitleCss'>小说名称：</font><input type='text' class='txt' name='novelTitle' id='novelTitle' value="${pojo.novelTitle }" alt='' onblur='checkFindNovelByName(this,2)'/>
						<font class='textTitleCss'>小说作者：</font><input type='text' class='txt' name='authorwritername' id='authorwritername' value="${pojo.authorwritername }"  alt='.+;请输入正确的查询数据' readOnly='readOnly'/>
						<a class='textTitleCss' style='cursor:pointer;' onclick='removetuijianxiaoshuo(this)'>删除</a>
					</div>
				</div>
			</div> --%>
			
			
			<div class="textItem" style="margin-top:-10px;margin-bottom:15px;width:100%;height:30px;line-height:30px;">
				<div style="float:left;margin-left:-15px;">
					<font class='textTitleCss'>截止日期：${param.discountedType}</font>
				</div>
				<div style="display:block;float:left;margin-left:-15px;" id="zhouridate">
				<script type="text/javascript">
					$(document).ready(function(){ 
						getWeekEndDate() ;
					});
				</script>
					<input type="text" class="txt" name="discountedEndDate" id="discountedEndDate" value="${pojo.discountedEndDate}" class="txt" readonly="readonly"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写截止日期</font>
				</div>
				<div style="display:none;float:left;margin-left:-15px;" id="zhengchangdate">
					<input type="text" class="txt" name="discountedEndDate" id="discountedEndDate" value="<fmt:formatDate value="${pojo.discountedEndDate }" pattern="yyyy-MM-dd HH:mm:ss"/>" class="Wdate" onClick="WdatePicker({minDate:'<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %>',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写截止日期</font>
				</div>
			</div>
			<div class="textItem" style="clear:both;"><font class='textTitleCss'>优惠折扣：</font><input type="text" class="txt" name="discountedRebate" id="discountedRebate" value="${pojo.discountedRebate}" readonly="readonly" style="background-color:#eaeaea;"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写优惠折扣</font></div>
			<div class="textItem"><font class='textTitleCss'>备注说明：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注说明</font></div>
			<jsp:include page="searchNovel.jsp" flush="false"/>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiDiscountedFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
