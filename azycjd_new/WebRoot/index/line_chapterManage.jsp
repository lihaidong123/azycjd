<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<form class="formCss" id="day_registration_form">
	<div class="htmlTitleCss">
		<div class="htmlTitleCsss_one">章节管理</div>
		<div style="float:right;margin-top:-25px;margin-right:370px;">当前小说:无上传承</div>
	</div>
	<div class="second_title_css">
		<input class="addBtnCss" type="button" value="新增章节" onclick="window.location.href='<%=request.getContextPath()%>/index/line_newchapter.jsp?linenumber=26'" />
	</div>
	<div class="divTableCss">
		<table class="tableCss" width="100%" border="0">
		  <tr class="tableTitleCss">
			<td>序号</td>
			<td>章节名称</td>
			<td>添加时间</td>
			<td>阅读数</td>
			<td>字数</td>
			<td>状态</td>
			<td>操作</td>
		  </tr>
		  <tr>
		  	<td>1</td>
			<td>第一章 死亡是新的开始</td>
			<td>2015-7-22 17:02</td>
			<td>46</td>
			<td>2038</td>
			<td>已发布</td>
			<td><a href="index/line_newchapter.jsp?linenumber=26">修改</a>&nbsp;|&nbsp;
			删除</td>
		  </tr>
		  <tr>
		  	<td>2</td>
			<td>第一章 死亡是新的开始</td>
			<td>2015-7-22 17:02</td>
			<td>46</td>
			<td>2038</td>
			<td>已发布</td>
			<td><a href="index/line_newchapter.jsp?linenumber=26">修改</a>&nbsp;|&nbsp;
			删除</td>
		  </tr>
		  <tr>
		  	<td>3</td>
			<td>第一章 死亡是新的开始</td>
			<td>2015-7-22 17:02</td>
			<td>46</td>
			<td>2038</td>
			<td>已发布</td>
			<td><a href="index/line_newchapter.jsp?linenumber=26">修改</a>&nbsp;|&nbsp;
			删除</td>
		  </tr>
		  <tr>
		  	<td>4</td>
			<td>第一章 死亡是新的开始</td>
			<td>2015-7-22 17:02</td>
			<td>46</td>
			<td>2038</td>
			<td>已发布</td>
			<td><a href="index/line_newchapter.jsp?linenumber=26">修改</a>&nbsp;|&nbsp;
			删除</td>
		  </tr>
		  <tr>
		  	<td>5</td>
			<td>第一章 死亡是新的开始</td>
			<td>2015-7-22 17:02</td>
			<td>46</td>
			<td>2038</td>
			<td>已发布</td>
			<td><a href="index/line_newchapter.jsp?linenumber=26">修改</a>&nbsp;|&nbsp;
			删除</td>
		  </tr>
		  <tr>
		  	<td>6</td>
			<td>第一章 死亡是新的开始</td>
			<td>2015-7-22 17:02</td>
			<td>46</td>
			<td>2038</td>
			<td>已发布</td>
			<td><a href="index/line_newchapter.jsp?linenumber=26">修改</a>&nbsp;|&nbsp;
			删除</td>
		  </tr>
		  <tr>
		  	<td>7</td>
			<td>第一章 死亡是新的开始</td>
			<td>2015-7-22 17:02</td>
			<td>46</td>
			<td>2038</td>
			<td>已发布</td>
			<td><a href="index/line_newchapter.jsp?linenumber=26">修改</a>&nbsp;|&nbsp;
			删除</td>
		  </tr>
		  <tr>
		  	<td>8</td>
			<td>第一章 死亡是新的开始</td>
			<td>2015-7-22 17:02</td>
			<td>46</td>
			<td>2038</td>
			<td>已发布</td>
			<td><a href="index/line_newchapter.jsp?linenumber=26">修改</a>&nbsp;|&nbsp;
			删除</td>
		  </tr>
		  <tr>
		  	<td>9</td>
			<td>第一章 死亡是新的开始</td>
			<td>2015-7-22 17:02</td>
			<td>46</td>
			<td>2038</td>
			<td>已发布</td>
			<td><a href="index/line_newchapter.jsp?linenumber=26">修改</a>&nbsp;|&nbsp;
			删除</td>
		  </tr>
		  <tr>
		  	<td>10</td>
			<td>第一章 死亡是新的开始</td>
			<td>2015-7-22 17:02</td>
			<td>46</td>
			<td>2038</td>
			<td>已发布</td>
			<td><a href="index/line_newchapter.jsp?linenumber=26">修改</a>&nbsp;|&nbsp;
			删除</td>
		  </tr>
		</table>
	</div>
	<jsp:include page="../next_page.jsp" flush="false"></jsp:include>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
