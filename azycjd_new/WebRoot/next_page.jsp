<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">
	.next_page_div{ clear:both; margin-right:0px; margin-top:40px; overflow:auto;}
	.next_page_div div{ float:left; width:33px; height:30px; border:#cecece 1px solid; color:#7f7a7a; background-color:#e4e4e4; line-height:30px; text-align:center; vertical-align:middle; font-size:14px; margin-left:3px;}
	.next_page_div div:hover{ cursor:pointer; background-color:#dfdbdb; color:#7f7a7a;}
	.next_page_text{ width:30px; height:20px; background-color:#edeaea; border:#999999 1px solid; text-align:center;}
	.next_page_text:focus{outline:none;}
	.choosePageNextNum{background-color:#888282 !important; color: #fbf4f4 !important;}
</style>
<div class="next_page_div" style="overflow: hidden;" id="next_page_div${param.formId }">
	<c:if test="${not empty param.totalNum && not empty param.num}">
		<c:set var="showNum" value="10"></c:set>
		<c:if test="${showNum-param.totalNum>0}">
			<c:set var="showNum" value="${param.totalNum }"></c:set>
		</c:if>
		<c:set var="begNum" value="1"></c:set>
		<c:if test="${param.num-begNum>5}">
			<c:set var="begNum" value="${(param.num-5)>0?(param.num-5):1 }"></c:set>
			<c:if test="${(begNum+10)-param.totalNum<0}">
				<c:set var="showNum" value="${begNum+10 }"></c:set>
			</c:if>
			<c:if test="${(begNum+10)-param.totalNum>=0}">
				<c:set var="begNum" value="${(param.totalNum-10)>1?(param.totalNum-10):1 }"></c:set>
				<c:set var="showNum" value="${param.totalNum }"></c:set>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${empty param.totalNum || empty param.num}">
		<c:set var="begNum" value="0"></c:set>
		<c:set var="showNum" value="0"></c:set>
	</c:if>
	<c:forEach  end="${showNum }" begin="${begNum }" varStatus="ind">
		<c:if test="${param.num eq ind.index }">
			<div class="choosePageNextNum">${ind.index }</div>
			<input type="hidden" id="hiddenNowPageNum" name="hiddenNowPageNum" value="${ind.index }"/>
		</c:if>
		<c:if test="${param.num ne ind.index }">
			<div onclick="direcNum('${param.url}','${param.formId }',${ind.index })">${ind.index }</div>
		</c:if>
	</c:forEach>

	<c:if test="${param.totalNum ne 0}">
		<div style="width:60px; font-family:'黑体'; color:#000000;cursor: default;">${param.num }/${param.totalNum }</div>
		<div style="width:110px;cursor: default;">跳转到&nbsp;<input type="text" value="1" id="go_page_num_${param.formId }" class="next_page_text"/>&nbsp;页</div>
		<div style="width:60px;" onclick="goPageNum('go_page_num_${param.formId }','${param.url}','${param.formId }')">GO</div>
	</c:if>
	
	
</div>
