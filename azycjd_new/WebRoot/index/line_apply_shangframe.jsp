<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<form class="formCss" id="day_registration_form">
	<div class="divTableCss">
		<div class="signTitleDiv">
			<div style="width: 50px;">序号</div>
			<div style="width: 70px;">状态</div>
			<div style="width: 300px;">作品名称</div>
			<div style="width: 50px;">字数</div>
			<div style="width: 70px;">网站</div>
			<div style="width: 70px;">平台</div>
			<div style="width: 100px;">操作</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">1</div>
			<div style="width: 70px;">已完结</div>
			<div style="width: 300px;">金麟岂是池中物</div>
			<div style="width: 50px;">7876</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 100px;">字数不够</div>
		 </div>
		 <div class="signContentDiv">
			<div style="width: 50px;">2</div>
			<div style="width: 70px;">已完结</div>
			<div style="width: 300px;">金麟岂是池中物</div>
			<div style="width: 50px;">7876</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 100px;">字数不够</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">3</div>
			<div style="width: 70px;">已完结</div>
			<div style="width: 300px;">金麟岂是池中物</div>
			<div style="width: 50px;">7876</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 100px;">字数不够</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">4</div>
			<div style="width: 70px;">已完结</div>
			<div style="width: 300px;">金麟岂是池中物</div>
			<div style="width: 50px;">7876</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 100px;">字数不够</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">5</div>
			<div style="width: 70px;">已完结</div>
			<div style="width: 300px;">金麟岂是池中物</div>
			<div style="width: 50px;">7876</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 100px;">字数不够</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">6</div>
			<div style="width: 70px;">已完结</div>
			<div style="width: 300px;">金麟岂是池中物</div>
			<div style="width: 50px;">7876</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 100px;">字数不够</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">7</div>
			<div style="width: 70px;">已完结</div>
			<div style="width: 300px;">金麟岂是池中物</div>
			<div style="width: 50px;">87876</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 100px;cursor:pointer;"><a onclick="return confirm('确定提交吗？?')">提交</a></div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">8</div>
			<div style="width: 70px;">已完结</div>
			<div style="width: 300px;">金麟岂是池中物</div>
			<div style="width: 50px;">97876</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 100px;cursor:pointer;"><a onclick="return confirm('确定提交吗？?')">提交</a></div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">9</div>
			<div style="width: 70px;">已完结</div>
			<div style="width: 300px;">金麟岂是池中物</div>
			<div style="width: 50px;">77876</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 100px;cursor:pointer;"><a onclick="return confirm('确定提交吗？?')">提交</a></div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 50px;">10</div>
			<div style="width: 70px;">已完结</div>
			<div style="width: 300px;">金麟岂是池中物</div>
			<div style="width: 50px;">78978</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 70px;margin-top:10px;">
				<input type="checkbox"/>
			</div>
			<div style="width: 100px;cursor:pointer;"><a onclick="return confirm('确定提交吗？?')">提交</a></div>
		 </div>
	</div>
	<jsp:include page="../next_page.jsp" flush="false"></jsp:include>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
