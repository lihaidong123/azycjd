<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="m_head.jsp"></jsp:include>
	<div>
		<div class="index_css_title"><span class="index_css_title_one"></span><span class="index_css_title_two">本周免费</span><span class="index_css_title_three">THIS WEEK FREE</span></div>
		<div class="div_float_css">
			<c:forEach items="${benzhou.list }" var="s" varStatus="ind">
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
		<div class="index_css_title"><span class="index_css_title_one"></span><span class="index_css_title_two">限时免费</span><span class="index_css_title_three">LIMIT FREE</span></div>
		<div class="div_float_css">
			<c:forEach items="${xianshimianfei.list }" var="s" varStatus="ind">
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
		<div class="index_css_title"><span class="index_css_title_one"></span><span class="index_css_title_two">红文折扣</span><span class="index_css_title_three">RED DISCOUNT TEXT</span></div>
		<div class="div_float_css">
			<c:forEach items="${wanbenyouhui.list }" var="s" varStatus="ind">
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
		<div class="index_css_title"><span class="index_css_title_one"></span><span class="index_css_title_two">完本优惠</span><span class="index_css_title_three">End OF THE OFFER</span></div>
		<div class="div_float_css">
			<c:forEach items="${hongwenyouhui.list }" var="s" varStatus="ind">
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
	
<jsp:include page="m_foot.jsp"></jsp:include>