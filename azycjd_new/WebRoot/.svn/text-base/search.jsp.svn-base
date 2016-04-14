<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="top.jsp"></jsp:include>
	<style type="text/css">
		.search_div_new{ padding:10px; background-color:#fff; border:#dbdbdb 1px solid; border-radius:5px;}
		.search_text{ border:none; height:35px; line-height:35px;background-color:#fff; width:100%; font-family:"黑体"; font-size:16px;}
		.search_btn_new{ background:url(images/s_new.png) no-repeat 10px 4px; cursor:pointer; width:100%; height:32px;}
		.search_result_css{ background-color:#fbf3e9; border:#f5ebe0 1px solid; padding-left:8px; font-size:16px; padding-left:20px; font-family:"黑体"; height:45px; line-height:45px; margin-top:15px;}
		.novel_items_search{ padding:30px; background-color:#ffffff; border-radius:5px; margin-top:20px;}
		.noveld_search_css{text-align:left; padding-left:33px; font-size: 13px; line-height: 25px;}
		.novelTitle_search_css{ text-align:left; padding-left:27px;}
		.novelTitle_search_css a{ text-decoration:none; font-size:16px; font-weight:bold;}
		.novelVote_search_css{ line-height:22px; margin-top:15px; padding:7px; text-indent:20px; font-family:Arial, Helvetica, sans-serif; font-size:13px; color:#999999;}
	</style>
	<script language="javascript">
		$(function(){
			getHtmlContent('novelVote_search_css',300);
			window.onkeydown=function(e){
				if(e.keyCode==13){
					checkSearch();
				}
			}
		});
		
		function checkSearch(){
			var tsss=/^.{1,100}$/;
			var v=$.trim($("#novelTitles").val());
			if((/^.{1,100}$/).test(v)){
				direcNum('anzhinovel/search.do','AnzhiNovelFormSearch');
			}
		}
	</script>
	<div class="divInit" style="width:90%; margin:0 auto;">
		<form id="AnzhiNovelFormSearch" action="anzhinovel/search.do" method="post">
			<div class="search_div_new">
				<table width="100%">
					<tr>
						<td valign="top">
							<input type="text" class="search_text" id="novelTitles" name="novelTitles" placeholder="请输入作者/作品/标签搜索..." value=${param.novelTitles }>
						</td>
						<td valign="top" width="50">
							<div class="search_btn_new" onclick="checkSearch()">
								
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="search_result_css">
				总共搜索到${anzhinovelList.total }条记录
			</div>
			<div class="tableCss" style="min-height: 400px;">
				<div style="min-height: 600px; height: auto;">
					<c:forEach items="${anzhinovelList.list}" var="s" varStatus="ind">
						<div class="novel_items_search">
							<table width="100%">
								<tr>
									<td valign="top" width="135">
										<img src="${s.novelImg }" width="120" height="160">
									</td>
									<td valign="top">
										<div class="novelTitle_search_css"><a href="<%=request.getContextPath() %>/novel/${s.id}.jsp" target="_blank">${s.novelTitle }</a></div>
										<div class="noveld_search_css" style="margin-top: 6px;">${s.authorWriterName } -著</div>
										<div class="noveld_search_css">${s.novelLabel }</div>
										<div class="novelVote_search_css">${s.vote }</div>
									</td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
				<jsp:include page="next_page.jsp" flush="false">
					<jsp:param value="anzhinovel/search.do" name="url"/>
					<jsp:param value="${anzhinovelList.totalNum }" name="totalNum"/>
					<jsp:param value="${anzhinovelList.num }" name="num"/>
					<jsp:param value="AnzhiNovelFormSearch" name="formId"/>
					<jsp:param value="${anzhinovelList.total }" name="total"/>
					<jsp:param value="${param.size}" name="size"/>
				</jsp:include>
			</div>
		</form>
	</div>
<jsp:include page="foot.jsp"></jsp:include>