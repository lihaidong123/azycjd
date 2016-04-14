<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="top.jsp"></jsp:include>
<div style="width: 1000px;margin: 0 auto;">
	<div class="title_div_css">
		作者资料&nbsp;>&nbsp;${pojo.authorWriterName }
	</div>
	<div class="author_content">
		<div class="author_content_left">
			<div style="width: 183px;height: 195px; text-align: center; padding:175px 0px 0px 210px;">
				<img src="${pojo.authorImage }" width="104" height="104"><br>
				<p style="clear: both;color:#757575;font-size: 28px;letter-spacing:2px;margin-top:15px;">${pojo.authorWriterName }</p>
			</div>
			<div class="author_content_left_1">
				<!--<div>
					 <img src="images/8_p_2.png" style="margin-bottom: 57px;padding-left: 77px;">
				</div> -->
				<div style="width: auto;height: 20px;padding: 0px 0px 0px 38px;font-size: 14px;font-weight: bold;">${pojo.authorInfo }</div>
			</div>
		</div>
		<div><img src="images/8_p_16.png" style="padding-top: 205px;"></div>
		<div class="author_content_right">
			<div class="author_content_right_1">
				<ul>
					<li>专栏主人:&nbsp;${pojo.authorWriterName }</li>
					<li>授权状态:&nbsp;
						<c:if test="${pojo.authorState eq 2}">
							已签约
						</c:if>
						<c:if test="${pojo.authorState ne 2}">
							未签约
						</c:if>
					</li>
					<li>被收藏数:${zongshoucangshu }</li>
					<li>作品总字数:${zongzishu }</li>
					<li>最近更新作品:${zuijingengxinxiaohsuo }</li>
					<li>最后更新时间:${shugengxinshijian}</li>
					
				</ul>
				<div style="width: 146px;height: 20px;padding: 79px 0px 0px 62px;"> 
					<!-- <span style="font-size: 13px;"><img src="images/7_p_2.png" style="padding-right: 4px;">收藏</span>
					<span style="padding-left: 40px;font-size: 13px;"><img src="images/7_p_3.png" style="padding-right: 4px;">评论</span> -->
				</div>
			</div>
			
		</div>
	</div>
	<div class="author_tj">
		<p>作者推荐</p>
	</div>
	<div class="author_tj_1">
		<c:forEach items="${tuijianlist.list }" var="s" varStatus="ind">
			<div class="article_items" id="article_items01${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
				<div class="noval_img" id="${s.id }novalImg${ind.index}1">
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
						<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
						<td class="read_num_css" title="点击数">${s.clickNum }</td>
						<td class="end_article">${novelStateArr[s.nstate] }</td>
					  </tr>
					</table>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="author_tj">
		<p>作者作品</p>
	</div>
	<div class="author_tj_1" style="min-height:430px;overflow: auto;">
		<c:forEach items="${novellist.list }" var="s" varStatus="ind">
			<div class="article_items" id="article_items01${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
				<div class="noval_img" id="${s.id }novalImg${ind.index}1">
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
						<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
						<td class="read_num_css" title="点击数">${s.clickNum }</td>
						<td class="end_article">${novelStateArr[s.state] }</td>
					  </tr>
					</table>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script type="text/javascript">
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
		});
		$(".noval_img").each(function(){
			var ids=$(this)[0].id;
			var novleId=ids.substring(0,ids.indexOf("novalImg"));
			$(this).children("img").click(function(){
				window.location.href=path+"/novel/"+novleId+".jsp";
			});
		});
	});
</script>
<jsp:include page="foot.jsp"></jsp:include>