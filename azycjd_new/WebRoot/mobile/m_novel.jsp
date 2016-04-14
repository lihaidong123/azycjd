<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:forEach items="${data.list }" var="s" varStatus="ind">
	<div class="paihangbang">
		<table width="100%" border="0">
		  <tr>
			<td valign="top" width="100" align="center">
				<div class="m_novel_img" onclick="loadNovel(${s.id})"><img src="${s.mNovelImg }"/></div>
			</td>
			<td valign="top" class="novel_items">
				<div class="novel_title_css" onclick="loadNovel(${s.id})">${s.novelTitle }</div>
				<div class="novel_author_css">${s.authorWriterName }</div>
				<div class="novel_info_css" style="text-indent:20px;">
					${fn:substring(s.mVote,0,12) }...
				</div>
				<div class="novel_types_info">
					<span style="font-size:12px;">${s.novelType }</span>
					<span>
						<c:if test="${s.state eq 2 }">
							<img src="<%=request.getContextPath() %>/mobile/images/lianzai.png"/>
						</c:if>
						<c:if test="${s.state eq 3 }">
							<img src="<%=request.getContextPath() %>/mobile/images/yiwanjie.png"/>
						</c:if>
						<c:if test="${s.isSigned eq 0 }">
							<c:if test="${s.isWebUp eq 1}">
								<img src="<%=request.getContextPath() %>/mobile/images/wangzhanshangjia.png"/>
							</c:if>
							<c:if test="${s.isPingTaiUp eq 1}">
								<img src="<%=request.getContextPath() %>/mobile/images/pingtaishangjia.png"/>
							</c:if>
						</c:if>
						<c:if test="${s.isSigned eq 1 }">
							<img src="<%=request.getContextPath() %>/mobile/images/yiqianyue.png"/>
						</c:if>
					</span>
				</div>
			</td>
		  </tr>
		</table>
	</div>
</c:forEach>
<input type="hidden" class="isEndCss" value="<c:if test='${data.num >= data.totalNum }'>no</c:if><c:if test='${data.num < data.totalNum }'>yes</c:if>"/>
