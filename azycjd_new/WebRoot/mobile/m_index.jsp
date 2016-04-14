<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="m_head.jsp"></jsp:include>
	<div>
		<div class="index_css_title"><span class="index_css_title_one"></span><span class="index_css_title_two">编辑推荐</span><span class="index_css_title_three">EDITORS CHOICE</span></div>
		<div class="div_float_css">
			<c:forEach items="${bainjituijian.list }" var="s" varStatus="ind">
				<div class="wanjiejingxun">
					<table width="100%" border="0">
					  <tr>
						<td valign="top" width="80" align="center">
							<div class="m_novel_img" onclick="loadNovel(${s.id})"><img src="${s.mNovelImg }"/></div>
						</td>
						<td valign="top" class="novel_items">
							<div class="novel_title_css" onclick="loadNovel(${s.id})">${s.novelTitle }</div>
							<div class="novel_author_css">作者:${s.authorWriterName }</div>
							<div class="novel_info_css">
								${fn:substring(s.mVote,0,40) }...
							</div>
							<div class="novel_char_num">
								字数:${s.totalCharNum }
							</div>
						</td>
					  </tr>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div>
		<div class="index_css_title"><span class="index_css_title_one"></span><span class="index_css_title_two">本周特惠</span><span class="index_css_title_three">SPECIAL OFFER</span><span class="index_css_title_three"><a href="<%=request.getContextPath()%>/mobile/moreDiscount.do">更多</a></span></div>
		<div class="div_float_css">
			<c:forEach items="${benzhoutehui.list }" var="s" varStatus="ind">
				<div class="wanjiejingxun">
					<table width="100%" border="0">
					  <tr>
						<td valign="top" width="35" align="center">
							<div class="m_novel_img" onclick="loadNovel(${s.id})"><img src="${s.mNovelImg }"/></div>
						</td>
						<td valign="top" class="novel_items">
							<div class="yuohui_type">【<c:if test="${s.discountedType eq 0 }">本周免费</c:if><c:if test="${s.discountedType eq 1 }">限时免费</c:if><c:if test="${s.discountedType eq 2 }">完本优惠</c:if><c:if test="${s.discountedType eq 3 }">红文折扣</c:if>】</div>
							<div class="novel_title_css" onclick="loadNovel(${s.id})">${s.novelTitle }</div>
							<div class="novel_author_css">作者:${s.authorWriterName }</div>
							<div class="novel_info_css">
								截止日期:<fmt:formatDate value="${s.discountedEndDate}" pattern="yyyy/MM/dd HH:mm"/>
							</div>
						</td>
					  </tr>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
	<div>
		<div class="index_css_title"><span class="index_css_title_one"></span><span class="index_css_title_two">完结精选</span><span class="index_css_title_three">FINISHED OVER RECOMMANDED</span></div>
		<div>
			<c:forEach items="${wanjiejingxuan.list }" var="s" varStatus="ind">
				<div class="wanjiejingxun">
					<table width="100%" border="0">
					  <tr>
						<td valign="top" width="35" align="center">
							<div class="m_novel_img" onclick="loadNovel(${s.id})"><img src="${s.mNovelImg }"/></div>
						</td>
						<td valign="top" class="novel_items">
							<div class="novel_title_css" onclick="loadNovel(${s.id})">${s.novelTitle }</div>
							<div class="novel_author_css">${s.authorWriterName }</div>
							<div class="novel_info_css" style="text-indent:20px;">
								${fn:substring(s.mVote,0,40) }...
							</div>
							<div class="novel_num_info">
								<span style="margin-left:0px;">总点击:${s.clickNum }</span>
								<span>总字数:${s.totalCharNum }</span>
							</div>
							<div class="novel_updatetime_info">
								最后更新:<fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/>
							</div>
						</td>
					  </tr>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
	<div style="text-align:center; margin-top:20px; height:60px; line-height:60px;cursor: pointer;" onclick="window.location.href='http://www.azycjd.com/'">
		<img src="<%=request.getContextPath() %>/mobile/images/Monitor.png" style="vertical-align:middle; margin-right:6px; font-family:'黑体'; font-size:12px;" />切回电脑版
	</div>
	
<jsp:include page="m_foot.jsp"></jsp:include>