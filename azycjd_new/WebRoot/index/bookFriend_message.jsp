<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
 
     <div class="htmlTitleCss">
			<div class="htmlTitleCsss_one">书友留言</div>
	 </div>
	 <form class="formCss">
			<div>
				<div class="divItemsCss">留言标题：<input type="text" class="txtCss" id="" name=""></div>
				<div class="divItemsCss">收邮件者：<input type="text" class="txtCss" id="" name=""></div>
				<div class="divItemsCss">
					<p>留言内容：：</p>
					<p><textarea class="htmlEditCss" style="height:230px;"></textarea></p>
				</div>
			</div>
			<div class="divItemsCss">
				<input type="button" value="发送" class="saveBtnCss">
				<input type="button" value="重置" class="resetBtnCss">
			</div> 
     </form>
	
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>