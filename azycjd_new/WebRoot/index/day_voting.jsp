<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	
	<form class="formCss" id="day_registration_form">
		<div class="htmlTitleCss">
			<div class="htmlTitleCsss_one">每日投票</div>
		</div>
		<div class="second_title_css" style="height: auto;">
			<div><input class="addBtnCss" type="button" value="点我投票" onclick="window.location.href='<%=request.getContextPath()%>/index/add_day_voting.jsp?linenumber=14'" /><font style="padding-left:20px;">投推荐票，一次性投完推荐票，10个经验值</font></div>
		</div>
		<div class="divTableCss">
			 <table class="tableCss" width="100%" border="0">
			  <tr class="tableTitleCss">
				<td>序号</td>
				<td>投票时间</td>
				<td>获得经验</td>
				<td>投票主题</td>
			  </tr>
			  <tr>
				<td>1</td>
				<td>2015-08-26 14:23:55</td>
				<td>5</td>
				<td>通常装修房子你会花费多少？</td>
			  </tr>
			  <tr>
				<td>2</td>
				<td>2015-08-12 11:28:15</td>
				<td>10</td>
				<td>关于爱情和婚姻的心理测试</td>
			  </tr>
			  <tr>
				<td>3</td>
				<td>2015-08-06 09:23:15</td>
				<td>50</td>
				<td>你有潜在的明星气质吗</td>
			  </tr>
			  <tr>
				<td>4</td>
				<td>2015-07-25 12:13:25</td>
				<td>50</td>
				<td>测试你的恶魔度是多少？</td>
			  </tr>
			  <tr>
				<td>5</td>
				<td>2015-06-06 18:53:25</td>
				<td>100</td>
				<td>真实的自我</td>
			  </tr>
			  <tr>
				<td>6</td>
				<td>2015-06-16 13:53:32</td>
				<td>5</td>
				<td>测试你的自恋程度有多高</td>
			  </tr>
			  <tr>
				<td>7</td>
				<td>2015-05-16 15:35:51</td>
				<td>10</td>
				<td>测测你容易被什么套牢</td>
			  </tr>
			  <tr>
				<td>8</td>
				<td>2015-03-26 17:27:23</td>
				<td>50</td>
				<td>最喜欢的展品</td>
			  </tr>
			  <tr>
				<td>9</td>
				<td>2015-03-16 11:13:25</td>
				<td>5</td>
				<td>为什么二三线城市限购令难出？</td>
			  </tr>
			  <tr>
				<td>10</td>
				<td>2015-02-06 11:33:54</td>
				<td>10</td>
				<td>客厅放丝绸吊灯，怎么样？</td>
			  </tr>
			</table>
		</div>
		<jsp:include page="../next_page.jsp" flush="false"></jsp:include>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>