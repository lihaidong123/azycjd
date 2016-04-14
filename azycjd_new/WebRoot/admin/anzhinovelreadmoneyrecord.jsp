<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<script type="text/javascript">
	function dataCheck(){
		var authorMemberId=document.getElementsByName("authorMemberId");
		var con=false;
		var ids="";
		for(var i=0;i<authorMemberId.length;i++){
			if(authorMemberId[i].checked==true||authorMemberId[i].checked=="checked"){
				ids+=authorMemberId[i].value+",";
				con=true;
			}
		}
		if(!con){
			alert("您还没有选择一个作家呢");
			return;
		}
		ids=ids.substring(0, ids.length-1);
		$("#memberArrId").val(ids);
		if(confirm("您确定给所选的作家赠送阅读币吗？")){
			ajaxSubmit('addAnzhiAuthorYueduForm',$("#baosunyuedu")[0]);
		}
	}
	
	function quanxuand(obj){
		var authorMemberId=document.getElementsByName("authorMemberId");
		for(var i=0;i<authorMemberId.length;i++){
			authorMemberId[i].checked=obj.checked;
		}
	}
</script>
<style type="text/css">
	#author_list_div ul{list-style: none;padding: 0px; margin: 0px;overflow: auto;}
	#author_list_div li{float: left;margin-left: 10px; width: 160px;}
</style>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			批量赠送阅读币<input type="checkbox" style="margin-left: 20px;" onclick="quanxuand(this)" />全选
		</div>
	</div>
	
	<form id="addAnzhiAuthorYueduForm" action="<%=request.getContextPath()%>/anzhinovelreadmoneyrecord/addAnzhiNovelReadMoneyRecordMore.do" method="post">
		<input type="hidden" class="txt" name="memberArrId" id="memberArrId" value="" alt=""/>
		<div class="inputItemsCssss">
			用户类型：<select id="mem_type" onchange="mem_type_fn()" style="width:140px;">
				<option value="2">全部</option>
				<option value="0">读者</option>
				<option value="1">作家</option>
			</select>
			有无签约：<select id="sign_book_type" onchange="mem_type_fn()" style="width:140px;">
				<option value="2">全部</option>
				<option value="0">有作品签约</option>
				<option value="1">无作品签约</option>
			</select>
		</div>
		<div class="inputItemsCssss">
			<div class="textItem"><font class='textTitleCss'>充值阅读币：</font><input type="text" class="txt" name="readMoney" id="readMoney" onKeyUp="value=value.replace(/\D/g,'')" value="0" alt="\d{1,5};充值阅读币填写错误！"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写充值阅读币</font></div>
			<div id="author_list_div" style="line-height: 30px;min-height:300px; height: auto;">
				<ul>
				<c:forEach items="${allmemberList.list}" var="s" varStatus="ind">
					<li id="${s.memberType }@${s.isSignBook}"><input type="checkbox" style="margin-left: 15px;" name="authorMemberId" value="${s.id }"/>${s.memberNick }</li>
				</c:forEach>
				</ul>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" id="baosunyuedu" value="保存" onClick="dataCheck()"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
