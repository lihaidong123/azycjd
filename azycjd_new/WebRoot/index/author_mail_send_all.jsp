<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<style type="text/css">
		.selectDivCss{margin-left: 552px;}
		.div_css_test{display: none;}
</style>
<script type="text/javascript">
		function showDivFn(id){
			$("#"+id).slideToggle();
		}
</script>
		 <div class="divTableCss">
		 	<form id="AnzhiMessageFormIndex" action="anzhimessage/findAnzhiMessageAll.do?pageName=${param.pageName }&&linenumber=${param.linenumber }&&index=9&&chooseIndex=1" method="post" class="formCss">
				 <table class="tableCss" width="100%" >
					<tr class="tableTitleCss">
					    <td width="8%">序号</td>
					    <td width="15%">收件人</td>
						<td width="50%">公告标题</td>
						<td width="17%">发送时间</td>
						<td width="10%">操作</td>
					</tr>
					<c:forEach items="${anzhimessageList.list}" var="s" varStatus="ind">
						<tr>
						    <td onclick="showDivFn('div${s.id }')">${ind.index+1 }</td>
						    <td onclick="showDivFn('div${s.id }')">${s.memberNick }</td>
							<td onclick="showDivFn('div${s.id }')"><a  style="color: blue">${s.messageTitle }</a></td>
							<td onclick="showDivFn('div${s.id }')">${s.addTime }</td>
							<td><a href="javascript:showDivFn('div${s.id }')">查看</a></td>
						</tr>
						<tr>
							<td colspan="7">
								<div id="div${s.id }" class="div_css_test" onclick="showDivFn('div${s.id }')">
									${s.messageContent }
									<br/>[<fmt:formatDate value="${s.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/> ]
								</div>
							</td>
						</tr>
					</c:forEach>
				 </table>
				 <jsp:include page="../next_page.jsp" flush="false">
					<jsp:param value="anzhimessage/findAnzhiMessageAll.do?pageName=index/author_mail_send_all&&linenumber=${param.linenumber }&&index=9&&chooseIndex=1" name="url"/>
					<jsp:param value="${anzhimessageList.totalNum }" name="totalNum"/>
					<jsp:param value="${anzhimessageList.num }" name="num"/>
					<jsp:param value="AnzhiMessageFormIndex" name="formId"/>
					<jsp:param value="${anzhimessageList.total }" name="total"/>
					<jsp:param value="${param.size}" name="size"/>
				</jsp:include>
			</form>
		 </div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>