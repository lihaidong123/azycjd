<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<c:if test="${qiandao eq 'no'}">
		<div onclick="qiandao(this)" style="width:133px; height:117px; cursor:pointer; position:absolute;margin-left:610px; margin-top:-62px; background-image:url(<%=request.getContextPath()%>/index/images/qiandaoicon.png);">
		</div>
		<div id="qiandaonumDiv" style="display:none;width:133px; height:117px; position:absolute;margin-left:610px; margin-top:-62px; background-image:url(<%=request.getContextPath()%>/index/images/qiandaohou.png);">
			<div style="padding-top: 55px;margin-left:60px; width:40px; text-align:center;color: #db1b1b; font-size: 16px; font-weight: bold;">${qiandaonum }</div>
			<div style="text-align: center; padding-top: 8px;color: #938d8d;">${lastSignTime }</div>
		</div>
	</c:if>
	<c:if test="${not empty qiandaonum}">
		<div id="qiandaonumDiv" style="width:133px; height:117px; position:absolute;margin-left:610px; margin-top:-62px; background-image:url(<%=request.getContextPath()%>/index/images/qiandaohou.png);">
			<div style="padding-top: 55px;margin-left:60px; width:40px; text-align:center;color: #db1b1b; font-size: 16px; font-weight: bold;">${qiandaonum }</div>
			<div style="text-align: center; padding-top: 8px;color: #938d8d;">${lastSignTime }</div>
		</div>
	</c:if>
	<form method="post" action="<%=request.getContextPath() %>/anzhitrend/addAnzhiTrend.do" id="myactivityform">
		<div style="background-color:#ffffff; width:95%; overflow:auto; margin:0 auto; margin-top:20px; border:#ececec 1px solid; border-radius:5px; padding-top:10px;">
			<div style=" margin:0 auto;width:95%;">
				<div style=" border-bottom:#CCCCCC 1px solid;">
					<textarea id="trendContent" name="trendContent" class="textarea_css" placeholder="请输入消息内容..." style="height:110px; width:100%; border:none;resize: none;"></textarea>
				</div>
				<div class="shupin_css_foot" style="overflow:auto; padding-top:10px; padding-bottom:10px;">
					<div style="background:url(images/biaoqing.png) no-repeat 1px 1px; color:#666666; width:60px; font-size:13px; float:left;cursor:pointer; padding-left:30px;" onclick="$('#trendContentBiaoQing').slideToggle()">添加表情</div>
					<div id="remainCharNum" class="remainCharNum">还可以输入2000字</div>
					<div style="margin-left:100px; padding-top:4px;" onclick="loadimage()">
						<!-- <img alt="code..." name="randImage" id="randImage" src="./image.jsp" width="60" height="20" border="1"/> -->
					</div>
					<div style="padding-top:4px;">
						<input type="hidden" class="txt" id="randCode" name="randCode" placeholder="输入验证码" style=" width:90px;" value="1000" />
					</div>
					<div class="addCommentDiv" onclick="ajaxFormSubmit('myactivityform',this)">发表</div>
				</div>
			</div>
			<jsp:include page="../biaoqing.jsp" flush="false">
				<jsp:param value="trendContent" name="textAreaId"/>
			</jsp:include>
		</div>
	</form>
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