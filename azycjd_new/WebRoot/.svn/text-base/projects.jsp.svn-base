<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="top.jsp"></jsp:include>

<jsp:include page="htmlEdit.jsp" flush="false" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index/css/index.css"/>
<script language="javascript" src="<%=request.getContextPath()%>/index/js/index.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/index/js/validateData.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/index/js/selectData.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/index/js/validate.js"></script>
<style>
	.replyContent{clear: both;padding-left: 80px;}
</style>
<script language="javascript">
	var data=new Array("习近平就朝鲜劳动党成立70周年向金正恩致贺","杨栋梁天津官场往事:内斗致国资改革受阻","华为中兴一线供应商欠款倒闭 数千员工维权","金正恩险被吉他击中面门 负责安保的亲妹妹被革职","浙江舟山渔船命案嫌凶被抓时包里藏文胸和假发");
	var index=0;
	$(function(){
		moves();
	});
	
	function moves(){
		$("#chardiv").html(data[index]);
		$("#chardiv").animate({marginTop:"10px"},500,function(){
			setTimeout("movesTwo()",2000);
		});
	}
	
	function movesTwo(){
		$("#chardiv").animate({marginTop:"-40px"},500,function(){
			$("#chardiv").css("margin-top","45px");
			index++;
			if(index==data.length){
				index=0;
			}
			moves();
		});
	}
	
	
	
</script>


<div style="position:absolute; top:720px; margin-left:70px;">
	<img src="images/7_p_1.png" width="375" height="500" />
</div>
<div style="position:absolute; top:1220px; margin-left:445px;">
	<img src="images/7_p_48.png"></img>
</div>
<div style="position:absolute; top:1120px; margin-left:745px;">
	<div class="self_btn" style="margin-left:50px;margin-top:15px;"><a href="menu.jsp">立刻阅读</a></div>
</div>	
<div class="title_div_css">
	小说&nbsp;>&nbsp;武侠小说
