<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>

<script type="text/javascript">
	function wangzhanshangjia(tableId,novelNum){
		if(novelNum<70000){
			alert("该作品字数还没有达到7万字，不能申请网站上架！");
			return;
		}
		//添加一条记录 action_type=16
		if(confirm("您确定申请网站上架吗?")){
			$.post(path+"/anzhinovel/wangzhanhtmlstate.do",{tableId:tableId,state:1},function(res){
				alert(res);
				window.location.reload();
			});
		}
	}
	
	function pingtaishangjia(tableId,novelNum){
		if(novelNum<70000){
			alert("该作品字数还没有达到7万字，不能申请网站上架！");
			return;
		}
		//请修改小说的html_state为1 
		getJspDataByUrl("index/reason.jsp#tableId="+tableId+"#tabNameIndex=0#actionType=7#stateValue=6#actionUrl=anzhinovel/findAnzhiNovelManage.do");
	}
	
	function wangzhanxiajia(tableId){
		//请修改小说的html_state为1 
		if(confirm("您确定申请网站下架吗?")){
			$.post(path+"/anzhinovel/wangzhanhtmlstate.do",{tableId:tableId,state:0},function(res){
				alert("操作成功！");
				window.location.reload();
			});
		}
	}
</script>
<form id="AnzhiNovelFormIndex" action="anzhinovel/findAnzhiNovelManage.do" method="post" class="formCss">
	<div class="htmlTitleCss">
		<div class="htmlTitleCsss_one">作品管理</div>
	</div>
	<div class="divTableCss">
	<table class="tableCss" width="100%" border="0">
	  <tr class="tableTitleCss">
		<td>序号</td>
		<td>作品名称</td>
		<td>收藏</td>
		<td>总字数</td>
		<td>操作</td>
	  </tr>
	  <c:forEach items="${anzhinovelList.list}" var="s" varStatus="ind">
	  	<tr>
		  	<td>${ind.index+1 }</td>
			<td><a href="<%=request.getContextPath()%>/novel/${s.id}.jsp" target="_blank">${s.novelTitle }</a></td>
			<td>${s.totalSaveNum }</td>
			<td>${s.totalCharNum }</td>
			<td>
				<div id="actiondiv${s.id }">
					<a id="index/line_newchapter.jsp#novelId=${s.id }#linenumber=11#index=8#chooseIndex=0" class="project_manager_css" href="javascript:;" onclick="getJspData(this)">管理作品</a>&nbsp;|&nbsp;
					<!--<c:if test="${s.state ne 4 && s.isSigned eq 0}">
						<a href="javascript:;" onclick="getJspDataByUrl('index/reason.jsp#tableId=${s.id}#tabNameIndex=0#actionType=6#stateValue=4#actionUrl=anzhinovel/findAnzhiNovelManage.do')">申请删除</a>&nbsp;|&nbsp;
					</c:if>-->
					<c:if test="${s.state eq 2 && s.isSigned eq 0}">
						<a href="javascript:;" title="申请签约后，您不能申请'网站上架'和'平台上架'。但是您可以申请作品福利！" onclick="getJspDataByUrl('index/reason.jsp#tableId=${s.id}#tabNameIndex=0#actionType=11#stateValue=7#actionUrl=anzhinovel/findAnzhiNovelManage.do')">签约申请</a>&nbsp;|&nbsp;
					</c:if>
					
					<c:if test="${s.state eq 2 && s.isSigned eq 0 && s.isWebUp eq 0}">
						<a href="javascript:;" title="网站上架后，后续章节自动加V。但不会推广到第三方平台！申请条件：作品总字数必须达到7万字。" onclick="wangzhanshangjia(${s.id},${s.totalCharNum })">网站上架</a>&nbsp;|&nbsp;
					</c:if>
					<c:if test="${s.isWebUp eq 1}">
						<a href="javascript:;" onclick="wangzhanxiajia(${s.id})">网站下架</a>&nbsp;|&nbsp;
					</c:if>
					
					<c:if test="${s.state eq 2 && s.isSigned eq 0 && s.isPingTaiUp eq 0}">
						<a href="javascript:;" title="平台上架后，后续章节自动加V。可以推广到第三方平台！申请条件：作品总字数必须达到7万字。需后台管理员审核。" onclick="pingtaishangjia(${s.id},${s.totalCharNum })">平台上架</a>&nbsp;|&nbsp;
					</c:if>
					<c:if test="${s.isPingTaiUp eq 1}">
						<a href="javascript:;" onclick="getJspDataByUrl('index/reason.jsp#tableId=${s.id}#tabNameIndex=0#actionType=8#stateValue=5#actionUrl=anzhinovel/findAnzhiNovelManage.do')">平台自主下架</a>&nbsp;|&nbsp;
					</c:if>

					<a id="anzhicomment/anzhiCommentAllManage.do#linenumber=11#tableId=${s.id }" href="javascript:;" onclick="getJspData(this)">书评管理</a>&nbsp;|&nbsp;
					<c:if test="${s.isSigned eq 1}">
						已签约&nbsp;|&nbsp;
					</c:if>
					<c:if test="${s.state eq 4 }">
						删除审核中
					</c:if>
					<c:if test="${s.state eq 5 }">
						平台下架申请中
					</c:if>
					<c:if test="${s.state eq 6 }">
						平台上架申请中
					</c:if>
					<c:if test="${s.state eq 7 }">
						签约申请中
					</c:if>
				</div>
			</td>
		  </tr>
	  </c:forEach>
	</table>
	<jsp:include page="../next_page.jsp" flush="false">
		<jsp:param value="anzhinovel/findAnzhiNovelManage.do" name="url"/>
		<jsp:param value="${anzhinovelList.totalNum }" name="totalNum"/>
		<jsp:param value="${anzhinovelList.num }" name="num"/>
		<jsp:param value="AnzhiNovelFormIndex" name="formId"/>
		<jsp:param value="${anzhinovelList.total }" name="total"/>
		<jsp:param value="${param.size}" name="size"/>
	</jsp:include>
	
	</div>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>