<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="m_head.jsp"></jsp:include>
<style type="text/css">
	#menu_div_head{ display:none;}
	#footer_div{ display:none;}
	.shuqianmulv{ margin:0 auto; width:230px; overflow:auto;}
	.shuqianmulv ul{ margin:0px; padding:0px; list-style:none; font-family:"黑体";}
	.shuqianmulv li{ float:left; cursor:pointer; width:110px; line-height:36px; text-align:center; font-weight:bold;}
	.user_div_xss div{ line-height:26px;}
	.shoucang_css{  width:70px; height:35px; padding:10px; background-color:#00CCFF; border-radius:4px;}
	.shoucang_css a{ color:#FFFFFF; text-decoration:none; font-size:13px;}
</style>
<script type="text/javascript">
	function dashang(novelId){
		if(memberId==""){
			window.location.href=path+"/mobile/m_login.jsp";
		}else{
			window.location.href="<%=request.getContextPath() %>/anzhinovel/loadDaShangJsp.do?novelId="+novelId+"&&divIndex=0&&con=no&&pageName=mobile/m_dashang";
		}
		
	}
</script>
<div style="background-color:#FFFFFF; padding:8px;">
	<div class="shuqianmulv">
		<ul>
			<li id="mulv_li" style="border-radius:6px 0px 0px 6px; background-color:#6ae2c7;" onclick="$('#mulu_div').css('display','block');$('#mulv_li').css('background-color','#6ae2c7');$('#shuqian_li').css('background-color','#e8e8e8');$('#shuqian_div').css('display','none');">目录</li>
			<li id="shuqian_li" style="border-radius:0px 6px 6px 0px;background-color:#e8e8e8;" onclick="$('#mulu_div').css('display','none');$('#mulv_li').css('background-color','#e8e8e8');$('#shuqian_li').css('background-color','#6ae2c7');$('#shuqian_div').css('display','block');">书签</li>
		</ul>
	</div>
</div>

<div id="mulu_div">
	<div style="clear:both; line-height:60px; padding-left:15px;font-weight:bold;">
		《${pojo.novelTitle }》作品相关
		<c:if test="${shoucangBoolean eq true }">
			<span class="shoucang_css"><a href="javascript:;" onclick="multifunction(this,'${loginUsers.id}','${pojo.id }',1,'${pojo.novelTitle }')">收藏本书</a></span>
		</c:if>
		<c:if test="${shoucangBoolean eq false }">
			<span class="shoucang_css"><a href="javascript:;">已收藏</a></span>
		</c:if>
	</div>
	<div class="user_div_xss" style="background-color:#FFFFFF;">
		<div class="titls_info_td" style="padding-top:5px; cursor:pointer;" onclick="$('#novel_vote_div').slideToggle();">作品简介<span class="xialai_css"><img src="<%=request.getContextPath()%>/mobile/images/sanHover.png"/></span></div>
		<div style="color:#CCCCCC; display:block; font-size:12px; padding-left:15px;">最后更新:<fmt:formatDate value="${pojo.updateTime}" pattern="yyyy/MM/dd HH:mm"/></div>
		<div id="novel_vote_div" style="line-height:23px; font-size:12px; color:#999999; padding:10px; text-indent:15px;">
			${pojo.mVote }
		</div>
	</div>
	<div class="user_div_xss" style="background-color:#FFFFFF;">
		<div class="titls_info_td" style="padding-top:5px;cursor:pointer;" onclick="$('#novel_authorinfo_div').slideToggle();">作品信息<span class="xialai_css"><img src="<%=request.getContextPath()%>/mobile/images/sanHover.png"/></span></div>
		<div id="zuopingchanum" style="color:#CCCCCC;padding-bottom:7px; display:block; font-size:12px; padding-left:15px;">
			<c:if test="${pojo.state eq 2 }">
				<img src="<%=request.getContextPath() %>/mobile/images/lianzai.png"/>
			</c:if>
			<c:if test="${pojo.state eq 3 }">
				<img src="<%=request.getContextPath() %>/mobile/images/yiwanjie.png"/>
			</c:if>
			<c:if test="${pojo.isSigned eq 0 }">
				<c:if test="${pojo.isWebUp eq 1}">
					<img src="<%=request.getContextPath() %>/mobile/images/wangzhanshangjia.png"/>
				</c:if>
				<c:if test="${pojo.isPingTaiUp eq 1}">
					<img src="<%=request.getContextPath() %>/mobile/images/pingtaishangjia.png"/>
				</c:if>
			</c:if>
			<c:if test="${pojo.isSigned eq 1 }">
				<img src="<%=request.getContextPath() %>/mobile/images/yiqianyue.png"/>
			</c:if>
		</div>
		<div id="novel_authorinfo_div" style="line-height:23px;display:none; font-size:12px; color:#999999; padding:10px; padding-left:0px;text-indent:15px;">
			<div>点击数:${pojo.clickNum }</div>
			<div>作品字数:${pojo.totalCharNum }</div>
			<div>总收藏数:${pojo.totalSaveNum }</div>
			<div>总订阅数:${pojo.totalDingyueNum }</div>
			<div>总打赏数:${pojo.totalShangNum }</div>
			<div>总评论数:${pojo.totalCommentNum }</div>
		</div>
	</div>
	<div style="clear:both; line-height:60px; padding-left:15px;font-weight:bold;">
		章节
	</div>
	
	 <c:set var="chaper_num_index" value="1"></c:set>
	 <c:forEach items="${chapterData.list }" var="s" varStatus="ind">
	 	<div class="fen_juan_title_css">第${ind.index+1}卷&nbsp;${s.juanName }</div>
	 	<c:forEach items="${s.ls }" var="k">
	 		<div class="user_div_xss" style="background-color:#FFFFFF;">
				<div class="titls_info_td" style="padding-top:5px;cursor:pointer;" onclick="window.location.href='<%=request.getContextPath()%>/mobile/readChapter.do?chapterId=${k.id }&&novelId=${param.novelId }'">
					<c:if test="${k.readType eq 0 }"><img style="vertical-align: middle;" src="<%=request.getContextPath() %>/mobile/images/free.png"/></c:if>
					<c:if test="${k.readType eq 1 }"><img style="vertical-align: middle;" style="vertical-align: middle;" src="<%=request.getContextPath() %>/mobile/images/vip.png"/></c:if>
					第${chaper_num_index }章 ${k.chapterTitle }
				</div>
				<div style="color:#CCCCCC; display:block; font-size:12px; padding-left:15px;">更新时间:<fmt:formatDate value="${k.lastUpdateTime}" pattern="yyyy/MM/dd HH:mm"/></div>
			</div>
			<c:set var="chaper_num_index" value="${chaper_num_index+1 }"></c:set>
	 	</c:forEach>
	 </c:forEach>
</div>

<div id="shuqian_div" style="display:none;">
	<div style="clear:both; line-height:60px; padding-left:15px;font-weight:bold;">
		书签
	</div>
	<div class="table_css_mobile">
		<table width="100%" border="0">
		  <tr style="background-color:#FFFFFF;line-height:45px;font-family:'黑体'; font-weight:bold;">
			<td style="font-size:14px; color:#565454;">章节名称</td>
			<td style="font-size:14px;color:#565454;">书签日期</td>
			<td></td>
		  </tr>
		   <c:forEach items="${markData.list }" var="s" varStatus="ind">
		   	  <tr>
				<td>${s.chapterTitle }</td>
				<td><fmt:formatDate value="${s.addTime}" pattern="yyyy/MM/dd HH:mm"/></td>
				<td><a href="<%=request.getContextPath()%>/mobile/readChapter.do?chapterId=${s.chapterId }&&novelId=${param.novelId }&&&&readAddress=${s.readAddress}">阅读</a></td>
			  </tr>
		   </c:forEach>
		</table>
	</div>
</div>

<div class="footer" style="width:100%;">
	<table width="100%" border="0">
	  <tr>
		<td width="25%">
			<div onClick="window.history.go(-1);"><img src="<%=request.getContextPath() %>/mobile/images/fanhui.png"/></div>
		</td>
		<td width="25%">
			<div onClick="dashang(${param.novelId})"><img src="<%=request.getContextPath() %>/mobile/images/dashang.png" style="width:55px;"/></div>
		</td>
		<td width="25%">
			<div  onClick="window.location.href='<%=request.getContextPath() %>/mobile/m_shuku.do?menu_type=1'"><img src="<%=request.getContextPath() %>/mobile/images/shuku.png"/></div>
		</td>
		<td width="25%">
			<div onClick="window.location.href='<%=request.getContextPath() %>/mobile/mpinglun.do?novelId=${param.novelId }'"><img src="<%=request.getContextPath() %>/mobile/images/pinglunpic.png" style="width:32px;"/></div>
		</td>
	  </tr>
	</table>
</div>
<jsp:include page="m_foot.jsp"></jsp:include>