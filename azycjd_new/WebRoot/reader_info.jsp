<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="top.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#top_banner").css("background","url(images/zuozhezhuanqu.png)  center 0px no-repeat #f0f0f0");
	});
</script>
<div style="width: 1000px;margin: 0 auto;">
	<div class="title_div_css">
		读者资料&nbsp;>&nbsp;南皖先生
	</div>
	<div class="author_content">
		<div class="author_content_left">
			<div style="width: 183px;height: 195px;padding: 136px 0px 0px  196px;">
				<img src="images/8_p_1.png"><br>
				<p style="clear: both;color:#757575;font-size: 28px;letter-spacing:2px;padding-left: 35px;margin-top:15px;">安之桃子</p>
			</div>
			<div class="author_content_left_1">
				<div>
					<img src="images/8_p_2.png" style="margin-bottom: 57px;padding-left: 77px;">
				</div>
				<div style="width: auto;height: 20px;padding: 10px 0px 0px 18px;font-size: 14px;font-weight: bold;">其实地上本没有路，走的人多了，也便成了路。</div>
			</div>
		</div>
		<div><img src="images/8_p_16.png" style="padding-top: 205px;"></div>
		<div class="author_content_right">
			<div class="author_content_right_1">
				<ul>
					<li>昵称:&nbsp;南皖先生</li>
					<li>性别:&nbsp;未知</li>
					
				</ul>
				<div style="width: 146px;height: 20px;padding: 79px 0px 0px 62px;"> 
					<span style="font-size: 13px;"><img src="images/7_p_2.png" style="padding-right: 4px;">收藏</span>
					<span style="padding-left: 40px;font-size: 13px;"><img src="images/7_p_3.png" style="padding-right: 4px;">评论</span>
				</div>
			</div>
		</div>
	</div>
	<div class="author_tj">
		<p>读者推荐</p>
	</div>
	<div class="author_tj_1">
		<jsp:include page="read_list.jsp" flush="false"></jsp:include>
	</div>
	<div class="author_tj">
		<p>读者收藏</p>
	</div>
	<div class="author_tj_1">
		<jsp:include page="read_list.jsp" flush="false"></jsp:include>
	</div>
</div>
<jsp:include page="foot.jsp"></jsp:include>