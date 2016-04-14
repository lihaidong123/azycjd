<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="bar_div" style="margin-top: 20px; padding-bottom: 35px;">
	<ul id="bar_menu_0" class="bar_menu" id="index/my_infomation.jsp">
		<li><div id="anzhimember/findAnzhiMemberExperience.do#linenumber=${param.linenumber }">基本信息</div></li>
		<li><div id="anzhiheadimguserecord/findAnzhiHeadImgUseRecordMySelf.do#linenumber=${param.linenumber }">头像管理</div></li>
		<li><div id="index/my_infomation_my_info.jsp#linenumber=${param.linenumber }">个人资料</div></li>
		<li><div id="index/my_infomation_person_set.jsp#linenumber=${param.linenumber }">个性设置</div></li>
		<li><div id="index/my_infomation_realname.jsp#linenumber=${param.linenumber }">实名认证</div></li>
		<li><div id="index/writer_info_upd_pass.jsp#linenumber=${param.linenumber }">修改密码</div></li>
	</ul>
	
	<ul id="bar_menu_1" class="bar_menu" id="index/information_account.jsp">
		<li><div id="index/information_account_finance.jsp#linenumber=${param.linenumber }">财务中心</div></li>
		<li><div id="anzhirecharge/findMyAnzhiRechargeAll.do#linenumber=${param.linenumber }">充值记录</div></li>
		<li><div id="anzhiconsume/findAnzhiConsumeMySelf.do#linenumber=${param.linenumber }">消费记录</div></li>
	</ul>
	
	<ul id="bar_menu_2" class="bar_menu" id="index/home_page.jsp">
		<li><div id="anzhitrend/findAnzhiTrendMySelf.do#linenumber=${param.linenumber }">我的动态</div></li>
		<li><div id="anzhitrend/findAnzhiTrendMySelf.do#linenumber=${param.linenumber }#pageName=index/home_page_friend_activity">好友动态</div></li>
		<li><div id="anzhifriend/findMyFriendAll.do#linenumber=${param.linenumber }">好友管理</div></li>
	</ul>

	<ul id="bar_menu_3" class="bar_menu" id="index/my_comment.jsp">
		<li><div id="anzhicomment/findMyAnzhiCommentAll.do#linenumber=${param.linenumber }">我的评论</div></li>
		<li><div id="anzhicomment/findMyAnzhiCommentreplyAll.do#linenumber=${param.linenumber }">我的回复</div></li>
<%-- 		<li><div id="anzhinovelmultifunction/findAnzhiNovelMultifunctionMydianbook.do#linenumber=${param.linenumber }">我赞的书</div></li> --%>
	</ul>
	
	<ul id="bar_menu_4" class="bar_menu" id="index/my_news.jsp">
		<li><div id="anzhinews/findAnzhiNewsAll.do?pageName=index/my_news_system#newsType=1#index=4#chooseIndex=0#linenumber=${param.linenumber }">系统公告</div></li>
		<li><div id="anzhimessage/findAnzhiMessageAll.do#pageName=index/my_news_receive#linenumber=${param.linenumber }">收件箱</div></li>
		<li><div id="anzhimessage/findAnzhiMessageAll.do#pageName=index/my_news_send_all#linenumber=${param.linenumber }">已发送</div></li>
		<li><div id="index/my_news_send.jsp#linenumber=${param.linenumber }">写站内信</div></li>
	</ul>

	<ul id="bar_menu_5" class="bar_menu" id="index/writer_info.jsp">
		<li><div id="index/writer_info_basic.jsp#linenumber=${param.linenumber }">基本信息</div></li>
		<li><div id="index/writer_info_update.jsp#linenumber=${param.linenumber }">资料修改</div></li>
		<li><div id="index/writer_info_upd_pass.jsp#linenumber=${param.linenumber }">修改密码</div></li>
		<li><div id="anzhinovelmultifunction/findAnzhiNovelMultifunctionMyTuijian.do#linenumber=${param.linenumber }">推荐作品</div></li>
	</ul>

	<ul id="bar_menu_6" class="bar_menu" id="index/line_cave_bookmarks.jsp">
		<li><div id="anzhinovelmultifunction/findAnzhiNovelMultifunctionMyShoucang.do#linenumber=${param.linenumber }">我的收藏</div></li>
		<li><div id="anzhibookmark/findAnzhiBookmarkMySelf.do#linenumber=${param.linenumber }">我的书签</div></li>
	</ul>
	
	<ul id="bar_menu_7" class="bar_menu" id="index/line_myincome.jsp">
		<li><div id="anzhiconsume/findAnzhiConsumeMyCome.do#linenumber=${param.linenumber }">收入概况</div></li>
		<li><div id="anzhiconsume/findAnzhiConsumeMyDetail.do#linenumber=${param.linenumber }">收入明细</div></li>
	</ul>
	
	<ul id="bar_menu_8" class="bar_menu" id="index/line_newchapter.jsp">
		<li><div id="index/line_newchapter.jsp#linenumber=${param.linenumber }#novelId=${param.novelId }">写新章节</div></li>
		<li><div id="anzhifenjuan/findAnzhiFenJuanAll.do#linenumber=${param.linenumber }#novelId=${param.novelId }">管理分卷</div></li>
		<li><div id="anzhichapter/dingyuechaxu.do#linenumber=${param.linenumber }#novelId=${param.novelId }">订阅查询</div></li>
		<li><div id="anzhinovel/findAnzhiNovelById.do#linenumber=${param.linenumber }#pageName=index/update_novel#novelId=${param.novelId }">修改作品</div></li>
		<li><div id="anzhinovel/findAnzhiNovelManage.do#linenumber=${param.linenumber }#novelId=${param.novelId }">管理作品</div></li>
	</ul>
	
	<ul id="bar_menu_9" class="bar_menu" id="index/author_mail.jsp">
		<li><div id="anzhimessage/findAnzhiMessageAll.do#pageName=index/author_mail_receive#linenumber=${param.linenumber }">收件箱</div></li>
		<li><div id="anzhimessage/findAnzhiMessageAll.do#pageName=index/author_mail_send_all#linenumber=${param.linenumber }">已发送</div></li>
		<li><div id="index/author_mail_send.jsp#linenumber=${param.linenumber }">写站内信</div></li>
	</ul>
	
	<ul id="bar_menu_10" class="bar_menu" id="index/line_apply_sign.jsp">
		<li><div id="anzhinovel/findAnzhiNovelByMyziji.do#linenumber=${param.linenumber }">申请签约</div></li>
		<li><div id="anzhiauthor/fuliShenQin.do#linenumber=${param.linenumber }">申请福利</div></li>
	</ul>
</div>