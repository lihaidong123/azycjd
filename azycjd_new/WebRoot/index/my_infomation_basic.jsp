<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.anzhi.web.util.UtilData"%>
<%@page import="com.anzhi.web.pojo.AnzhiMember"%>
<%@page import="com.anzhi.web.util.GetCondition"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="my_information">
		<div>
			<div class="divItemsCss"><font style="padding-left:21px;">用户昵称：</font>${loginUsers.memberNick }</div>
			<div class="divItemsCss"><font style="padding-left:63px;">QQ：</font>${loginUsers.memberQq }</div>
			<div class="divItemsCss">
				<table width="100%" border="0">
				  <tr>
					<td width="13%" align="right">用户等级：</td>
					<td width="10%">
						<div style="background:url(<%=request.getContextPath()%>/index/images/user_lvl.png) 1px 2px no-repeat; font-size:12px; line-height:26px; width:44px; height:26px; color:#FFFFFF; font-weight:bold; padding-left:30px;">LV ${duzheLv }</div>
					</td>
					<td width="50%">
						<div style="background-color:#c5c8c9;">
							<div style="width:340px;height:25px; line-height:25px; color:#FFFFFF; text-align:center; position:absolute;">成长值&nbsp;&nbsp;${loginUsers.memberExperience}/${endJinYan}</div>
							<div style="width:${(loginUsers.memberExperience/endJinYan)*100 }%; background-color:#4aa0d9; height:25px;"></div>
						</div>
					</td>
					<td width="27%" align="center"><a href="javascript:loadIntroduceJsp('index/introduce/user_level.jsp','用户等级体系')">查看用户等级体系</a></td>
				  </tr>
				</table>
			</div>
			<div class="divItemsCss">
				<table width="100%" border="0">
				  <tr>
					<td width="13%" align="right">VIP等级：</td>
					<td width="10%">
						<div style="background:url(<%=request.getContextPath()%>/index/images/vip_lvl.png) 1px 2px no-repeat; font-size:12px; line-height:26px; width:44px; height:26px; color:#FFFFFF; font-weight:bold; padding-left:30px;">${vipInfo.vipName }</div>
					</td>
					<td width="50%">
						<div style="background-color:#c5c8c9;">
							<div style="width:340px;height:25px; line-height:25px; color:#FFFFFF; text-align:center; position:absolute;">成长值&nbsp;&nbsp;${vipInfo.anzhibi }/${vipInfo.endLevelAnzhibi }</div>
							<div style="width:${(vipInfo.anzhibi/vipInfo.endLevelAnzhibi)*100 }%; background-color:#ee271d; height:25px;"></div>
							
						</div>
					</td>
					<td width="27%" align="center"><a href="javascript:loadIntroduceJsp('index/introduce/vip_level.jsp','VIP等级体系')">查看VIP等级体系</a></td>
				  </tr>
				</table>
			</div>
			<div class="divItemsCss"><font style="padding-left:20px;">月票数量：</font>本月已投${yuepiaoYiTou }张，剩余${yuepiaoNum-yuepiaoYiTou }张<font class="a_css"><a href="javascript:loadIntroduceJsp('index/introduce/yuepiao_more.jsp','如何获得更多月票数量')">如何获得更多</a></font></div>
			<div class="divItemsCss"><font style="padding-left:8px;">推荐票数量：</font>本月已推荐${yetTuiJianPiao }张，剩余${remainTuiJianPiao }张<font class="a_css"><a href="javascript:loadIntroduceJsp('index/introduce/tuijian_more.jsp','如何获得更多推荐月票数量')">如何获得更多</a></font></div>
			<div class="divItemsCss"><font style="padding-left:36px;">藏书量：</font>共500本，已用${cangshuNum }本<font class="a_css"><a href="javascript:getJspDataByUrl('anzhinovelmultifunction/findAnzhiNovelMultifunctionMyShoucang.do#linenumber=3#index=6#chooseIndex=0')">进入我的书架</a></font></div>
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>