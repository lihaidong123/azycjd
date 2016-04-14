<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	.webTableInfoTitle{text-align: right; padding-right:10px; color:#000000 !important; font-weight:bold;}
	.web_inf_table table{ border-collapse:collapse; font-size:13px; font-family:Arial, Helvetica, sans-serif;}
	.web_inf_table tr{ line-height:30px;}
	.web_inf_table td{ border:#dad8d8 1px solid; color:#8c8686; padding-left:7px;}
	.web_inf_table input{ width:60px; height:30px; line-height:30px;}
</style>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编基本信息
		</div>
	</div>
	<div style="background-color: #ffffff;padding: 5px;">
		<table width="100%">
			<tr>
				<td width="105">
					<img src="${loginWebEditorUser.editorHeadImg eq ''?'admin/images/web_default.png':loginWebEditorUser.editorHeadImg}" width="95" height="94">
				</td>
				<td valign="top" class="web_t_css">
					<div style="font-weight: bold;font-size: 15px;">${loginWebEditorUser.editorName}</div>
					<div style="font-family: '黑体';font-size: 14px; color: #918c8c;">网编编号:${loginWebEditorUser.editorNo}</div>
					<div style="font-family: '黑体';font-size: 14px; color: #918c8c;">备注说明:${loginWebEditorUser.editorVote}</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div style=" margin-top:30px;">
		<table width="100%" border="0">
		  <tr>
			<td width="76%" valign="top">
				<div class="web_inf_table" style="background-color:#FFFFFF; padding:9px; border-radius:5px;">
					<table width="100%" border="0">
					  <tr>
						<td class="webTableInfoTitle" width="15%">身份证号</td>
						<td width="35%">${loginWebEditorUser.editorCode}</td>
						<td class="webTableInfoTitle" width="15%">家庭住址</td>
						<td width="35%">${loginWebEditorUser.editorAddress}</td>
					  </tr>
					  <tr>
						<td class="webTableInfoTitle">联系电话</td>
						<td>${loginWebEditorUser.editorTel}</td>
						<td class="webTableInfoTitle">网编QQ</td>
						<td>${loginWebEditorUser.editorQq}</td>
					  </tr>
					  <tr>
						<td class="webTableInfoTitle">网编积分</td>
						<td>${loginWebEditorUser.editorScore}</td>
						<td class="webTableInfoTitle">网编级别</td>
						<td>${loginWebEditorUser.editorLevel}</td>
					  </tr>
					  <tr>
						<td class="webTableInfoTitle">网编届别</td>
						<td>${loginWebEditorUser.editorJiebie}</td>
						<td class="webTableInfoTitle">师傅名称</td>
						<td>${loginWebEditorUser.editorShifu}</td>
					  </tr>
					  <tr>
						<td class="webTableInfoTitle">添加时间</td>
						<td>${loginWebEditorUser.addTime}</td>
						<td colspan="2">
							<input class="goodsChangeCss" type="button" value="修改" onClick="window.location.href='<%=request.getContextPath() %>/admin/getHtmlEdit.jsp?needLoadJsp=webEditorInfo'"/>
							<c:if test="${not empty nosign }">
								<input class="buttonBtnCss" type="button" value="签到" style="margin-left: 20px;" onClick="qiandao(this)"/>
							</c:if>
						</td>
					  </tr>
				  </table>
				</div>
			</td>
			<td valign="middle" width="24%" style="padding-left: 15px;">
				<c:if test="${signDay eq ''}">
					<div id="div1"></div>
					<script>
						WdatePicker({eCont:'div1'});
					</script>
				</c:if>
				<c:if test="${signDay ne ''}">
					<div id="div1"></div>
					<script>
						WdatePicker({eCont:'div1',specialDates:[${signDay}]});
					</script>
				</c:if>
				<div style="color:#999999; font-size:12px; text-align:center; margin-top:7px;">签到时间表</div>
			</td>
		  </tr>
		</table>
	</div>
	
	<div style=" margin-top:25px;">
		<div style="background:url(admin/images/shuffle.png) no-repeat 15px 0px; padding-left:40px; font-size:14px; font-family:'黑体';">师徒关系</div>
		<div class="web_inf_table" style="background-color:#FFFFFF; margin-top:15px; padding:9px; border-radius:5px;">
			<table width="100%" border="0">
			  <c:forEach items="${tudiList }" var="s">
			  	<tr>
					<td class="webTableInfoTitle" width="15%">徒弟编号</td>
					<td width="35%">${s.editorNo }</td>
					<td class="webTableInfoTitle" width="15%">徒弟名称</td>
					<td width="35%">${s.editorName}</td>
				  </tr>
			  </c:forEach>
		  </table>
		</div>
	</div>
</div>