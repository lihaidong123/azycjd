<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<div class="formCss" id="day_registration_form">
	<div class="divTableCss">
		<div class="signTitleDiv">
			<div style="width: 50px;">序号</div>
			<div style="width: 120px;">状态</div>
			<div style="width: 380px;">作品名称</div>
			<div style="width: 150px;">操作</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">1</div>
			<div style="width: 120px;">已完结</div>
			<div style="width: 380px;">金麟岂是池中物</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请下架</div>
		 </div>
		 <form>
			 <div class="sqDiv" id="sqContent1">
			 	<div class="sqcontentone">申请内容</div>
			 	<div style="width: 65px;height:40px;line-height:40px;">申请理由：</div>
			 	<div style="width: 530px;">
			 		<textarea style="min-width: 480px;height: 100px;max-height: 110px;max-width: 510px;" placeholder="请输入签约申请理由"></textarea>
			 	</div>
			 	<div style="float:left;margin-top:10px;">
			 		<input type="button" value="提交" class="saveBtnCss">
			 	</div>
			 	<div onclick="closeSign('1')" style="float:left;margin-top:10px;">
			 		<input type="button" value="关闭" class="resetBtnCss">
			 	</div>
			 </div>
		 </form>
		 <div class="signContentDiv">
			<div style="width: 50px;">2</div>
			<div style="width: 120px;">已完结</div>
			<div style="width: 380px;">金麟岂是池中物</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请下架</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">3</div>
			<div style="width: 120px;">已完结</div>
			<div style="width: 380px;">金麟岂是池中物</div>
			<div style="width: 150px;cursor: pointer;"  class="sqqy">申请下架</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">4</div>
			<div style="width: 120px;">已完结</div>
			<div style="width: 380px;">金麟岂是池中物</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请下架</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">5</div>
			<div style="width: 120px;">已完结</div>
			<div style="width: 380px;">金麟岂是池中物</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请下架</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">6</div>
			<div style="width: 120px;">已完结</div>
			<div style="width: 380px;">金麟岂是池中物</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请下架</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">7</div>
			<div style="width: 120px;">已完结</div>
			<div style="width: 380px;">金麟岂是池中物</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请下架</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">8</div>
			<div style="width: 120px;">已完结</div>
			<div style="width: 380px;">金麟岂是池中物</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请下架</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">9</div>
			<div style="width: 120px;">已完结</div>
			<div style="width: 380px;">金麟岂是池中物</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请下架</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">10</div>
			<div style="width: 120px;">已完结</div>
			<div style="width: 380px;">金麟岂是池中物</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请下架</div>
		 </div>
	</div>
	<jsp:include page="../next_page.jsp" flush="false"></jsp:include>
</div>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
