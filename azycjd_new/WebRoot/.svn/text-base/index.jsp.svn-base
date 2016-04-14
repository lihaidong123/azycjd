<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="top.jsp"></jsp:include>
	<script language="javascript">
		$(function(){
			$(".news_title_css").click(function(){
				window.open("<%=request.getContextPath()%>/"+$(this)[0].id);
			});
			loadLoginInfo();
		});
	</script>
	<div class="index_img_1" style="background-image:url(${sessionPaihangbang});">
		<!-- <div class="paihangbangIndexCss" onclick="window.open('novel_list.jsp')">
		</div> -->
	</div>
	<div class="index_img_2" style="background-image:url(${sessionZuojiafuli});">
		<!-- <div class="zuojiafuliIndexCss" onclick="window.location.href='zuojiafuli.jsp'">
		</div> -->
	</div>
	<div style="background-color:#e5e5e5; height: 585px;">
		<div class="index_1_css">
			<div class="en_title">BOOK  BANK</div>
			<div class="title_css" onclick="window.location.href='all_type_list.jsp'"></div>
			<div>——</div>
			<div class="shuku_index">
				<c:forEach items="${yuepiaoshuju.list }" var="s">
					<p onclick="window.location.href='<%=request.getContextPath()%>/novel/${s.id }.jsp'">[${s.novelType }]${s.novelTitle }</p>
				</c:forEach>
			</div> 
			<div>
				<div class="self_btn" onclick="window.location.href='all_type_list.jsp'">进入书库</div>
			</div>
		</div>
	</div>
	<div style="clear:both; height:600px; margin-top:20px;">
		<div class="index_2_css">
			<div style="background:url(images/youhui.png) right no-repeat;height:28px;cursor: pointer;" onclick="window.location.href='yhsf.html'">	
			</div>
			<div>——</div>
			<div class="en_title">
				DISCOUNT&SPECIAL OFFER
			</div>
			<div style="padding-top:20px;">
				<div class="self_btn" style="margin-right:0px;" onclick="window.location.href='yhsf.html'">立刻进入</div>
			</div>
		</div>
		<div class="index_3_css">
			<table width="100%" border="0">
			  <tr>
				<td class="huodongzhuanquIndexCss_td" style=" background-image:url(${sessionDashentuijian}); background-repeat:no-repeat;width:329px; height:536px;">
					<div class="huodongzhuanquIndexCss"></div>
				</td> 
				<td valign="top">
					<div class="index_4_css">
						<div style="background:url(images/dashentuijian.png) left no-repeat;height:28px;cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${dashenBest.id }.jsp'">	
						</div>
						<div style="padding-top:25px;">——</div>
						<div class="en_title">RECOMMEND</div>
						<div>
							<ul>
								<c:forEach items="${dashenlist.list }" var="s">
									<li onclick="window.location.href='<%=request.getContextPath()%>/novel/${s.id }.jsp'">>&nbsp;&nbsp;${s.novelTitle }</li>
								</c:forEach>
							</ul>
						</div> 
						<div style="padding-top:55px;">
							<div class="self_btn" style="margin-left:0px;" onclick="window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=${dashenBest.authorId }')">作者介绍</div>
						</div>
					</div>
					<div id="bestRecommandNovel" style="display: none;">
						<div class='novel_info'>${dashenBest.vote}</div>
						<div style='text-align:right;padding-right: 10px;'>${dashenBest.authorWriterName}  著</div>
						<div class='novel_list_index'>
							<div>> ${dashenBest.novelTitle}</div>
							<div class='self_btn' style='margin-left:50px;margin-top:25px;'><a href='<%=request.getContextPath()%>/novel/${dashenBest.id}.jsp' style="color:#ffffff;padding-right:30px;">立刻阅读</a></div>
						</div>
					</div>
				</td>
			  </tr>
			</table>
		</div>
	</div>
	<div style="background:url(images/laba.png) 2px 2px no-repeat; padding-top:160px;">
		<div class="advGong" style="border-bottom:#333333 1px solid; border-top:#333333 1px solid; width:85%; margin:0 auto;">
			<jsp:include page="news_html/news.jsp"></jsp:include>
		</div>
	</div>
	<div style="height:260px; clear:both;">
		<div class="index_5_css">
			<div class="coop_item" onclick="window.open('anzhicooperation/findAnzhiCooperationAllQian.do')">
				<div><img src="images/hezuo.png" width="125" height="124" /></div>
				<div class="coop_name">合作渠道</div>
				<div class="coop_en">COOPERATE</div>
			</div>
			<div class="coop_item" onclick="window.open('anzhiinteractive/findAnzhiInteractiveAllByType.do?interactiveType=0')">
				<div><img src="images/bankuai_1.png" width="125" height="124" /></div>
				<div class="coop_name">编辑专区</div>
				<div class="coop_en">COOPERATE</div>
			</div>
			<div class="coop_item"  onclick="">
				<div><img src="images/bankuai2.png" width="125" height="124" /></div>
				<div class="coop_name">电子杂志</div>
				<div class="coop_en">COOPERATE</div>
			</div>
			<div class="coop_item" onclick="window.open('anzhiinteractive/findAnzhiInteractiveAllByType.do?interactiveType=2')">
				<div><img src="images/bankuai_3.png" width="125" height="124" /></div>
				<div class="coop_name">版权维护</div>
				<div class="coop_en">COOPERATE</div>
			</div>
		</div>
	</div>
<jsp:include page="foot.jsp"></jsp:include>