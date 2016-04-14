<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<style>
	.divTableCss td{border: #999999 1px solid;} 
</style>
<script type="text/javascript">
	$(function(){
		$(".xuhao_num").each(function(){
			$(this).html($(".xuhao_num").index($(this))+1);
		});
	});
</script>
	<div class="divTableCss">
		<table class="tableCss" width="100%" >
			<tr class="tableTitleCss">
			    <td>序号</td>
			    <td>小说名称</td>
				<td>福利类型</td>
				<td>说明</td>
				<td>申请</td>
			</tr>
			<c:forEach items="${novelFuli.list }" var="s">
				<c:forEach items="${s.fuLiList }" var="k">
					<tr>
					    <td class="xuhao_num"></td>
					    <td>${s.novelTitle }</td>
						<td>
							<c:if test="${k.fuliType eq 0 }">全勤奖</c:if>
							<c:if test="${k.fuliType eq 1 }">上架福利</c:if>
							<c:if test="${k.fuliType eq 2 }">完结奖</c:if>
						</td>
						<td>${k.vote }</td>
						<td>
							<c:if test="${k.successInt eq 0 }"><font color="#e80e1d">未完成</font></c:if>
							<c:if test="${k.successInt eq 2 }"><font color="42a30d">已申请</font></c:if>
							<c:if test="${k.successInt eq 1 }">
								<c:if test="${k.fuliType eq 0 }">
									<a href="javascript:;" onclick="benefit(${s.id },'${k.vote }',2,this)">申请</a>
								</c:if>
								<c:if test="${k.fuliType eq 1 }">
									<a href="javascript:;" onclick="benefit(${s.id },'${k.vote }',0,this)">申请</a>
								</c:if>
								<c:if test="${k.fuliType eq 2 }">
									<a href="javascript:;" onclick="benefit(${s.id },'${k.vote }',1,this)">申请</a>
								</c:if>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:forEach>
			<tr>
			    <td class="xuhao_num"></td>
			    <td></td>
				<td>精英奖</td>
				<td>${jingyingjiang.vote }</td>
				<td>
					<c:if test="${jingyingjiang.successInt eq 0 }"><font color="#e80e1d">未完成</font></c:if>
					<c:if test="${jingyingjiang.successInt eq 2 }"><font color="42a30d">已申请</font></c:if>
					<c:if test="${jingyingjiang.successInt eq 1 }">
						<a href="javascript:;" onclick="benefit(${loginUsers.id },'${jingyingjiang.vote }',9,this)">申请</a>
					</c:if>
				</td>
			</tr>
			<tr>
			    <td class="xuhao_num"></td>
			    <td></td>
				<td>道具分成</td>
				<td>${daojufencheng.vote }</td>
				<td>
					<c:if test="${daojufencheng.successInt eq 0 }"><font color="#e80e1d">未完成</font></c:if>
					<c:if test="${daojufencheng.successInt eq 2 }"><font color="42a30d">已申请</font></c:if>
					<c:if test="${daojufencheng.successInt eq 1 }">
						<a href="javascript:;" onclick="benefit(${loginUsers.id },'${daojufencheng.vote }',10,this)">申请</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>