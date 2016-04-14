<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="top.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Random r=new Random();
	String d=r.nextDouble()+"";
	d="end"+d.substring(3,d.length())+"leixing";
 %>
<script type="text/javascript">
	var t=43400;
	function getEndTime(){
		var day=parseInt(t/(24*60*60));
		var hour=parseInt((t-day*(24*60*60))/(60*60));
		var minute=parseInt((t-day*(24*60*60)-hour*(60*60))/60);
		var sec=t-day*(24*60*60)-hour*(60*60)-minute*60;
		$("#end_time").html(parseInt(day)+"天"+parseInt(hour)+"小时"+parseInt(minute)+"分"+parseInt(sec)+"秒");
		t--;
		//setTimeout("getEndTime()",1000);
	}
	$(function(){
		setTimeout("getEndTime()",1000);
		loadLoginInfo();
		getHtmlContent("book_info",130);
	});
</script>
<style type="text/css">
	#end_time{margin-left: 7px; font: 13px/160% Tahoma, Verdana,snas-serif;}
</style>
<div class="main_2_div">
	<div style="position:absolute;background-color:#e5e5e5; height: 670px; width:950px; z-index:-1; top:778px; margin-left:10px;">
	</div>
	<div class="title_div_css">
		优惠书坊&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%-- <img src="<%=request.getContextPath()%>/images/clock.png"><font title="优惠倒计时" id="end_time" style="font-size:20px;"></font> --%>
	</div>
	<div class="week_free">
		本周免费
	</div>
	<div>
		<table width="100%" border="0">
		  <tr>
			<td width="310">
				<div class="recommand_3_css" style="padding-left:20px;">
					<div class="title_self_css">${(benzhou.list)[0].novelTitle }</div>
					<div>——</div>
					<div>
						${(benzhou.list)[0].authorWriterName } 著
					</div> 
					<div class="book_info" style="height:165px;">
						${(benzhou.list)[0].vote }
					</div>
					<div class="book_info">
						免费截止：<fmt:formatDate value="${(benzhou.list)[0].discountedEndDate }" pattern="yyyy/MM/dd HH:mm:ss"/>
					</div>
					<div>
						<div class="self_btn" style="margin-left:0px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${(benzhou.list)[0].id }/index.jsp'">立刻阅读</div>
					</div>
				</div>
			</td>
			<td width="200">
				<img src="${(benzhou.list)[0].novelImg }" width="205" height="290" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${(benzhou.list)[0].id }/index.jsp'" />
			</td>
			<td>
				<div class="recommand_3_css" style="padding-left:20px;">
					<div class="title_self_css">${(benzhou.list)[1].novelTitle }</div>
					<div>——</div>
					<div>
						${(benzhou.list)[1].authorWriterName } 著
					</div> 
					<div class="book_info" style="height:165px;">
						${(benzhou.list)[1].vote }
					</div>
					<div class="book_info">
						免费截止：<fmt:formatDate value="${(benzhou.list)[1].discountedEndDate }" pattern="yyyy/MM/dd HH:mm:ss"/>
					</div>
					<div>
						<div class="self_btn" style="margin-left:0px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${(benzhou.list)[1].id }/index.jsp'">立刻阅读</div>
					</div>
				</div>
			</td>
			<td>
				<img src="${(benzhou.list)[1].novelImg }" width="205" height="290" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${(benzhou.list)[1].id }/index.jsp'" />
			</td>
		  </tr>
		</table>
	</div>
	<div style="margin-top:15px;">
		<table width="100%" border="0">
		  <tr>
			<td width="310">
				<div class="recommand_3_css" style="padding-left:20px;">
					<div class="title_self_css">${(benzhou.list)[2].novelTitle }</div>
					<div>——</div>
					<div>
						${(benzhou.list)[2].authorWriterName } 著
					</div> 
					<div class="book_info" style="height:165px;">
						${(benzhou.list)[2].vote }
					</div>
					<div class="book_info">
						免费截止：<fmt:formatDate value="${(benzhou.list)[2].discountedEndDate }" pattern="yyyy/MM/dd HH:mm:ss"/>
					</div>
					<div>
						<div class="self_btn" style="margin-left:0px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${(benzhou.list)[2].id }/index.jsp'">立刻阅读</div>
					</div>
				</div>
			</td>
			<td width="200">
				<img src="${(benzhou.list)[2].novelImg }" width="205" height="290"  style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${(benzhou.list)[2].id }/index.jsp'" />
			</td>
			<td>
				<div class="recommand_3_css" style="padding-left:20px;">
					<div class="title_self_css">${(benzhou.list)[3].novelTitle }</div>
					<div>——</div>
					<div>
						${(benzhou.list)[3].authorWriterName } 著
					</div> 
					<div class="book_info" style="height:165px;">
						${(benzhou.list)[3].vote }
					</div>
					<div class="book_info">
						免费截止：<fmt:formatDate value="${(benzhou.list)[3].discountedEndDate }" pattern="yyyy/MM/dd HH:mm:ss"/>
					</div>
					<div>
						<div class="self_btn" style="margin-left:0px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${(benzhou.list)[3].id }/index.jsp'">立刻阅读</div>
					</div>
				</div>
			</td>
			<td>
				<img src="${(benzhou.list)[3].novelImg }" width="205" height="290"  style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${(benzhou.list)[3].id }/index.jsp'" />
			</td>
		  </tr>
		</table>
	</div>
	
	<div class="list_items" style=" margin-top:80px;clear: both;">
		<a name="yi"></a>
		<div>
			<table class="list_table" width="100%" border="0">
			  <tr>
				<td class="list_title" width="90%" style="background:url(images/clock.png) 5px 10px no-repeat; font-weight:bold; padding-left:30px;">限时免费</td>
				<td>
					<div class="more_record">
						<!-- 更多 -->
					</div>
				</td>
			  </tr>
			</table>
		</div>
		<div style="clear:both; overflow:auto;" id="articePageMainDiv2">
			<c:forEach items="${xianshimianfei.list }" var="s" varStatus="ind">
				<div class="article_items" id="article_items02${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
					<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>2">
						<img src="${s.novelImg }" width="177" height="234"/>
					</div>
					<div class="noval_title" title="${s.novelTitle }">
						${fn:substring(s.novelTitle,0,9) }
					</div>
					<div class="noval_info_css">
						${fn:substring(s.vote,0,26) }...
					</div>
					<div class="noval_author"  title="${s.authorWriterName }">
						by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
					</div>
					<div class="article_type_css" style="height:25px;">
						${s.novelType }
					</div>
					<div class="article_items_foot">
						<table width="100%" border="0">
						  <tr>
							<td class="endDate_css">
								<div>截止时间:<fmt:formatDate value="${s.discountedEndDate }" pattern="yyyy/MM/dd HH:mm"/></div>
								<div><span class="discountedRebate_class">限时免费</span></div>
							</td>
						  </tr>
						</table>
					</div>
				</div>
			</c:forEach>	
		</div>
	</div>
	
	<div class="list_items">
		<a name="yi"></a>
		<div>
			<table class="list_table" width="100%" border="0">
			  <tr>
				<td class="list_title" width="90%" style="background:url(images/wanbenyouhui.png) 5px 10px no-repeat; font-weight:bold; padding-left:30px;">完本优惠</td>
				<td>
					<div class="more_record">
						<!-- 更多 -->
					</div>
				</td>
			  </tr>
			</table>
		</div>
		<div style="clear:both; overflow:auto;" id="articePageMainDiv3">
			<c:forEach items="${wanbenyouhui.list }" var="s" varStatus="ind">
				<div class="article_items" id="article_items03${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
					<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>3">
						<img src="${s.novelImg }" width="177" height="234"/>
					</div>
					<div class="noval_title" title="${s.novelTitle }">
						${fn:substring(s.novelTitle,0,9) }
					</div>
					<div class="noval_info_css">
						${fn:substring(s.vote,0,26) }...
					</div>
					<div class="noval_author"  title="${s.authorWriterName }">
						by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
					</div>
					<div class="article_type_css" style="height:25px;">
						${s.novelType }
					</div>
					<div class="article_items_foot">
						<table width="100%" border="0">
						  <tr>
							<td class="endDate_css">
								<div>截止时间:<fmt:formatDate value="${s.discountedEndDate }" pattern="yyyy/MM/dd HH:mm"/></div>
								<div><span class="discountedRebate_class">折扣:${s.discountedRebate*10 }折</span></div>
							</td>
						  </tr>
						</table>
					</div>
				</div>
			</c:forEach>	
		</div>
	</div>
	
	<div class="list_items">
		<a name="yi"></a>
		<div>
			<table class="list_table" width="100%" border="0">
			  <tr>
				<td class="list_title" width="90%" style="background:url(images/wenbenzhekou.png) 5px 10px no-repeat; font-weight:bold; padding-left:30px;">红文折扣区</td>
				<td>
					<div class="more_record">
						<!-- 更多 -->
					</div>
				</td>
			  </tr>
			</table>
		</div>
		<div style="clear:both; overflow:auto;" id="articePageMainDiv4">
			<c:forEach items="${hongwenyouhui.list }" var="s" varStatus="ind">
				<div class="article_items" id="article_items04${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
					<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>4">
						<img src="${s.novelImg }" width="177" height="234"/>
					</div>
					<div class="noval_title" title="${s.novelTitle }">
						${fn:substring(s.novelTitle,0,9) }
					</div>
					<div class="noval_info_css">
						${fn:substring(s.vote,0,26) }...
					</div>
					<div class="noval_author"  title="${s.authorWriterName }">
						by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
					</div>
					<div class="article_type_css" style="height:25px;">
						${s.novelType }
					</div>
					<div class="article_items_foot">
						<table width="100%" border="0">
						  <tr>
							<td class="endDate_css">
								<div>截止时间:<fmt:formatDate value="${s.discountedEndDate }" pattern="yyyy/MM/dd HH:mm"/></div>
								<div><span class="discountedRebate_class">折扣:${s.discountedRebate*10 }折</span></div>								
							</td>
						  </tr>
						</table>
					</div>
				</div>
			</c:forEach>	
		</div>
	</div>
</div>
<script language="javascript">
	$(function(){
		$(".noval_img").hover(function(){
			$("#book_info_css_div").remove();
			clearInterval(removeBookBaiscTimer);
			getBookBasicObject=$(this)[0];
			if($(this).data("novelId")==null){
				//说明没有加载
				loadNovelPartInfo(getBookBasicObject);
			}else{
				novelImg=$(this).data("novelImg");
				novelTitle=$(this).data("novelTitle");
				authorWriter=$(this).data("authorWriter");
				clickNum=$(this).data("clickNum");
				readNum=$(this).data("readNum");
				novelVote=$(this).data("novelVote");
				novelId=$(this).data("novelId");
				getBookBasicTimer=setTimeout("getBookBasicInfo()",400);
			}
		},function(){
			clearInterval(getBookBasicTimer);
			getBookBasicObject=null;
			novelImg=null;
			novelTitle=null;
			authorWriter=null;
			clickNum=null;
			readNum=null;
			novelVote=null;
			novelId=null;
			removeBookBaiscTimer=setTimeout("removeBookBasic()",1000);
			try{
				$("#paimingshuzi").remove();
			}catch(e){}
		});
		novalImgClick();
	});
</script>
<jsp:include page="foot.jsp"></jsp:include>