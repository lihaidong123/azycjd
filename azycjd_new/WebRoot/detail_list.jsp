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
		<form id="paiHangBangForm" action="anzhinovel/morePahangbang.do?types=${param.types }&&shangIndex=${param.shangIndex}" method="post">
			<div class="title_div_css">
				<div class="novel_list_div">
					<div><a href="anzhinovel/morePahangbang.do?types=1">月票榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=2">点击榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=3">收藏榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=4">更新榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=5">推荐榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=6">订阅榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=7">新书月票榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=8">书友打赏榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=9">新书点击榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=10">新书推荐榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=11">新书收藏榜</a></div>
					<div><a href="anzhinovel/morePahangbang.do?types=12">完结精品榜</a></div>
				</div>
			</div>
			<c:if test="${param.types eq 8 ||param.types eq 2 ||param.types eq 6 ||param.types eq 5}">
				<div class="dashang_div_time">
					<input type="button" class="addBtnCss" value="周" onclick="window.location.href='<%=request.getContextPath() %>/anzhinovel/morePahangbang.do?types=${param.types }&&shangIndex=0'"/>
					<input type="button" class="addBtnCss" value="月" onclick="window.location.href='<%=request.getContextPath() %>/anzhinovel/morePahangbang.do?types=${param.types }&&shangIndex=1'"/>
					<input type="button" class="addBtnCss" value="总" onclick="window.location.href='<%=request.getContextPath() %>/anzhinovel/morePahangbang.do?types=${param.types }&&shangIndex=2'"/>
				</div>
			</c:if>
			<div style="margin-top:40px;">
				<table width="100%" border="0" style="height:40px; background-color:#FFFFFF; font-family:'微软雅黑';">
				  <tr>
					<td width="120" align="center">排名</td>
					<td width="150">类型</td>
					<td width="350">作品名</td>
					<td width="120">作者</td>
					<c:if test="${param.types ne 12 }"><td width="120">${paihangbangType }</td></c:if>
					<td width="130">字数</td>
					<td width="90">最后更新</td>
				  </tr>
				</table>
			</div>
			<div style="margin-top:20px; min-height:450px; height:auto;">
				<div class="shuxing" style="float:left; width:30px;">
					${ds[param.types-1] }
				</div>
				<div class="details_div" style="float:left; width:960px;">
					<table width="100%" border="0">
					  <c:forEach items="${anzhinovelList.list }" var="s" varStatus="ind">
					  	<tr>
							<td width="70" class="paiming">${(anzhinovelList.num-1)*10+ind.index+1 }</td>
							<td width="150" class="leibie">${s.novelType }</td>
							<td width="360" class="shuming"><a href="<%=request.getContextPath() %>/novel/${s.id}.jsp" target="_blank">${s.novelTitle }</a></td>
							<td width="120">${s.authorWriterName }</td>
							<c:if test="${param.types ne 12 }">
								<td width="120">
									<c:if test="${param.types eq 2 }">
										${s.clickNum }
									</c:if>
									<c:if test="${param.types eq 3 }">
										${s.totalSaveNum }
									</c:if>
									<c:if test="${param.types eq 5 }">
										${s.totalRecommand }
									</c:if>
									<c:if test="${param.types eq 6 }">
										${s.totalDingyueNum }
									</c:if>
									<c:if test="${param.types eq 9 }">
										${s.clickNum }
									</c:if>
									<c:if test="${param.types eq 10 }">
										${s.totalRecommand }
									</c:if>
									<c:if test="${param.types eq 11 }">
										${s.totalSaveNum }
									</c:if>
									<c:if test="${param.types eq 1 || param.types eq 4 || param.types eq 7 || param.types eq 8 || param.types eq 12 }">
										${s.num }
									</c:if>
								</td>
								</c:if>
							<td width="90">${s.totalCharNum }</td>
							<td width="130"><fmt:formatDate value="${s.updateTime }" pattern="yyyy/MM/dd HH:mm"/></td>
						  </tr>
					  </c:forEach>
				  </table>
				</div>
				<div style="height:10px;clear: both;"></div>
				<jsp:include page="next_page.jsp" flush="false">
					<jsp:param value="anzhinovel/morePahangbang.do?types=${param.types }&&shangIndex=${param.shangIndex}" name="url"/>
					<jsp:param value="${anzhinovelList.totalNum }" name="totalNum"/>
					<jsp:param value="${anzhinovelList.num }" name="num"/>
					<jsp:param value="paiHangBangForm" name="formId"/>
					<jsp:param value="${anzhinovelList.total }" name="total"/>
					<jsp:param value="${param.size}" name="size"/>
				</jsp:include>
			</div>
		</form>
	</div>
<jsp:include page="foot.jsp"></jsp:include>