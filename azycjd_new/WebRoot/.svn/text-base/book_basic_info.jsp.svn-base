<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="sec_book_css">
	<div>
		<table width="100%" border="0">
		  <tr>
			<td valign="top" width="55">
				<div>
					<img src="${param.novelImg }" width="50" height="66"/>
				</div>
			</td>
			<td valign="top">
				<div class="book_basic_css">
					<div class="book_title_css">${param.novelTitle }</div>
					<div class="book_author_css">作者：${param.authorWriter }</div>
					<div class="book_click_css">点击数：${param.clickNum } 阅读数：${param.readNum }</div>
				</div>
			</td>
		  </tr>
		</table>
	
	</div>
	<div class="book_intro_css">
		<strong>简介</strong>：${param.novelVote }
	</div>
	<div class="book_buttom_css">
		<span class="zhangjiemulv"><a href="<%=request.getContextPath() %>/novel/${param.novelId }.jsp">章节目录</a></span>
	</div>
</div>
