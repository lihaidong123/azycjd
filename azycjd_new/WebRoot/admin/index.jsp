<%@page import="com.anzhi.web.pojo.AnzhiMember"%>
<%@page import="com.anzhi.web.pojo.AnzhiWebEditor"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
if(session.getAttribute("loginUsers")==null&&session.getAttribute("loginWebEditorUser")==null){
	%>
	<script type="text/javascript">
		window.location.href="<%=request.getContextPath() %>/index.html";
	</script>
	<%
	return;
}
if(session.getAttribute("loginUsers")!=null){
	AnzhiMember am=(AnzhiMember)session.getAttribute("loginUsers");
	if(!am.getMemberType().equals(2)){
		%>
		<script type="text/javascript">
			window.location.href="<%=request.getContextPath() %>/index.html";
		</script>
		<%
		return;
	}
}
if(session.getAttribute("loginWebEditorUser")!=null){
	AnzhiWebEditor am=(AnzhiWebEditor)session.getAttribute("loginWebEditorUser");
	
}
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>安之小说后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/admin.css"/>
	<c:if test="${not empty loginUsers }">
		<script language="javascript">var nowFlag=1;</script>
	</c:if>
	<c:if test="${not empty loginWebEditorUser }">
		<script language="javascript">var nowFlag=2;</script>
	</c:if>
	<script language="javascript">var path="<%=path %>";</script>
	<script language="javascript">var loadFirst="${thirdRecommand}${webEditorInfoAction}${cooperationn}${pictureAction}${newsAction}${AnzhiWebEditorWorkAction}${AnzhiWebEditorAction}${AnzhiWebEditorGoodsAction}${webEditorInfo}${novelAction}";</script>
	<script language="javascript" src="<%=path %>/js/jquery.js"></script>
	<script language="javascript" src="<%=path %>/js/azycjd.js"></script>
	<script language="javascript" src="<%=path %>/admin/js/admin.js"></script>
	<script language="javascript" src="<%=path %>/index/js/My97DatePicker/WdatePicker.js"></script>
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
	<script language="javascript">
		$(function(){
			$(".top_menu div").each(function(){
				$(this).css("background","url(admin/images/"+$(this)[0].id+") no-repeat 37px 25px");
			});
			
			$(".menu_items div").click(function(){
				$(".menu_items div").each(function(){
					$(this).removeClass("menu_items_div_click");
				});
				$(this).addClass("menu_items_div_click");
				if($(this)[0].id!=""){
					allLoadPage(path+"/"+$(this)[0].id);
				}
			});
			
			$(".top_menu div").click(function(){
				var index=$(".top_menu div").index($(this));
				$(".menu_items div").each(function(){
					$(this).removeClass("menu_items_div_click");
				});
				changeMenu(index,$(this).html(),true);
			});
			if(loadFirst==''){
				if(nowFlag==1){
					changeMenu(0,"网站管理",true);
				}else if(nowFlag==2){
					changeMenu(0,"个人记录查询",true);
				}
			}
			$($(".top_menu div")[0]).css("background","url(admin/images/"+$(".top_menu div")[0].id+") no-repeat 37px 25px #ffffff").css("color","#1998d5");
			//加载需要处理的信息
			loadNeedDoTaskNum();
		});
		
		function loadNeedDoTaskNum(){
			$.post(path+"/anzhinovel/loadNeedDoTaskNum.do",null,function(res){
				var json=eval('(' + res + ')'); 
				var t=json.data;
				for(var i=0;i<t.length;i++){
					var tmp=t[i];
					if(parseInt(tmp.nums)!=0){
						var st=document.getElementById(tmp.domId);
						if(parseInt(tmp.nums)>9){
							try{
								st.innerHTML=st.innerHTML+"<span style='padding-left: 4px;' class='need_do_nums_class'>"+tmp.nums+"</span>";
							}catch(e){}
						}else{
							try{
								st.innerHTML=st.innerHTML+"<span style='padding-left: 7px;' class='need_do_nums_class'>"+tmp.nums+"</span>";
							}catch(e){}
						}
					}
				}
			});
		}
		
		/*
			index显示索引
			nowPositionDiv显示当前位置文字
			needLoadFirstData是否需要加载第一条记录
			showDivMenu将已经显示的menu设为选中项
		*/
		function changeMenu(index,nowPositionDiv,needLoadFirstData,showDivMenu){
			var menu_indexs=0;
			$(".menu_items div").each(function(){
				if($(this)[0].className.indexOf("menu_item_"+index)!=-1){
					if(menu_indexs==0){
						menu_indexs++;
						if($(this)[0].id!=""&&needLoadFirstData==true){
							allLoadPage(path+"/"+$(this)[0].id);
						}
						$(this).addClass("menu_items_div_click");
					}
					$(this)[0].style.display="block";
				}else{
					$(this)[0].style.display="none";
				}
			});
			$(".top_menu div").each(function(){
				$(this).css("background","url(admin/images/"+$(this)[0].id+") no-repeat 37px 25px").css("color","#ffffff");
			});
			$($(".top_menu div")[index]).css("background","url(admin/images/"+$($(".top_menu div")[index])[0].id+") no-repeat 37px 25px #ffffff").css("color","#1998d5");
			$("#nowPositionDiv").html(nowPositionDiv);
			if(showDivMenu){
				var dddindex=0;
				$(".menu_items div").each(function(){
					if($(this)[0].style.display=="block"){
						if(dddindex==showDivMenu){
							$(this).addClass("menu_items_div_click");
						}else{
							$(this).removeClass("menu_items_div_click");
						}
						dddindex++;
					}
				});
			}
		}
	</script>
  </head>
  
  <body id="body_index" style="margin:0px; padding:0px; background-color:#f0f0f0;">
    	<div style="background-color:#333333; height:100px;">
			<div class="main_div">
				<div style="float:left;padding-top:20px;">
					<img src="admin/images/logo.png"/>
				</div>
				<div class="admin_top_right" style="float:right;padding-top:25px;">
					<div style=" padding-left:20px;">欢迎您：
						<c:if test="${not empty loginUsers }">${loginUsers.memberNick }</c:if>
						<c:if test="${not empty loginWebEditorUser }">${loginWebEditorUser.editorName }</c:if>
					</div>
					<div style="background:url(admin/images/Free_Home.png) no-repeat 5px 7px; padding-left:40px;cursor: pointer;" onClick="window.location.href='<%=request.getContextPath()%>/index.html'">返回首页</div>
					<div style="background:url(admin/images/Free_Gear.png) no-repeat 5px 7px; padding-left:40px;cursor: pointer;" onClick="window.location.href='<%=request.getContextPath()%>/anzhi/adminOutSystem.do'">退出系统</div>
				</div>
			</div>
		</div>
		<div style="background-image:url(<%=request.getContextPath()%>/admin/images/adminbg.png);background-repeat:repeat-x; height:100px;">
			<c:if test="${loginUsers.memberType eq 2 ||not empty loginWebEditorUser}">
				<div class="main_div">
					<div style="position:absolute;  margin-top:-3px;">
						<table width="100%" border="0">
						  <tr>
							<td valign="top" width="200">
								<div style="background-color:#FFFFFF; font-family:'黑体'; font-size:16px; letter-spacing:2px;">
									<div id="nowPositionDiv" style="height:100px; font-weight:bold; border-bottom:#CCCCCC 1px solid; width:90%; margin:0 auto; text-align:center; line-height:100px;background:url(<%=request.getContextPath()%>/admin/images/liandian.png) no-repeat 0px 43px; ">书籍管理</div>
									<div id="menu_items" class="menu_items" style="padding-top:5px; min-height:800px;">
										<c:if test="${not empty loginUsers }">
											<div id="anzhirecommend/findAnzhiRecommendAll.do" class="menu_item_0">推荐位管理</div>
											<div id="anzhiillegalchar/findAnzhiIllegalCharAll.do" class="menu_item_0">违法关键字管理</div>
											<!-- <div id="" class="menu_item_0">栏目管理</div> -->
											<div id="anzhinews/findAnzhiNewsAll.do" class="menu_item_0">公告管理</div>
											<div id="anzhicooperation/findAnzhiCooperationAll.do" class="menu_item_0">合作渠道链接</div>
											<div id="anzhidiscounted/findAnzhiDiscountedAll.do" class="menu_item_0">优惠书坊管理</div>
											<div id="anzhipicture/findAnzhiPictureAll.do" class="menu_item_0">图片管理</div>
											<div id="anzhiothercontent/findAnzhiOtherContentAll.do" class="menu_item_0">网站相关信息管理</div>
											<div id="anzhicomment/pinglunguanli.do" class="menu_item_0">评论管理</div>
											<div id="anzhinovellabel/findAnzhiNovelLabelAll.do" class="menu_item_0">小说标签管理</div>
											<div id="anzhiinteractive/findAnzhiInteractiveAll.do" class="menu_item_0">互动专区管理</div>
											<div id="anzhinovel/findAnzhiNovelAll.do" class="menu_item_1">书籍管理</div>
											<div id="anzhireport/findAnzhiReportAll.do" class="menu_item_1">举报审核</div>
											<div id="anzhichapter/nopassCheck.do" class="menu_item_1">未通过章节审核</div>
											<!-- <div id="anzhinovel/delNovelCheck.do" class="menu_item_1">作者删文审核</div> -->
											<div id="anzhichapter/delChapterCheck.do" class="menu_item_1">作者删章节审核</div>
											<div id="anzhimessage/findAnzhiMessageAll.do" class="menu_item_1">站内信管理</div>
											<div id="anzhinovel/signedManage.do" class="menu_item_1">签约书籍管理</div>
											<div id="anzhithirdrecommand/findAnzhiThirdRecommandAll.do" class="menu_item_1">平台收录</div>
											<div id="anzhiauthor/findAnzhiAuthorAll.do" class="menu_item_2">作者信息管理</div>
											<div id="anzhinovel/signedCheck.do" class="menu_item_2">作品签约申请管理</div>
											<!-- <div id="anzhiauthor/signedCheck.do" class="menu_item_2">作者签约申请管理</div>  确定不要了-->
											<div id="anzhinovel/novelUpCheck.do" class="menu_item_2">作品平台上架申请管理</div>
											<div id="anzhinovel/novelDownCheck.do" class="menu_item_2">作品自主下架申请管理</div>
											<div id="anzhibenefit/findAnzhiBenefitAll.do" class="menu_item_2">作者福利申请管理</div>
											<div id="anzhicash/findAnzhiCashAll.do" class="menu_item_2">作者提现申请管理</div>
											<div id="anzhinovel/novelTitleUpdateCheck.do" class="menu_item_2">作者修改作品名称审核</div>
											<div id="anzhimember/findAnzhiMemberAll.do" class="menu_item_3">会员信息管理</div>
											<div id="anzhirecharge/findAnzhiRechargeAll.do" class="menu_item_3">会员充值记录</div>
											<div id="anzhiconsume/findAnzhiConsumeAll.do" class="menu_item_3">会员消费记录</div>
											<div id="anzhiexperiencerecord/findAnzhiExperienceRecordAll.do" class="menu_item_3">会员每日任务</div>
											<div id="anzhiwebeditor/findAnzhiWebEditorAll.do" class="menu_item_4">网编信息管理</div>
											<div id="anzhiwebeditorauthor/findAnzhiWebEditorAuthorAll.do?isSigned=0" class="menu_item_4">网编驻站记录管理</div>
											<div id="anzhiwebeditorauthor/findAnzhiWebEditorAuthorAll.do?isSigned=1" class="menu_item_4">网编签约记录管理</div>
											<div id="anzhiwebeditortuijian/findAnzhiWebEditorTuijianAll.do" class="menu_item_4">网编推文记录管理</div>
											<div id="anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll.do" class="menu_item_4">网编福利申请管理</div>
											<div id="anzhiwebeditorgoods/findAnzhiWebEditorGoodsAll.do" class="menu_item_4">礼品管理</div>
											<div id="anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll.do" class="menu_item_4">积分兑换申请管理</div>
											<div id="anzhiwebeditorwork/findAnzhiWebEditorWorkAll.do" class="menu_item_4">网编作业审核</div>
											<div id="anzhiwebeditorapply/findAnzhiWebEditorApplyAll.do" class="menu_item_4">网编申请管理</div>
											<div id="anzhiwebeditormessage/findAnzhiWebEditorMessageAll.do" class="menu_item_4">短信预编设置</div>
											<div id="admin/jiekou.jsp" class="menu_item_5">第三方平台接口一览表</div>
											<div id="anzhichaptersubscribe/income.do" class="menu_item_6">收益查询</div>
										</c:if>
										<c:if test="${not empty loginWebEditorUser }">
											<div id="anzhiwebeditorauthor/findAnzhiWebEditorAuthorAll.do?isSigned=0" class="menu_item_1">网编驻站记录</div>
											<div id="anzhiwebeditorauthor/findAnzhiWebEditorAuthorAll.do?isSigned=1" class="menu_item_1">网编签约记录</div>
											<div id="anzhiwebeditortuijian/findAnzhiWebEditorTuijianAll.do" class="menu_item_1">网编推文记录</div>
											<div id="anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll.do" class="menu_item_1">网编福利申请</div>
											<div id="anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll.do" class="menu_item_1">积分兑换申请</div>
											<div id="anzhiwebeditorwork/findAnzhiWebEditorWorkAll.do" class="menu_item_1">网编作业</div>
											<div id="anzhiwebeditormessage/findAnzhiWebEditorMessageAll.do" class="menu_item_1">短信预编设置</div>
											
											<c:if test="${loginWebEditorUser.editorLevel ne '实习' }">
												<div id="anzhicomment/pinglunguanli.do" class="menu_item_1">评论管理</div>
												<div id="anzhireport/findAnzhiReportAll.do" class="menu_item_1">举报审核</div>
												<div id="anzhichapter/nopassCheck.do" class="menu_item_1">未通过章节审核</div>
												<c:if test="${loginWebEditorUser.editorLevel ne 'C级' }">
													<div id="anzhinovel/novelUpCheck.do" class="menu_item_1">作品自主上架申请管理</div>
												</c:if>
											</c:if>
											<div id="anzhiwebeditor/webEditorTableInfo.do" class="menu_item_0">网编个人信息</div>
											<div id="admin/fuliInfo.jsp" class="menu_item_0">网编福利体系</div>
											<div id="admin/getHtmlEdit.jsp?needLoadJsp=AnzhiWebEditorWorkAction" class="menu_item_0">网编作业汇报</div>
											<div id="anzhiwebeditorgoods/goodsChange.do" class="menu_item_0">积分兑换</div>
											<div id="anzhiwebeditorauthor/cuigeng.do" class="menu_item_0">编辑催更</div>
											<div id="anzhiwebeditorauthor/anzhiwebeditorauthorAction.do" class="menu_item_0">作品信息报备</div>
											<div id="anzhiwebeditortuijian/anzhiwebeditortuijianAction.do" class="menu_item_0">推文链接报备</div>
											<div id="anzhiwebeditorfuliapply/anzhiwebeditorfuliapplyAction.do" class="menu_item_0">申请福利</div>
											<div id="admin/webEditorUpdatePass.jsp" class="menu_item_0">密码修改</div>
										</c:if>
									</div>
								</div>
							</td>
							<td valign="top" width="880">
								<div class="top_menu" style="padding-left: 30px;">
									<c:if test="${not empty loginUsers }">
										<div id="web_mac.png">网站管理</div>
										<div id="shuji.png">书籍管理</div>
										<div id="zuojia.png">作家管理</div>
										<div id="huiyuan.png">会员管理</div>
										<div id="wangbian.png">网编管理</div>
										<div id="hezuopingtai.png">合作平台</div>
										<div id="wangzhanshouyi.png">网站收益</div>	
									</c:if>
									<c:if test="${not empty loginWebEditorUser }">
										<div id="huiyuan.png">网编管理</div>
										<div id="wangbian.png">个人记录查询</div>
									</c:if>
								</div>
								<div id="mainContent" style="padding: 10px; clear: both;">
									<c:if test="${not empty cooperationn }">
										<jsp:include page="AnzhiCooperationAction.jsp"></jsp:include>
										<c:remove var="cooperationn"/>
										<script language="javascript">
											$(function(){
												changeMenu(0,"网站管理",false,3);
											});
										</script>
									</c:if>
									<c:if test="${not empty thirdRecommand }">
										<jsp:include page="AnzhiThirdRecommandAction.jsp"></jsp:include>
										<c:remove var="thirdRecommand"/>
										<script language="javascript">
											$(function(){
												changeMenu(1,"书籍管理",false,6);
											});
										</script>
									</c:if>
									<c:if test="${not empty pictureAction }">
										<jsp:include page="AnzhiPictureAction.jsp"></jsp:include>
										<c:remove var="pictureAction"/>
										<script language="javascript">
											$(function(){
												changeMenu(0,"网站管理",false,5);
											});
										</script>
									</c:if>
									<c:if test="${not empty novelAction }">
										<jsp:include page="AnzhiNovelAction.jsp"></jsp:include>
										<c:remove var="novelAction"/>
										<script language="javascript">
											$(function(){
												changeMenu(1,"书籍管理",false,0);
											});
										</script>
									</c:if>
									<c:if test="${not empty newsAction }">
										<jsp:include page="AnzhiNewsAction.jsp"></jsp:include>
										<c:remove var="newsAction"/>
										<script language="javascript">
											$(function(){
												changeMenu(0,"网站管理",false,2);
											});
										</script>
									</c:if>
									<c:if test="${not empty AnzhiWebEditorWorkAction }">
										<jsp:include page="AnzhiWebEditorWorkAction.jsp"></jsp:include>
										<c:remove var="AnzhiWebEditorWorkAction"/>
										<script language="javascript">
											$(function(){
												changeMenu(0,"个人记录查询",false,2);
											});
										</script>
									</c:if>
									<c:if test="${not empty AnzhiWebEditorAction }">
										<jsp:include page="AnzhiWebEditorAction.jsp"></jsp:include>
										<c:remove var="AnzhiWebEditorAction"/>
										<script language="javascript">
											$(function(){
												changeMenu(4,"网编管理");
											});
										</script>
									</c:if>
									<c:if test="${not empty AnzhiWebEditorGoodsAction }">
										<jsp:include page="AnzhiWebEditorGoodsAction.jsp"></jsp:include>
										<c:remove var="AnzhiWebEditorGoodsAction"/>
										<script language="javascript">
											$(function(){
												changeMenu(4,"网编管理",false,5);
											});
										</script>
									</c:if>
									<c:if test="${not empty webEditorInfoAction }">
										<jsp:include page="AnzhiWebEditorAction.jsp"></jsp:include>
										<c:remove var="webEditorInfoAction"/>
										<script language="javascript">
											$(function(){
												changeMenu(4,"网编管理",false,0);
											});
										</script>
									</c:if>
									<c:if test="${not empty webEditorInfo }">
										<jsp:include page="webEditorInfo.jsp"></jsp:include>
										<c:remove var="webEditorInfo"/>
										<script language="javascript">
											$(function(){
												changeMenu(0,"网编后台");
											}); 
										</script>
									</c:if>
								</div>
							</td>
						  </tr>
						</table>
					</div>
				</div>
			</c:if>
		</div>
  </body>
</html>
