<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	
	<form class="formCss" id="day_registration_form">
		<div class="htmlTitleCss">
			<div class="htmlTitleCsss_one">每日打赏</div>
		</div>
		<div class="second_title_css" style="height:auto;">
			<div>当日打赏安之币达到100个，给予5个经验</div>
			<div>当日打赏安之币达到1000个，给予20个经验</div>
			<div>当日打赏安之币达到2500个，给予60个经验</div>
			<div>当日打赏安之币达到5000个，给予100个经验</div>
			<div>当日打赏安之币达到10000个，给予300个经验</div>
		</div>
		<div class="divTableCss">
			 <table class="tableCss" width="100%" border="0">
			  <tr class="tableTitleCss">
				<td>序号</td>
				<td>打赏时间</td>
				<td>获得经验</td>
				<td>打赏小说</td>
				<td>打赏章节</td>
			  </tr>
			  <tr>
				<td>1</td>
				<td>2015-08-26 14:23:55</td>
				<td>0</td>
				<td>血脉皇者</td>
				<td>血脉大陆（改）</td>
			  </tr>
			  <tr>
				<td>2</td>
				<td>2015-08-12 11:28:15</td>
				<td>0</td>
				<td>血脉皇者</td>
				<td>激活血脉</td>
			  </tr>
			  <tr>
				<td>3</td>
				<td>2015-08-06 09:23:15</td>
				<td>0</td>
				<td>血脉皇者</td>
				<td>精灵球</td>
			  </tr>
			  <tr>
				<td>4</td>
				<td>2015-07-25 12:13:25</td>
				<td>0</td>
				<td>血脉皇者</td>
				<td>皮卡丘就是你了！</td>
			  </tr>
			  <tr>
				<td>5</td>
				<td>2015-06-06 18:53:25</td>
				<td>0</td>
				<td>血脉皇者</td>
				<td>史莱姆？百变怪！</td>
			  </tr>
			  <tr>
				<td>6</td>
				<td>2015-06-16 13:53:32</td>
				<td>2</td>
				<td>盛世巨星</td>
				<td>叶伟</td>
			  </tr>
			  <tr>
				<td>7</td>
				<td>2015-05-16 15:35:51</td>
				<td>2</td>
				<td>盛世巨星</td>
				<td>血脉战士</td>
			  </tr>
			  <tr>
				<td>8</td>
				<td>2015-03-26 17:27:23</td>
				<td>0</td>
				<td>盛世巨星</td>
				<td>血脉之力</td>
			  </tr>
			  <tr>
				<td>9</td>
				<td>2015-03-16 11:13:25</td>
				<td>2</td>
				<td>盛世巨星</td>
				<td>精灵球符</td>
			  </tr>
			  <tr>
				<td>10</td>
				<td>2015-02-06 11:33:54</td>
				<td>2</td>
				<td>盛世巨星</td>
				<td>强大的背包选项</td>
			  </tr>
			</table>
		</div>
		<jsp:include page="../next_page.jsp" flush="false"></jsp:include>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>