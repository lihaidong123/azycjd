<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<div>
		<c:forEach items="${anzhitrendList.list}" var="a">
			<div class="my_activity_css">
				<div class="my_activity_img_css">
					<table>
						<tr>
							<td>
								<img src="${a.memberHeadImg }" width="41px" height="41px">
							</td>
							<td>
								<div class="my_activity_author_scss">${a.memberNick }</div>
								<div class="my_activity_time_css">
									<fmt:formatDate value="${a.addTime}" pattern="yyyy年MM月dd日  HH:mm"/>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="my_activity_content_css">
					${a.trendContent }
					<input type="hidden" value="${a.id }" class="trendid"/>
				</div>
				
				<c:forEach items="${a.ls}" var="r">
					<div class="my_activity_reply_css">
						<div class="my_activity_css">
							<table>
								<tr>
									<td>
										<img src="${r.memberHeadImg }" width="41px" height="41px">
									</td>
									<td>
										<div class="my_activity_author_scss">${r.memberNick}</div>
										<div class="my_activity_time_css">
											<fmt:formatDate value="${r.addTime}" pattern="yyyy年MM月dd日  HH:mm"/>
										</div>
									</td>
								</tr>
							</table>
							<div class="my_activity_content_css">
								${r.replyContent }
								<input type="hidden" value="${a.id }" class="trendid"/>
								<input type="hidden" value="${r.id }" class="replyid"/>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>