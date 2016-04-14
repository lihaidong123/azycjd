<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<style type="text/css">
		.divItemsCss{font: 12px/160% Tahoma, Verdana,snas-serif; color:#686463}
		.divItemsCss table{ border-collapse:collapse;}
		.divItemsCss tr{ line-height:45px;}
		.divItemsCss td{ border:#dfdddc 1px solid; padding-left:15px;}
		#every_day_div a{ text-decoration: none;}
		#every_day_div a:hover{ text-decoration: underline; color: #333333;font-weight: bold;}
	</style>
	<div style="width:80%; margin:0 auto;">
		<table width="100%" border="0">
		  <tr>
			<td width="15%">当前经验值：</td>
			<td width="75%">
				<div style="background-color:#c5c8c9;">
					<div style="width:340px;height:25px; line-height:25px; color:#FFFFFF; text-align:center; position:absolute;">成长值&nbsp;&nbsp;${loginUsers.memberExperience}/${endJinYan}</div>
					<div style="width:${(loginUsers.memberExperience/endJinYan)*100 }%; background-color:#4aa0d9; height:25px;"></div>
				</div>
			</td>
		  </tr>
		</table>
	</div>
	
	<div id="every_day_div" class="divItemsCss" style="width:95%; margin:0 auto; margin-top:30px;">
		<table width="100%" border="0">
		  <tr style="background-color:#f5f4f3;font-weight:bold;">
			<td width="18%">活跃度任务名称</td>
			<td width="10%">当前进度</td>
			<td width="63%">奖励说明</td>
			<td width="9%">GO</td>
		  </tr>
		  <tr>
			<td>
				每日签到
			</td>
			<td>${qiandaotask>1?1:qiandaotask }/1</td>
			<td>
				<div class="task_intro">
					一天一次，一次5个经验值
				</div>
			</td>
			<td>
				<c:if test="${qiandaotask eq 0}">
					<a href="javascript:;" onclick="qiandao(this)" >签到</a>
				</c:if>
				<c:if test="${qiandaotask ne 0}">
					已完成
				</c:if>
				<div id="qiandaohaole"></div>
			</td>
		  </tr>
		  <tr>
			<td>每日动态</td>
			<td>${dongtaitask>3?3:dongtaitask }/3</td>
			<td>
				<div class="task_intro">
					每日前三条广播有经验值，一条2个经验值
				</div>
			</td>
			<td>
				<c:if test="${dongtaitask<3}">
					<a  href="javascript:;" id="anzhitrend/findAnzhiTrendMySelf.do#linenumber=0#index=2#chooseIndex=0" onclick="getJspData(this)">去完成</a>
				</c:if>
				<c:if test="${dongtaitask>=3}">
					已完成
				</c:if>
			</td>
		  </tr>
		  <tr>
			<td>每日投票</td>
			<td>${toupiaotask>10?10:toupiaotask }/10</td>
			<td>
				<div class="task_intro">
					当日投满10张推荐票可以获得10个经验值
				</div>
			</td>
			<td>
				<c:if test="${toupiaotask<10 }">
					<a href="<%=request.getContextPath()%>/all_type_list.jsp">去完成</a>
				</c:if>
				<c:if test="${toupiaotask>=10 }">
					已完成
				</c:if>
			</td>
		  </tr>
		  <tr>
			<td>每日充值</td>
			<td>${chognzhitask>50?50:chognzhitask }/50</td>
			<td>
				<div class="task_intro">
					<div>当日充值金额到达1元，给予5个经验</div>
					<div>当日充值金额达到5元给予10个经验</div>
					<div>当日充值金额达到20元给予50个经验</div>
					<div>当日充值金额达到50元的给予100个经验</div>
				</div>
			</td>
			<td>
				<c:if test="${chognzhitask<50 }">
					<a href="<%=request.getContextPath()%>/index/add_day_recharge.jsp?linenumber=6">去完成</a>
				</c:if>
				<c:if test="${chognzhitask>=50 }">
					已完成
				</c:if>
			</td>
		  </tr>
		  <tr>
			<td>每日订阅</td>
			<td>${dingyuetask>5?5:dingyuetask }/5</td>
			<td>
				<div class="task_intro">
					按章数订阅，每日订阅不少于5章，20个经验值
				</div>
			</td>
			<td>
				<c:if test="${dingyuetask<5 }">
					<a href="<%=request.getContextPath()%>/all_type_list.jsp" target="_blank">去完成</a>
				</c:if>
				<c:if test="${dingyuetask>=5 }">
					已完成
				</c:if>
			</td>
		  </tr>
		  <tr>
			<td>每日收藏</td>
			<td>${soucangtask>1?1:soucangtask }/1</td>
			<td>
				<div class="task_intro">
					每日收藏一本书，24小时内不删除，5个经验值
				</div>
			</td>
			<td>
				<c:if test="${soucangtask eq 0 }">
					<a href="<%=request.getContextPath()%>/all_type_list.jsp" target="_blank">去完成</a>
				</c:if>
				<c:if test="${soucangtask ne 0 }">
					已完成
				</c:if>
			</td>
		  </tr>
		  <tr>
			<td>每日评论</td>
			<td>${pingluntask>1?1:pingluntask }/1</td>
			<td>
				<div class="task_intro">
					每日第一条书评，5个经验值
				</div>
			</td>
			<td>
				<c:if test="${pingluntask eq 0 }">
					<a href="<%=request.getContextPath()%>/all_type_list.jsp" target="_blank">去完成</a>
				</c:if>
				<c:if test="${pingluntask ne 0 }">
					已完成
				</c:if>
				<%-- <c:if test="${pinglun eq 'no'}">
					<!-- <a href="<%=request.getContextPath()%>/all_type_list.jsp" target="_blank">去完成</a> -->
					<a href="<%=request.getContextPath()%>/index/add_day_comments.jsp?linenumber=6">去完成</a>
				</c:if>
				<c:if test="${pinglun eq 'yes'}">
					已完成
				</c:if>
				 --%>
			</td>
		  </tr>
		  <tr>
			<td>每日打赏</td>
			<td>${dashangtask>10000?10000:dashangtask }/10000</td>
			<td>
				<div class="task_intro">
					<div class="second_title_css" style="height:auto;">
						<div>当日打赏安之币达到100个，给予5个经验</div>
						<div>当日打赏安之币达到1000个，给予20个经验</div>
						<div>当日打赏安之币达到2500个，给予60个经验</div>
						<div>当日打赏安之币达到5000个，给予100个经验</div>
						<div>当日打赏安之币达到10000个，给予300个经验</div>
					</div>
				</div>
			</td>
			<td>
				<c:if test="${dashangtask<10000 }">
					<a href="<%=request.getContextPath()%>/all_type_list.jsp" target="_blank">去完成</a>
				</c:if>
				<c:if test="${dashangtask>=10000 }">
					已完成
				</c:if>
				
			</td>
		  </tr>
		  <tr>
			<td>每日点赞</td>
			<td>${dianzantask>1?1:dianzantask }/1</td>
			<td>
				<div class="task_intro">
					每日第一条点赞，2个经验值
				</div>
			</td>
			<td>
				<c:if test="${dianzantask eq 0}">
					<a href="<%=request.getContextPath()%>/all_type_list.jsp" target="_blank">去完成</a>
				</c:if>
				<c:if test="${dianzantask ne 0}">
					已完成
				</c:if>
			</td>
		  </tr>
		</table>
	</div>
	
	
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>