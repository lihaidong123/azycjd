<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml,http://open.weibo.com/wb">
  <head>
    <base href="<%=basePath%>">
    
    <title>安之原创|安之原创基地</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="安之原创基地、安之原创、小说、小说排行榜、言情小说、玄幻都市、免费小说" />
	<meta name="description" content="安之原创|安之原创基地|小说|小说排行榜|言情小说|玄幻都市|免费小说" />
	<meta property="qc:admins" content="2315067207612132463757" />
	<meta property="wb:webmaster" content="3a36f523124c3619" />
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/azycjs.css">
	<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2050043132" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101296266" data-redirecturi="http://www.azycjd.com/qq_back.jsp" charset="utf-8"></script>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.color.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/azycjd.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index/css/index.css"/>
	<script language="javascript">
		$(function(){
			$("#searchText").focus(function(){
				if($(this).val()=="请输入搜素内容"){
					$(this).val("");
				}
			});
			$("#searchText").blur(function(){
				if($(this).val()==""){
					$(this).val("请输入搜素内容");
				}
			});
			
			$(".news_content_div_css").each(function(){
				htmlCode($(this)[0]);
			});
		});
		
		function htmlCode(obj){
			try{
				var t=obj.innerText;
				t=t.substring(0,120);
				obj.innerHTML=t;
			}catch(ex){
				var t=obj.textContent;
				t=t.substring(0,120);	
				obj.innerHTML=t;
			}
		}
	</script>
	<!--[if lte IE 7]>
		<div id="browseTips" style="width:830px;background-color:#FFFFFF; margin:0 auto; margin-top:40px;margin-bottom:20px;line-height:23px;">
			我们发现您使用的IE浏览器版本距离现在已经很遥远了。为了更好的体验本系统，我们建议您升级浏览器。您可以选择：<br />
 			<a target="_blank" href="http://rj.baidu.com/soft/detail/14917.html?ald">IE10</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/11843.html?ald">火狐浏览器</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>|<a href="javascript:closeBrowseTip()">关闭</a>
		</div>
 		
	<![endif]-->
  </head>
  
  <body id="top_banner" style="padding:0px; margin:0px; background:url(${sessionGonggao})  center 0px no-repeat #f0f0f0;">
  	<jsp:include page="other_head.jsp" flush="false" />
	
		<form id="AnzhiNewsFormIndex" action="anzhinews/news.do" method="post">
			<div class="main_2_div">
				<div class="div_title_css_main">
					<div class="div_title_css_sec">安之公告</div>
					<div class="div_title_css_conetent">
						<c:forEach items="${anzhinewsList.list}" var="s" varStatus="ind">
							<div class="news_title">
								<table width="100%">
									<tr>
										<td width="70%" class="news_title_css"><a href="<%=request.getContextPath() %>/news_html/anzhi_news_${s.id }.jsp" target="_blank">${s.newsTitle }</a></td>
										<td width="30%" class="news_time_css">${s.addTime }</td>
									</tr>
									<tr>
										<td colspan="2">
											<div class="news_content_css">
												<div style="float: left;">
													<a href="<%=request.getContextPath() %>/news_html/anzhi_news_${s.id }.jsp" target="_blank">[详细]</a>
												</div>
												<div class="news_content_div_css">
													${s.newsContent }
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</c:forEach>
						<jsp:include page="next_page.jsp" flush="false">
							<jsp:param value="anzhinews/news.do" name="url"/>
							<jsp:param value="${anzhinewsList.totalNum }" name="totalNum"/>
							<jsp:param value="${anzhinewsList.num }" name="num"/>
							<jsp:param value="AnzhiNewsFormIndex" name="formId"/>
							<jsp:param value="${anzhinewsList.total }" name="total"/>
							<jsp:param value="${param.size}" name="size"/>
						</jsp:include>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="interactive.jsp" flush="false">
			<jsp:param value="1" name="interactivetype"/>
		</jsp:include>
<jsp:include page="foot.jsp"></jsp:include>