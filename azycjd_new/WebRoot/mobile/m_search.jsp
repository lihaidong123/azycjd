<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="m_head.jsp"></jsp:include>
<style type="text/css">
	#menu_div_head{display:none;}
	#head_logo_div{display:none;}
	.paihangbang{background-color: #ffffff; padding: 6px;}
</style>
<div>
	<form id="mAnzhiNovelFormSearch" action="mobile/msearch.do" method="post">
		<div style="line-height:40px; background-color:#000000; color:#CCCCCC; padding:10px;">
			<span onClick="window.history.go(-1);" style="font-weight:bold; padding:8px;padding-left:15px; padding-right:15px;"><</span>&nbsp;
			<input type="text" placeholder="请输入作者/作品/标签搜索" style=" background-color:#000000; color:#eaeef0; font-size:16px; border:none; border-bottom:#0099FF 1px solid; line-height:36px; height:36px; padding-left:10px; width:75%;" value="${param.novelTitles }" id="novelTitles" name="novelTitles"/>
			<img onclick="$('#mAnzhiNovelFormSearch')[0].submit();" style="position:absolute; cursor:pointer; margin-left:-36px;" src="<%=request.getContextPath() %>/mobile/images/fangdajing.png" width="26"/>
		</div>
	</form>
	<div class="paytype_two" style="background-color: #d2d2d2;color:#666;font-family:'黑体';">
		搜索"${param.novelTitles }"，共搜到${searchlist.total }条结果：
	</div>
	<c:forEach items="${searchlist.list}" var="s" varStatus="ind">
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
						${fn:substring(s.mVote,0,30) }...
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
							<c:if test="${s.isSigned eq 1 }">
								<img src="<%=request.getContextPath() %>/mobile/images/yiqianyue.png"/>
							</c:if>
						</span>
					</div>
					<div class="novel_types_info">
						<c:if test="${s.isSigned eq 0 }">
							<c:if test="${s.isWebUp eq 1}">
								<img src="<%=request.getContextPath() %>/mobile/images/wangzhanshangjia.png"/>
							</c:if>
							<c:if test="${s.isPingTaiUp eq 1}">
								<img src="<%=request.getContextPath() %>/mobile/images/pingtaishangjia.png"/>
							</c:if>
						</c:if>
						
					</div>
				</td>
			  </tr>
			</table>
		</div>
	</c:forEach>
</div>
<jsp:include page="m_foot.jsp"></jsp:include>
