<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="top.jsp"></jsp:include>
	<script type="text/javascript">
		var types='${ds[param.types-1] }';
		var shang_index='${param.shangIndex}';
		$(function(){
			$(".novel_list_div a").each(function(){
				if($(this)[0].innerText==types){
					$(this).css("color","#1a9cda");
					return false;
				}
			});
			if(shang_index==''){
				shang_index='2';
			}
			$(".dashang_div_time input")[parseInt(shang_index)].className='searchBtnCss';
		});
	</script>
	<style type="text/css">
		.searchBtnCss{ background-color:#1a9cda; letter-spacing:4px; border-radius:5px; width:110px; height:40px; line-height:40px; vertical-align:middle; cursor:pointer; border:none; color:#FFFFFF; font-family:"黑体"; font-size:14px; text-align:center;}
		.searchBtnCss:hover{ background-color:#1ea9eb;}
		.resetBtnCss{ background-color:#d85224; letter-spacing:4px; border-radius:5px; width:110px; height:40px; line-height:40px; vertical-align:middle; cursor:pointer; border:none; color:#FFFFFF; font-family:"黑体"; font-size:14px; text-align:center;}
		.resetBtnCss:hover{ background-color:#ea5f2f;}
		.buttonBtnCss{ background-color:#48668e; letter-spacing:4px; border-radius:5px; width:110px; height:40px; line-height:40px; vertical-align:middle; cursor:pointer; border:none; color:#FFFFFF; font-family:"黑体"; font-size:14px; text-align:center;}
		.buttonBtnCss:hover{ background-color:#5a7dad;}
		.addBtnCss{ background-color:#48668e; letter-spacing:4px; border-radius:5px; width:110px; height:40px; line-height:40px; vertical-align:middle; cursor:pointer; border:none; color:#FFFFFF; font-family:"黑体"; font-size:14px; text-align:center;}
		.addBtnCss:hover{ background-color:#5d7eaa;}
		.dashang_div_time{text-align: right; padding-right: 30px;}
		.dashang_div_time input{width:50px; hieght:25px; margin-left: 10px;}
	</style>
	<div class="main_2_div">
		<form id="fensiForm" action="" method="post">
			<div style="text-align: center;font-weight: bold;color:#000;">
				<a href="<%=request.getContextPath() %>/novel/${xiaoshuo.id}.jsp">《${xiaoshuo.novelTitle }》的粉丝</a>
			</div>
			<div style="margin-top:40px;width:960px;" >
				<table width="100%" border="0" style="height:40px; background-color:#FFFFFF; font-family:'微软雅黑';">
				  <tr>
					<td width="120" align="center">序号</td>
					<td width="250">粉丝昵称</td>
					<td width="360">粉丝等级</td>
				  </tr>
				</table>
			</div>
			<div style="margin-top:20px; min-height:450px; height:auto;">
				<div class="shuxing" style="float:left; width:30px;">
				</div>
				<div class="details_div" style="float:left; width:">
					<table width="100%" border="0">
					  <c:forEach items="${fansiList }" var="s" varStatus="ind">
					  	<tr>
							<td width="120" align="center">${ind.index+1 }</td>
							<td width="330" >${s.memberNick }</td>
							<td width="300">${s.levelName }</td>
						  </tr>
					  </c:forEach>
				  </table>
				</div>
				<div style="height:10px;clear: both;"></div>
			</div>
		</form>
	</div>
<jsp:include page="foot.jsp"></jsp:include>