<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<jsp:include page="checkNovelId.jsp" flush="false"></jsp:include>
<script type="text/javascript">
	$(function(){
		$.post(path+"/anzhiillegalchar/checkFeiFa.do",null,function(res){
			var json=eval('(' + res + ')'); 
			feiFaCharArr=json.data;
			$("#fabu_div_group").css("display","block");
		});
	});
	var stateType=0;
	var dingshi=false;
	function saveChapter(obj){
		var reg=/^\d{1,8}$/;
		if(!reg.test($("#fenJuanId").val())){
			alert("请选择分卷！");
			return;
		}
		if(stateType==1){
			if(parseInt($("#chapterCharNum").val())<1000){
				alert("当前章节还没有1000字，不能发表！");
				return;
			}
		}
		if(!checkFeiFa($("#chapterContent").val())){
			return;
		}
		if(stateType==1){
			if(dingshi){
				stateType=2;
				if(!confirm("您选择的是定时发布，确定继续发布吗？")){
					return;
				}
				$("#state").val(2);
			}else{
				if(!confirm("您选择的是立即发布，确定继续发布吗？")){
					return;
				}
				$("#state").val(1);
			}
		}
		ajaxFormSubmit('day_chapter_form',obj);
	}
</script>
<form class="formCss" id="day_chapter_form" action="<%=request.getContextPath() %>/anzhichapter/addAnzhiChapter.do?linenumber=11&&index=8&&chooseIndex=1" method="post">
	<div>
		<input type="hidden" id="chapterCharNum" name="chapterCharNum" value="${pojo.chapterCharNum }">
		<input type="hidden" id="id" name="id" value="${pojo.id }">
		<input type="hidden" id="novelId" name="novelId" value="${param.novelId }">
		<input type="hidden" id="state" name="state" value="${pojo.state }">
		<div class="divItemsCss">所在分卷:
			<input type="text" style="width:370px;" class="selectTxtCss" id="fenJuanIdInput" name="fenJuanIdInput" value="${pojo.fenJuanId }">
		</div>
		<div class="divItemsCss">章节名称:
			<input type="text" class="txtCss" id="chapterTitle" name="chapterTitle" value="${pojo.chapterTitle }">
		</div>
		<div class="divItemsCss" id="dabusijian" style="display:none;">发布时间:
			<c:if test="${empty pojo }">
				<input type="text" class="txtCss" style="width: 35px;" class="Wdate" readonly="readonly" onClick="WdatePicker({dateFmt:'MM'})" id="yue" name="yue" value="<%=new SimpleDateFormat("MM").format(new Date())%>">月
				<input type="text" class="txtCss" style="width: 35px;" class="Wdate" readonly="readonly" onClick="WdatePicker({dateFmt:'dd'})" id="tian" name="tian" value="<%=new SimpleDateFormat("dd").format(new Date())%>">日
				<input type="text" class="txtCss" style="width: 35px;" class="Wdate" readonly="readonly" onClick="WdatePicker({dateFmt:'HH'})" id="dian" name="dian" value="<%=new SimpleDateFormat("HH").format(new Date())%>">时
				<input type="text" class="txtCss" style="width: 35px;" class="Wdate" readonly="readonly" onClick="WdatePicker({dateFmt:'mm'})" id="fen" name="fen" value="<%=new SimpleDateFormat("mm").format(new Date())%>">分
			</c:if>
			<c:if test="${not empty pojo }">
				<input type="text" class="txtCss" style="width: 35px;" class="Wdate" readonly="readonly" onClick="WdatePicker({dateFmt:'MM'})" id="yue" name="yue" value="<fmt:formatDate value="${pojo.addTime}" pattern="MM"/>">月
				<input type="text" class="txtCss" style="width: 35px;" class="Wdate" readonly="readonly" onClick="WdatePicker({dateFmt:'dd'})" id="tian" name="tian" value="<fmt:formatDate value="${pojo.addTime}" pattern="dd"/>">日
				<input type="text" class="txtCss" style="width: 35px;" class="Wdate" readonly="readonly" onClick="WdatePicker({dateFmt:'HH'})" id="dian" name="dian" value="<fmt:formatDate value="${pojo.addTime}" pattern="HH"/>">时
				<input type="text" class="txtCss" style="width: 35px;" class="Wdate" readonly="readonly" onClick="WdatePicker({dateFmt:'mm'})" id="fen" name="fen" value="<fmt:formatDate value="${pojo.addTime}" pattern="mm"/>">分
			</c:if>
			<input type="button" value="发布" class="saveBtnCss" style="width: 80px;background-color:#3dbae8 !important;" onclick="javascript:dingshi=true;stateType=1;saveChapter(this)">
		</div>
		<!-- <div class="divItemsCss" id="fabuanniu" style="float:left;margin-top: 20px;margin-bottom: 20px;display: none;">
			<input type="button" value="发布" class="saveBtnCss" onclick="javascript:stateType=2;saveChapter(this)">
		</div> -->
		<div class="divItemsCss" style="clear:both;">
			<p>章节内容:</p>
			<p><textarea class="htmlEditCss" style="height:580px;" id="chapterContent" name="chapterContent">${pojo.chapterContent }</textarea></p>
		</div>
		<div class="divItemsCss"  id="fabu_div_group" style="display: none;">
			<c:if test="${empty pojo }">
				<input type="button" value="立即发布" class="saveBtnCss" onclick="javascript:stateType=1;dingshi=false;saveChapter(this);">
				<input type="button" value="定时发布" class="buttonBtnCss" onclick="javascript:$('#dabusijian').slideToggle();$('#fabuanniu').slideToggle();if(dingshi){dingshi=false;}else{dingshi=true;$(window).scrollTop(0);}">
				<input type="button" value="存草稿箱" class="resetBtnCss" onclick="javascript:stateType=0;saveChapter(this);">
			</c:if>
			<c:if test="${not empty pojo }">
				<input type="button" value="确定修改" class="resetBtnCss" onclick="javascript:stateType=0;saveChapter(this)">
				<input type="button" value="立即发布" class="saveBtnCss" onclick="javascript:stateType=1;dingshi=false;saveChapter(this)">
				<input type="button" value="定时发布" class="buttonBtnCss" onclick="javascript:$('#dabusijian').slideToggle();$('#fabuanniu').slideToggle();if(dingshi){dingshi=false;}else{dingshi=true;$(window).scrollTop(0);}">
			</c:if>
			
			<span id="totalcharnum" style=" margin-left: 30px;"></span>
			<input type="hidden" id="totalcharnumHidden" value="0">
		</div> 
		</div>
</form>
<c:if test="${not empty pojo && pojo.state eq 2 }">
	<script type="text/javascript">
		dingshi=true;
		$('#dabusijian').slideToggle();
	</script>
</c:if>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>