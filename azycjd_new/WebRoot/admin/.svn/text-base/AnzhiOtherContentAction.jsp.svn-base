<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="htmlEditAdmin.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网站相关信息操作
		</div>
	</div>
	<form id="AnzhiOtherContentFormAction" action="<%=request.getContextPath()%>/anzhiothercontent/addAnzhiOtherContent.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem">
				<p>关于我们：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="abotus" name="abotus">${pojo.abotus}</textarea></p>
			</div>
			<div class="textItem">
				<p>用户指南：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="yonghuzhinan" name="yonghuzhinan">${pojo.yonghuzhinan}</textarea></p>
			</div>
			<div class="textItem">
				<p>诚聘英才：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="chengpinyingcai" name="chengpinyingcai">${pojo.chengpinyingcai}</textarea></p>
			</div>
			<div class="textItem">
				<p>联系我们：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="lianxiwomen" name="lianxiwomen">${pojo.lianxiwomen}</textarea></p>
			</div>
			<div class="textItem">
				<p>编辑专区：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="bianjizhuanqu" name="bianjizhuanqu">${pojo.bianjizhuanqu}</textarea></p>
			</div>
			<div class="textItem">
				<p>版权维护：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="banquanweihu" name="banquanweihu">${pojo.banquanweihu}</textarea></p>
			</div>
			<div class="textItem">
				<p>网站签约福利：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="wangzhanqianyuefuli" name="wangzhanqianyuefuli">${pojo.wangzhanqianyuefuli}</textarea></p>
			</div>
			<div class="textItem">
				<p>原创买断福利：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="yuanchuangmaiduanfuli" name="yuanchuangmaiduanfuli">${pojo.yuanchuangmaiduanfuli}</textarea></p>
			</div>
			<div class="textItem">
				<p>平台签约福利：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="pingtaiqianyuefuli" name="pingtaiqianyuefuli">${pojo.pingtaiqianyuefuli}</textarea></p>
			</div>
			<div class="textItem">
				<p>安之作家培训：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="anzhizuojiapeixun" name="anzhizuojiapeixun">${pojo.anzhizuojiapeixun}</textarea></p>
			</div>
			<div class="textItem">
				<p>活动专区：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="huodongzhuanqu" name="huodongzhuanqu">${pojo.huodongzhuanqu}</textarea></p>
			</div>
			<input type="hidden" name="zuozhetougao" value=""/>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiOtherContentFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
