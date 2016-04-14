<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("contextPath", path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>（五）君骑竹马来迎妾 君妾早已为陌人</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/azycjs.css"/>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript">var memberId='${loginUsers.id}';</script>
	<script language="javascript">var readAddress='${param.readAddress}';</script>
	
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.color.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/azycjd.js"></script>
	<script language="javascript">readJsp=true;</script>
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
	<script language="javascript">var path='<%=path%>';</script>
	<script language="javascript">var memberId='${loginUsers.id}';</script>
	<script language="javascript">var novelId='15670';</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/index/css/index.css"/>
	<script language="javascript" src="<%=path %>/js/azycjd.js"></script>
	<style type="text/css">
		img{border: none;}	
	</style>
	<!--[if lte IE 7]>
		<div id="browseTips" style="width:830px;background-color:#FFFFFF; margin:0 auto; margin-top:40px;margin-bottom:20px;line-height:23px;">
			我们发现您使用的IE浏览器版本距离现在已经很遥远了。为了更好的体验本系统，我们建议您升级浏览器。您可以选择：<br />
 			<a target="_blank" href="http://rj.baidu.com/soft/detail/14917.html?ald">IE10</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/11843.html?ald">火狐浏览器</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>|<a href="javascript:closeBrowseTip()">关闭</a>
		</div>
 		
	<![endif]-->
	<script type="text/javascript">
		var timer;
	    $(function(){
	        $(window).scroll(function(){
	            clearInterval(timer);
	            var topScroll=getScroll();
	            var topDiv="80px";
	            var top=topScroll+parseInt(topDiv);
	            timer=setInterval(function(){
	                $(".read_ds").animate({"top":top},0);
	                $(".read_left_menu").animate({"top":top},0);
	            },0)
	        });
	        
	        $(".huanfu div").click(function(){
	        	var t=$(this)[0].id.split("@");
	        	$("#novel_content").css("color","#"+t[1]).css("background-color","#"+t[0]);
	        });
	        
	        $(".replyContent").each(function(){
				$(this).slideToggle("fast");
			});
			
			$(document).bind("contextmenu",function(e){   
            	return false;   
		    });
		    $(document).bind("mousedown",function(e){   
		        if(e.which==1||e.which==3){
	        	  return false;    	
		        }
		    });
		    
		    $("#zitidiv li").click(function(){
		    	var tds=$(this)[0].id;
		    	tds=tds.substring(8,tds.length);
		    	$("#novel_content").css("font-size",tds+"px");
		    	$("#zitidivparent").html("字体["+tds+"号]");
		    	SetCookie("novel_font_size",tds);
		    	$("#zitidiv").slideUp('fast');
		    });
		    $("#beijingdiv li").click(function(){
		    	$("#novel_content").css("background-color","#"+$(this)[0].id);
		    	$("#beijingdivparent").html("背景["+$(this).html()+"]");
		    	SetCookie("novel_bg_color",$(this)[0].id);
		    	SetCookie("novel_bg_color_name",$(this).html());
		    	$("#beijingdiv").slideUp('fast');
		    });
		    var novel_font_size=getCookie("novel_font_size");
		    if(novel_font_size!=null&&novel_font_size!=undefined){
		    	$("#novel_content").css("font-size",novel_font_size+"px");
		    	$("#zitidivparent").html("字体["+novel_font_size+"号]");
		    }
		    var novel_bg_color=getCookie("novel_bg_color");
		    var novel_bg_color_name=getCookie("novel_bg_color_name");
		    if(novel_bg_color!=null&&novel_bg_color!=undefined){
		    	$("#novel_content").css("background-color","#"+novel_bg_color);
		    	$("#beijingdivparent").html("背景["+novel_bg_color_name+"]");
		    }
		    
		    if(readAddress!=''){
		    	($(window).scrollTop(parseInt(readAddress)));
		    }
		    
		    window.onkeydown=function(e){
				if(e.keyCode==39){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351918&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351918&&novelId=15670";
				}else if(e.keyCode==67){
					return false;
				}else if(e.keyCode==17){
					return false;
				}else if(e.keyCode==123){
					return false;
				}else if(e.keyCode==86){
					return false;
				}else if(e.keyCode==65){
					return false;
				}else if(e.keyCode==83){
					return false;
				}else if(e.keyCode==13){
					window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp';
				}
			}
		    
	    });
	    function getScroll(){
             var bodyTop = 0;  
             if (typeof window.pageYOffset != 'undefined') {  
                     bodyTop = window.pageYOffset;  
             } else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') {  
                     bodyTop = document.documentElement.scrollTop;  
             }  
             else if (typeof document.body != 'undefined') {  
                     bodyTop = document.body.scrollTop;  
             }  
             return bodyTop;
	    }
	    function loadReportReasonJsp(){
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351918+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（五）君骑竹马来迎妾 君妾早已为陌人]</div>",
				width: 860,
				height: 600,
				top:90,
				buttons: { '关闭': true },
				closed:function(){
					$("#body_index").css("background-color","#f0f0f0").css("padding","0px").css("margin","0px");
				}
			});	
		}
		
		function changeFontSize(num){
			var n=parseInt($("#novel_content").css("font-size"));
			n+=num;
			$("#novel_content").css("font-size",n+"px");
		}
		
		function huanfu(){
			$("#huanfu").slideToggle();
		}

		function showMulv(){
			if($("#mulvdiv")[0].style.display==""||$("#mulvdiv")[0].style.display=="none"){
				$("#mulvdiv")[0].style.display="block";
				$("#mulvdiv").animate({marginLeft:'30px'});
			}else{
				$("#mulvdiv")[0].style.display="none";
				
				$("#mulvdiv").css("margin-left","0px");
			}
		}

	</script>
  </head>
  
  <body id="body_index" style="padding:0px; margin:0px;background: center 0px no-repeat #f0f0f0;">
  	 <c:if test="${readFlag eq 'no' }">
  	 	<div class="no_read_flag_css">
  	 		该章节是VIP章节。
  	 		${errorInfo }
  	 		<a href="javascript:;" onclick="buyChapter('351918')">购买</a>
  	 	</div>
  	 </c:if>
  	 <c:if test="${readFlag eq 'yes' }">
	    <div class="read_top">
	    	<div class="huanfu" id="huanfu">
	     		<div id="f7f5ed@292927" style="background-color: #f7f5ed"></div>
	     		<div id="e1e8b2@292927" style="background-color: #e1e8b2"></div>
	     		<div id="bdebe1@292927" style="background-color: #bdebe1"></div>
	     		<div id="cfd5bb@292927" style="background-color: #cfd5bb"></div>
	     		<div id="ebd1de@292927" style="background-color: #ebd1de"></div>
	     		<div id="bfe1c6@292927" style="background-color: #bfe1c6"></div>
	     	</div>
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670.jsp'">公子，请上钩</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:官秋月</div>
	    		</div>
	    		<div class="novel_info_read_div">
	    			<div id="zitidivparent" style="background:url(<%=request.getContextPath()%>/images/9_p_3.png) no-repeat 20px 14px;" onclick="$('#zitidiv').slideToggle('fast');">字体[12号]</div>
	    			<ul id="zitidiv">
	    				<li style="font-size: 12px;" id="fontSize12">安之<span>12号</span></li>
	    				<li style="font-size: 14px;" id="fontSize14">安之<span>14号</span></li>
	    				<li style="font-size: 16px;" id="fontSize16">安之<span>16号</span></li>
	    				<li style="font-size: 18px;" id="fontSize18">安之<span>18号</span></li>
	    				<li style="font-size: 20px;" id="fontSize20">安之<span>20号</span></li>
	    				<li style="font-size: 22px;" id="fontSize22">安之<span>22号</span></li>
	    			</ul>
	    		</div>
	    		<div class="novel_info_read_div">
	    			<div id="beijingdivparent" style="background:url(<%=request.getContextPath()%>/images/10_p_1.png) no-repeat 15px 11px;" onclick="$('#beijingdiv').slideToggle('fast');">背景[默认(白)]</div>
	    			<ul id="beijingdiv">
	    				<li style="background-color: #ffffff;" id="ffffff">默认(白)</li>
	    				<li style="background-color: #e1e8b2;" id="e1e8b2">浅绿</li>
	    				<li style="background-color: #bdebe1;" id="bdebe1">浅蓝</li>
	    				<li style="background-color: #cfd5bb;" id="cfd5bb">浅灰</li>
	    				<li style="background-color: #ebd1de;" id="ebd1de">小粉</li>
	    				<li style="background-color: #bfe1c6;" id="bfe1c6">青色</li>
	    			</ul>
	    		</div>
	    	</div>
	    </div>
	    <div class="read_content">
	    	<div class="read_content_left">
	    		<div class="read_left_menu" id="read_left_menu">
	    			<!-- <div id="mulvdiv">
	    				novel_chapter.chapter.menu
	    			</div>
	    			<p><a href="javascript:showMulv()">目录</a></p> -->
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351918 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351918,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第6章&nbsp;&nbsp;&nbsp;（五）君骑竹马来迎妾 君妾早已为陌人
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  三月中旬，天气也暖和了不少，路上行人也无匆匆之意，男子红着脸从茶楼里出来，穿红衣的女孩子低着头跟着他，脸蛋儿也是粉扑扑的，有几丝害羞之意。<p class='chapter_content_read_css'> “咳，曼儿，我……”男子支支吾吾，顿了半晌，才开口道：“我很高兴，未婚妻是你。”<p class='chapter_content_read_css'>女孩子向前一步，环住男子的腰，又赶快松手逃走了。男子瞬时缓过神来，充满笑意的追赶上去，行人也都满脸笑意的让开了路。<p class='chapter_content_read_css'> “真是郎才女貌啊……”	<p class='chapter_content_read_css'> “是啊……”<p class='chapter_content_read_css'> “小姑娘好福气……”<p class='chapter_content_read_css'> “什么啊，沈公子才是好福气呢……”<p class='chapter_content_read_css'>  为什么？为什么要离开！明明有那么多祝福了，你为什么……<p class='chapter_content_read_css'> “呼啊！”沈言腾地从床上坐起来，大口喘着气，冷汗泠泠，不知过了多久，失焦的眼睛才重新凝成光，安静地看着床幔，淡淡开口：“安叔。”<p class='chapter_content_read_css'> 房门吱呀一声开了，管家安叔带了拿着洗漱用品婢女进来，恭恭敬敬地行礼问安。<p class='chapter_content_read_css'> “西院的那位女工怎么样了？”穿戴好，拿微湿的巾布擦净脸，冰凉凉的感觉让他清醒不少。<p class='chapter_content_read_css'> “病情是有些好转了，但只怕还是会有反复。”安叔不冷不热地回答。<p class='chapter_content_read_css'>  沈言微微敛了一下眉，“那便请薛大夫，让他用最好的药材，只是偶感风寒罢了，竟然可以拖如此长的时间，只怕是那些大夫不尽心。”<p class='chapter_content_read_css'> “诺。”安叔点头应下，薛大夫算是中辰最好的大夫了，忽而想起一事，“二少爷，二少夫人来了信，问您什么时候回沈宅。”<p class='chapter_content_read_css'>提起二少夫人，沈言的脸色冷了几分，随意说道：“回告她，等过了天贶节就回去。”<p class='chapter_content_read_css'> “诺。”<p class='chapter_content_read_css'> “对了，今天去恒香茶楼，春言兰阁那边就让刘掌柜好好照看。”沈言眼眸一动，立刻改变了原来计划。<p class='chapter_content_read_css'>  刚刚入了四月份，街头的人也多了起来，恒香茶楼内客人也是络绎不绝，却显得极其风雅，没有多大的噪声，只有沏茶，低声交谈的声音，每个坐席间都由一道屏风隔开，更增添了一份神秘，这也是沈言经常来恒香茶楼的原因。<p class='chapter_content_read_css'>  跑堂的见到是他，便上前迎礼，没有多殷勤反而让人心里更舒服些，左脚刚踏上楼梯，就莫名回头了一下，就听到女子问礼的声音。<p class='chapter_content_read_css'> “沈老板，您也来喝茶吗？”女子身着最普通的桃色衣裙，系着水蓝色的腰带，双手合在宽袖里，梳着随云鬓，只钗了根红色的流苏，碎发将额头遮住，嘴角是浅浅的笑。想了一下，确实对眼前的女子没有一丝印象。<p class='chapter_content_read_css'> “不知姑娘是？”<p class='chapter_content_read_css'> “自然，我忘了，沈老板还不认识我呢，我是西厨房新来的厨娘，秦书。”说到最后一句的时候，南宁眼角跳了一下，混蛋书绘音，用假名也要用个好点的吧，怎么听都像是情书。<p class='chapter_content_read_css'> “秦姑娘，不知秦姑娘你有何事？”沈言稍微侧身站到了楼梯边上，以免挡住他人的道路。<p class='chapter_content_read_css'> “咳，”南宁看了看四周，掏出手来，摊开手心，一个银亮亮的小东西露在沈言眼前，“沈老板，借一步说话吧。”<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  南宁很清楚的看到沈言的脸色瞬间变得惨白，眼中有难以言说的痛楚，缓了良久才恢复温和的笑容，向楼上伸手，“秦姑娘，楼上雅阁请。”<p class='chapter_content_read_css'> “好。”南宁迅速合上了手掌，向楼上走去。沈言就在半步之后。<p class='chapter_content_read_css'> “沈老板，那我就实话直说了。”刚坐到木椅上，南宁就将小物件反扣在桌子上，银色的小铃铛散着柔和的光泽，晃得沈言心跳突然加快。<p class='chapter_content_read_css'> “嗯。”<p class='chapter_content_read_css'> “其实我是受‘人’所托，来请沈老板去见一个‘人’。”南宁顺手捞了一口茶，竟觉得没有书绘音泡的好喝，心里狠狠鄙视了自己一下。<p class='chapter_content_read_css'> “什么人？”<p class='chapter_content_read_css'> “夏曼，沈老板应该认识吧。”虽是问句却是陈述语气。<p class='chapter_content_read_css'> “认识是认识，不过，”沈言语气忽然一冷，“我为什么要去赴她的约呢？还请秦姑娘回复她，我不回去赴约的。”<p class='chapter_content_read_css'> “何必如此决绝呢？”南宁心里明了，看来沈言还不知道夏曼已经死了，勾勾唇，“我只是负责将消息带到罢了，至于去不去，就是您的事了，不是吗？对了，她还说，只要将这个铃铛交给您，您就知道该去哪里了。对了，时间是三日后子时三点。千万不要记错了哦。”<p class='chapter_content_read_css'>  南宁告辞施施然出了雅间，眼神有些冷，看来两人之间有些误会，误……会……么？<p class='chapter_content_read_css'>  哼，那又关自己何事？<p class='chapter_content_read_css'>  雅间里的人身形僵硬，等到茶都凉了，才缓缓的捏过小小的铃铛，狠狠的攥在手心里，眼中闪过一丝挣扎，忽然下了决心，将铃铛从窗口远远的抛出去，直至再也看不到，才失力的倚在窗边，喃喃道：“既然走了，就永远不要回来了，再也不要见了，夏曼。”<p class='chapter_content_read_css'>最后两个字好似从牙缝里逼出来。让人狠狠地打了个寒颤。<p class='chapter_content_read_css'>  在街上闲逛的南宁忽然看到了一道蓝色的身影，眼眸一动，飞快的跟上，内力什么，她可没有，不过轻功，不用内力也是可以的啊。<p class='chapter_content_read_css'>  在拐过不知第几个路口时，那身影一晃便不见了踪影，南宁一时不察，直直向前奔去，以一个十分不雅的姿势从斜坡上滚下去，停下时，没有想象中的痛楚，反而听到一声闷哼。<p class='chapter_content_read_css'> “咦？是你？”南宁定了定神才看清眼前的人，正是和宫雪一个模子刻出来‘还救过自己的南宫宁雪。<p class='chapter_content_read_css'>南宁赶忙爬起来，顾不得自己的衣裙凌乱，把南宫宁雪扶起来，左问右问，确保他没受什么伤，才松了一口气。<p class='chapter_content_read_css'> “真是抱歉呢，撞到你了。”南宁眼中闪着愧疚，衣裙沾了片片尘土，显得更是狼狈。<p class='chapter_content_read_css'> “没什么关系，秦姑娘这么急，也是来急着看夜凝紫吧？”<p class='chapter_content_read_css'> “啊？啊——”南宁疑惑的顺着他指去的方向看去，一时愣在原地。<p class='chapter_content_read_css'>  扑面而来的是浓郁的花香，紫色的花浪一波接着一波，散发着夜色的紫光，像是美妙的精灵挥舞着神奇的魔法棒，最重要的是。<p class='chapter_content_read_css'>站在眼前的男子，水紫色的锦袍，随风拂动的墨发，还有，唇角如沐阳光的笑容，就像是神邸在自己面前一样。<p class='chapter_content_read_css'>  南宁就那样呆呆的看着他，脸颊飞上几块儿红霞，耳朵也迅速变红。只有南宁心里最清楚，自己的模样若是被琴霜七看到，一定会大笑自己犯花痴，不过，偶尔犯一下花痴的感觉……<p class='chapter_content_read_css'>  还不错，嗯，只是，还不错。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351918&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351918&&novelId=15670'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')"/>
	    		</div>
	    	</div>
	    </div>
  	 </c:if>
     

    <div class="read_foot">
   		<p style="padding-top: 43px;">Copyright 2006-2012&nbsp;&nbsp;
   			 www.azycjd.com &nbsp;&nbsp;
   			  All Rights Reserved&nbsp;&nbsp;
   			   版权所有&nbsp;&nbsp;
   			    云南安柔科技有限公司
   		</p>
   		<p>
   			滇ICP备12006807号-1 &nbsp;&nbsp;滇网文许字【2014】1100-002号
   		</p>
    </div>
  </body>
</html>