</div>
<div class="projects_main">
	<div class="projects_head">
		<div class="head_youshang">
			<div class="head_hang" style="margin-top:40px;">
				<div style="font-size:60px;font-weight: bolder;font-family:'黑体';">三天魔尊</div>
				<div style="margin-top:20px;margin-left:30px;"><img src="images/7_p_5.png"></img></div>
				<div style="margin-top:20px;margin-left:30px;display: none;cursor: pointer;" onclick="window.location.href=''" id="zizhuImg"><img src="images/7_p_5_1.png"></img></div>
			</div>
			<div class="projects_qiehuan">
				<div class="zuopinxinxi" id="zuopintab" onclick="changeContent(this,'zuopin')">作品信息</div>
				<div class="zuojiaxinxi" id="zuojiatab" onclick="changeContent(this,'zuojia')">作者信息</div>
			</div>
			<div style="width:150px;height:2px;border-bottom:1px solid #ccc;"></div>
			<div class="youshang_second" id="zuopin">
				 <div class="head_hang" style="clear:both;padding-top:9px;">
					<div>分类：</div>
					<div>玄幻</div>
				</div>
				<div class="head_hang" style="clear:both;padding-top:9px;">
					<div>周点击：</div>
					<div>861</div>
				</div>
				<div class="head_hang" style="clear:both;padding-top:9px;">
					<div>周推荐：</div>
					<div>861</div>
				</div>
				<div class="head_hang" style="clear:both;padding-top:9px;">
					<div>月点击：</div>
					<div>761</div>
				</div>
				<div class="head_hang" style="clear:both;padding-top:9px;">
					<div>月推荐：</div>
					<div>561</div>
				</div>
				<div class="head_hang" style="clear:both;padding-top:9px;">
					<div>总点击：</div>
					<div>861</div>
				</div>
				<div class="head_hang" style="clear:both;padding-top:9px;">
					<div>总字数：</div>
					<div>157292</div>
				</div>
				<div class="head_hang" style="clear:both;padding-top:9px;">
					<div>积分：</div>
					<div>473727</div>
				</div>
				<div class="head_hang" style="clear:both;padding-top:9px;">
					<div>更新时间：</div>
					<div>2015/7/17&nbsp;&nbsp;9:34:14</div>
				</div>
				<div class="head_hang" style="clear:both;padding-top:9px;">
					<div>作品自主上架：</div>
					<div><input type="checkbox" onclick="openShangjia(this)"></div>
				</div>
				<div class="head_hang" style="clear:both;padding-top:9px;">
					<div><img src="images/7_p_49.png"></img>
					</div>
				</div>
			</div>
			<div class="youshang_second" id="zuojia">
				    <div class="head_hang" style="clear:both;padding-top:9px;">
						<div>作者：</div>
						<div class="author_name">南皖先生</div>
					</div>
					<div class="head_hang" style="clear:both;padding-top:9px;">
						<div>授权方式：</div>
						<div>原创</div>
					</div>
					<div class="head_hang" style="clear:both;padding-top:9px;">
						<div>是否签约：</div>
						<div style="color:red;">已签约</div>
					</div>
					<div class="head_hang" style="clear:both;padding-top:9px;">
						<div>发表方式：</div>
						<div>【独家首发】</div>
					</div>
					<div class="head_hang" style="clear:both;padding-top:9px;">
						<div>授权范围：</div>
						<div>【实体出版代理授权，非实体出版代理授权】</div>
					</div>
			</div>
		</div>
		<div>
			<div class="head_zuoxia">
				<div class="zuoxia_hang">
					<div style="margin-left:50px;"><img src="images/7_p_2.png"></img></div>
					<div>收藏</div>
					<div style="margin-left:30px;margin-top:3px;"><img src="images/7_p_3.png"></img></div>
					<div>评论</div>
					<div style="margin-left:30px;margin-top:3px;"><img src="images/7_p_6.png"></img></div>
					<div style="color:#bdbdbd;">继续阅读</div>
				</div>
				<div class="zuoxia_hang" style="margin-top:100px;">
					<div style="margin-left:50px;">已投票数:4561</div>
					<div style="margin-left:30px;margin-top:3px;"><img src="images/7_p_7.png"></img></div>
					<div>我也投票</div>
				</div>
			</div>
			<div class="head_youxia">
				<div>谁说少年就一定要举世皆敌，谁说修真就只有升级没有爱恨情仇。这是一个少年带着少年们大杀四方的故事，
				这是一个热血燃烧的时代。六道古经，魔佛降世，阵法天尊，天武传承！星空中不败的神话，今天，少年们歃血为盟，竖起战旗，
				对着阻挡在前方的敌人喊出了最强力霸气的口号：“干他X的！” 
				</div>
				<div class="youxia_er">
					<div>小说关键词:&nbsp;&nbsp;&nbsp;</div>
					<div>主角:&nbsp;&nbsp;&nbsp;</div>
					<div>|配角:&nbsp;&nbsp;&nbsp;</div>
					<div>|其它:&nbsp;&nbsp;&nbsp;</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="projects_hengtiao" style="margin-top: 130px;">
		<div style="width:38px;height:38px;float:left;padding-top:5px;">
			<img src="images/speaker.png" width="30px" height="30px"></img>
		</div>
		<div id="chardiv" style="margin-top:45px;color:red;padding-left:10px;float:left;">
			
		</div>
	</div>
	<div class="projects_hengxian">
		<img src="images/7_p_50.png"></img>
	</div>
	<div class="projects_mafan">
		<div style="width:70px;height:140px;" class="projects_mafanone">
			<div style="width:30px;font-size: 22px;margin-left:30px;font-weight: bold;">粉丝榜</div>
			<div style="width:1px;height:120px;"><img src="images/7_p_51.png"></img></div>
		</div>
		<div style="width:320px;height:280px;">
			<table style="width:100%;" class="projects_mafantb">
				<tr>
					<td><a style="font-weight: bold;">排名</a></td>
					<td><a style="font-weight: bold;">昵称</a></td>
					<td><a style="font-weight: bold;">等级</a></td>
				</tr>
				<tr>
					<td>01</td>
					<td>五月的一天</td>
					<td>护法</td>
				</tr>
				<tr>
					<td>02</td>
					<td>洄游大海</td>
					<td>堂主</td>
				</tr>
				<tr>
					<td>03</td>
					<td>子树</td>
					<td>舵主</td>
				</tr>
				<tr>
					<td>04</td>
					<td>叹息无门</td>
					<td>护法</td>
				</tr>
				<tr>
					<td>05</td>
					<td>DREAM_LAB</td>
					<td>护法</td>
				</tr>
				<tr>
					<td>06</td>
					<td>端里个端</td>
					<td>护法</td>
				</tr>
				<tr>
					<td>07</td>
					<td>SEASON_3700</td>
					<td>堂主</td>
				</tr>
				<tr>
					<td>08</td>
					<td>流氓神猫</td>
					<td>舵主</td>
				</tr>
				<tr>
					<td>09</td>
					<td>DFTYJK</td>
					<td>护法</td>
				</tr>
				<tr>
					<td>10</td>
					<td>陌路717</td>
					<td>护法</td>
				</tr>
			</table>
			<div style="margin-top: 10px; padding-bottom:30px; font-size: 12px;"><a href="">更多...</a></div>
		</div>
		<div style="width:50px;height:160px;" class="projects_mafanone">
			<div style="width:30px;font-size: 22px;font-weight: bold;">本书最新消息</div>
			<div style="width:1px;height:120px;"><img src="images/7_p_51.png"></img></div>
		</div>
		<div class="projects_mafanmidd">
			<div>
				<div class="midd_one">五月的一天</div>
				<div class="midd_two">
					<div class="midd_two_one">投了<a style="color:#ff3535;">1张评价票</a></div>
					<div class="midd_two_two">1x</div>
					<div class="midd_two_three">
						<img src="images/7_p_13.png"></img>
					</div>
				</div>
			</div>
			<div>
				<div class="midd_one">洄游大海</div>
				<div class="midd_two">
					<div class="midd_two_one">投了<a style="color:#ff3535;">1张粉红票</a></div>
					<div class="midd_two_two">1x</div>
					<div class="midd_two_three">
						<img src="images/7_p_14.png"></img>
					</div>
				</div>
			</div>
			<div>
				<div class="midd_one">子树</div>
				<div class="midd_two">
					<div class="midd_two_one">投了<a style="color:#ff3535;">10000点安币</a></div>
					<div class="midd_two_two">1000000</div>
					<div class="midd_two_three">
						<img src="images/7_p_15.png"></img>
					</div>
				</div>
			</div>
			<div>
				<div class="midd_one">叹息无门</div>
				<div class="midd_two">
					<div class="midd_two_one">投了<a style="color:#ff3535;">13张粉红票</a></div>
					<div class="midd_two_two">13x</div>
					<div class="midd_two_three">
						<img src="images/7_p_16.png"></img>
					</div>
				</div>
			</div>
			<div>
				<div class="midd_one">叹息无门</div>
				<div class="midd_two">
					<div class="midd_two_one">投了<a style="color:#ff3535;">13张粉红票</a></div>
					<div class="midd_two_two">13x</div>
					<div class="midd_two_three">
						<img src="images/7_p_16.png"></img>
					</div>
				</div>
			</div>
		</div>
		<div style="width:70px;height:160px;" class="projects_mafanone">
			<div style="width:30px;font-size: 22px;margin-left:10px;font-weight: bold;">累计打赏</div>
			<div style="width:1px;height:120px;"><img src="images/7_p_51.png"></img></div>
		</div>
		<div class="projects_mafanlast" style="width:120px;margin-left:10px;">
			<div class="last_hang" style="width:110px;">
				<div><img src="images/7_p_13.png"></img></div>
				<div>12</div>
			</div>
			<div class="last_hang" style="width:110px;">
				<div><img src="images/7_p_14.png"></img></div>
				<div>35</div>
			</div>
			<div class="last_hang" style="width:110px;">
				<div><img src="images/7_p_15.png"></img></div>
				<div>108</div>
			</div>
			<div class="last_hang" style="width:110px;">
				<div><img src="images/7_p_16.png"></img></div>
				<div>34</div>
			</div>
		</div>
	</div>
	<div class="read_pl">
    	<div class="read_pl_left">
    		<p style="padding: 15px 0px 0px 30px;">
    			<img src="images/7_p_25.png" style="padding-right: 5px;"/>
    			<span style="font-size: 19px;">评论</span>
    			（共45条）
    		</p>
    		<p style="padding: 0px 0px 0px 20px;font-size: 15px;">您必须<span style="color: #409db7;">登录</span>才能评论</p>
    	</div>
    	<div class="read_pl_right" style="padding-top: 25px;">
    		<textarea class="htmlEditCss" style="height:230px;"></textarea>
    	</div>
    </div>
    <div class="read_pl_qs">
    	<div style="padding:50px 0px 0px 25px;">点赞前十用户榜</div>
    	<div class="read_pl_qs_info">
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_29.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color: #707070">Gintoki</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_30.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070 ">伊丽莎白</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_31.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">Just&nbsp;We</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_32.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">9999sui</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_33.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">leyouxiyin</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_34.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">siso思烁</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_35.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">sweet乐</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_36.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">琪幻画印</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_37.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">设计师代号零</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_38.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">aiyuanfancs</span>
    		</div>
    	</div>
    </div>
    <div class="read_pl_con"></div>
    <div class="read_pl_content">
    	<div class="read_pl_content_1">
    		<div class="read_pl_content_1_1">
	    		<div style="padding-top: 20px;">
	    			<a href="reader_info.jsp"><img src="images/7_p_39.png" /></a>
	    		</div>
	    		<div style="padding-top: 20px;">
	    			<p style="padding: 0px 0px 0px 15px;">
	    				<span style="color: #1a9cda;">Gintoki</span>
	    				<span style="color: #bbbbbb;padding: 0px 0px 0px 10px;">2015年7月22日17:06:12</span><span style="padding-left: 20px;"><a href="javascript:replyContent(1)">回复</a></span>
	    			</p>
	    			<p style="font-size: 15px;padding: 0px 0px 0px 15px;">看到第一张就忍不住想看下去了，很不错的文文推荐哦！</p>
	    		</div>
    		</div>
    		
    		<!-- 回复你呢东东 -->
    		<div id="replyContent1" class="replyContent">
    			<div class="divItemsCss">
					<p>回复内容：</p>
					<p><textarea class="htmlEditCss" style="height:230px;"></textarea></p>
				</div>
				<div class="divItemsCss">
					<input type="button" value="回复" class="saveBtnCss">
					<input type="button" value="关闭" class="resetBtnCss" onclick="closeReplyContent(1)">
				</div>
    		</div>
    		
    		<div class="read_pl_content_1_2">
    			<div style="width: 50px;height: 50px;">
	    			<a href="reader_info.jsp"><img src="images/7_p_40.png" alt="" /></a>
	    		</div>
	    		<div style="height: 50px;min-width: 460px;">
    				<span class="comment_member_nick">冇猫腻</span>
    				<span class="comment_time">2015年7月22日17:06:12</span>
	    			<p class="comment_member_nick">不错，，很干净。有些人喜欢。有些人。。看方向吧、。</p>
	    		</div>
	    		<div class="read_pl_content_1_3">
	    			<span style="padding-left: 540px;font-size: 12px;color: #b3b3b3;"><a href=""><img src="images/7_p_41.png" style="padding-right: 5px;" title="赞一个"/></a>[21]</span>
	    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_42.png" title="转发"/></a></span>
	    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_43.png" title="删除"/></a></span>
	    		</div>
    		</div>
    	</div>
    	<div class="read_pl_content_2">
    		<div class="read_pl_content_2_1">
	    		<div style="padding-top: 20px;width: 75px;height: auto;">
	    			<a href="reader_info.jsp"><img src="images/7_p_44.png" /></a>
	    		</div>
	    		<div style="padding-top: 20px; width: 643px;height: auto;">
	    			<p style="padding: 0px 0px 0px 15px;">
	    				<span style="color: #1a9cda;">伊丽莎白</span>
	    				<span style="color: #bbbbbb;padding: 0px 0px 0px 10px;">2015年7月22日17:06:12</span><span style="padding-left: 20px;"><a href="javascript:replyContent(2)">回复</a></span>
	    			</p>
	    			<p style="font-size: 15px;padding: 0px 0px 0px 15px;line-height: 30px;">从他们的暗杀分配中就能知道，弓鸣想要采取“三魂夺命”的暗杀方式来进行屠杀，“三魂夺命”，是鬼面组织里最适合小心杀手团队进行暗杀的方式，他们会同时从房间的各个角落闯入，在最快的时间判定危险和暗杀对象的所在，同时出手，确保万无一失。</p>
	    		</div>
    		</div>
    		
    		<!-- 回复你呢东东 -->
    		<div id="replyContent2" class="replyContent">
    			<div class="divItemsCss">
					<p>回复内容：</p>
					<p><textarea class="htmlEditCss" style="height:230px;"></textarea></p>
				</div>
				<div class="divItemsCss">
					<input type="button" value="回复" class="saveBtnCss">
					<input type="button" value="关闭" class="resetBtnCss" onclick="closeReplyContent(2)">
				</div>
    		</div>
    		
    		
    		<div class="read_pl_content_2_3">
    			<span style="padding-left: 636px;font-size: 12px;color: #b3b3b3;"><a href=""><img src="images/7_p_41.png" style="padding-right: 5px;" title="赞一个"/></a>[8]</span>
    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_42.png" title="转发"/></a></span>
    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_43.png" title="删除"/></a></span>
	    	</div>
    	</div>	
    	<div class="read_pl_content_2">
    		<div class="read_pl_content_2_1">
	    		<div style="padding-top: 20px;width: 75px;height: auto;">
	    			<a href="reader_info.jsp"><img src="images/7_p_45.png" /></a>
	    		</div>
	    		<div style="padding-top: 20px; width: 643px;height: auto;">
	    			<p style="padding: 0px 0px 0px 15px;">
	    				<span style="color: #1a9cda;">伊丽莎白</span>
	    				<span style="color: #bbbbbb;padding: 0px 0px 0px 10px;">2015年7月22日17:06:12</span><span style="padding-left: 20px;"><a href="javascript:replyContent(3)">回复</a></span>
	    			</p>
	    			<p style="font-size: 15px;padding: 0px 0px 0px 15px;line-height: 30px;">看到第一张就忍不住想看下去了，很不错的文文推荐哦！</p>
	    		</div>
    		</div>
    		
    		<!-- 回复你呢东东 -->
    		<div id="replyContent3" class="replyContent">
    			<div class="divItemsCss">
					<p>回复内容：</p>
					<p><textarea class="htmlEditCss" style="height:230px;"></textarea></p>
				</div>
				<div class="divItemsCss">
					<input type="button" value="回复" class="saveBtnCss">
					<input type="button" value="关闭" class="resetBtnCss" onclick="closeReplyContent(3)">
				</div>
    		</div>
    		
    		<div class="read_pl_content_2_3">
    			<span style="padding-left: 636px;font-size: 12px;color: #b3b3b3;"><a href=""><img src="images/7_p_41.png" style="padding-right: 5px;" title="赞一个"/></a>[42]</span>
    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_42.png" title="转发"/></a></span>
    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_43.png" title="删除"/></a></span>
	    	</div>
    	</div>	
    </div>
    <div class="read_pl_more">
    	<div style="padding:50px 0px 0px 25px;font-size: 12px;"><a href="" style="color: #409db7;">查看更多评论...</a></div>
    	<div style="padding:45px 0px 0px 770px; ">
    		<span style="font-size: 13px;"><a href=""><img src="images/7_p_46.png" title="返回顶部" style="padding-right: 5px;"/></a>返回顶部</span>
    	</div>
    </div>
	<div class="projects_novellist">
		<div style="color:#666666;padding-left:30px;line-height:40px;background:#ffffff">其它作品推荐</div>
		<jsp:include page="read_list.jsp"></jsp:include>
	</div>
	

</div>

<script type="text/javascript">
	$(function(){
		$(".replyContent").each(function(){
			$(this).slideToggle("fast");
		});
	});

	function replyContent(index){
		$("#replyContent"+index)[0].style.display="block";
	}
	
	function closeReplyContent(index){
		$("#replyContent"+index)[0].style.display="none";
	}
	
	function openShangjia(obj){
		if(obj.checked==true||obj.checked=="selected"||obj.checked=="checked"){
			$("#zizhuImg")[0].style.display="block";
		}else{
			$("#zizhuImg")[0].style.display="none";
		}
	}
</script>
<jsp:include page="foot.jsp"></jsp:include>
