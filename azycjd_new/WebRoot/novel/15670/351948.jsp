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
    <title>（三十五）出逃再入陷阱中 浮船千渡入滦城</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351948&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351948&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351948+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三十五）出逃再入陷阱中 浮船千渡入滦城]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351948')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351948 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351948,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第36章&nbsp;&nbsp;&nbsp;（三十五）出逃再入陷阱中 浮船千渡入滦城
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			夜风袭凉，晏紫荆从后院的西墙翻出来然后拉着阿南在街上狂奔，最后停在一个小院子门前，晏紫荆瞅瞅周边没人，敲了门板几下就有人来给她开门，开门的人正是公孙翎的侍童，侍童见到是她有些吃惊，更何况晏紫荆还是披头散发。<p class='chapter_content_read_css'>“晏小姐，您怎么这么晚来了？”<p class='chapter_content_read_css'>“翎呢？我找他有很重要的事。”晏紫荆很是急切，恨不得直接闯进公孙翎的房间里拉他跑路。<p class='chapter_content_read_css'>“公子他回滦城了。”侍童先将她迎进来，低声回答道。<p class='chapter_content_read_css'>“什么？”晏紫荆一呆，眉头很快皱起来，手紧紧攥着，“怎么这个时候回滦城了？这下该怎么办啊？”<p class='chapter_content_read_css'>她一下子慌了神，她本来的意思是想让公孙翎直接带她走，到了滦城和公孙翎成亲的话，就算被她爹和哥哥们找到也无所谓了，可是现在，要怎么办？难道要去滦城找他吗？可是她根本就不知道公孙翎住在哪儿啊？<p class='chapter_content_read_css'>对了，晏紫荆死死盯着侍童，“你跟我一起去滦城，你是翎的侍童一定知道他住在哪里。”<p class='chapter_content_read_css'>侍童后退几步，额间落下几滴冷汗，恭敬道：“奴只是公子临时带在身边的侍童，根本无法进入主宅的，所以也并不知道公子的府邸在哪儿。”<p class='chapter_content_read_css'>晏紫荆被冷风吹得发抖起来，缓缓蹲在地上，双手捂住脸。<p class='chapter_content_read_css'>阿南跟着蹲下身和她面对面，轻声道：“小姐，我们可以先去滦城，然后再打听公孙公子的住所，若是公孙公子真心对待小姐的话，就绝对会出现的。”<p class='chapter_content_read_css'>晏紫荆抬起头，这是她第一次正视阿南，阿南总是腼腆的低着头，让她总有其实阿南和师姐样貌相同的感觉，其实，阿南和师姐的样貌很不同，阿南有种能让人平静下来的魔力，而那是师姐绝对不会有的。<p class='chapter_content_read_css'>“嗯，今晚好好睡一觉，明天就去滦城。”晏紫荆站起身伸个懒腰脸上再次绽出平常的笑容，她伸手拉起阿南，将阿南搂到怀里，刚见面时阿南才到她肩膀处，现在已经到她的鼻翼了，或许是之前一直低着头的原因吧。<p class='chapter_content_read_css'>那一夜她确实睡得很好，因为她被人下迷香了，而且质量还很不错，让她一路睡到了滦城，然后她醒来后被撞到后脑勺也是船停靠时造成的。<p class='chapter_content_read_css'>再之后晏紫荆又一路昏迷着被送到了驿馆，醒来已是第二天天明。<p class='chapter_content_read_css'>不知道是谁给她下了软骨散她除了能下床稍微走动走动吃个饭以外啥也干不了更别说想要翻墙出去了，再者说这墙也忒高了，顺着树也翻不出去。<p class='chapter_content_read_css'>她到是可以考虑挖个洞钻出去，但是要是外面是条繁华街道啥的她可就丢人丢大发了。<p class='chapter_content_read_css'>“紫荆姐姐。”旁边院子的小丫头亲昵的跑过来搂住正在院子里认真思考逃跑方法的晏紫荆。<p class='chapter_content_read_css'>晏紫荆很不耐烦的甩开她，没错，是很不耐烦，虽然才相处几天但是这小丫头给她的印象极其不好，她第一次见她的时候她就在欺负驿馆里的下人丫头，这还无所谓，还有一次大胆到扇阿南的耳光，虽然后来被她狠狠扇回来了但她心里还是极其不爽。<p class='chapter_content_read_css'>后来不知怎么了就跟在她后面“姐姐长姐姐短”的喊，被她赶了好几回依旧不改，她最讨厌这样的人了。<p class='chapter_content_read_css'>“走开，你不知道我讨厌你吗？”晏紫荆厌恶的又往后连退几步。<p class='chapter_content_read_css'>“姐姐，当初打阿南是香儿的不对，姐姐你不是还打了香儿嘛，咱们就算扯平了好不好嘛。”她说着就要上前扯晏紫荆的袖子晏紫荆猛然一个转身，她直接摔在了地上。<p class='chapter_content_read_css'>她抬起头可怜巴巴的看着晏紫荆。<p class='chapter_content_read_css'>忽然一阵胭脂粉味迎面扑来，晏紫荆赶忙用袖子捂住鼻子看着朝她走来的花架子，狠狠皱住眉头。<p class='chapter_content_read_css'>“哎呦，你们这又是唱的哪一出啊？”花架子只是晏紫荆给她起的个外号，她本名叫什么晏紫荆也不记得，但绝对记得住她总是穿的一身华丽，腰间配着一套羊脂玉佩，头绾发髻带金银珠钗首饰一簇，身抹胭脂水粉一堆。<p class='chapter_content_read_css'>“哼，我们唱的哪一出关你什么事？整天打扮得跟青楼里的娼妓一样，就差头戴一朵水仙花了！”小丫头赶忙爬起来，对着花架子就是凶神恶煞，跟之前倒在地上可怜巴巴的完全是两个人。<p class='chapter_content_read_css'>“你个死丫头！你竟然敢……”花架子也不甘示弱地大骂出口。<p class='chapter_content_read_css'>晏紫荆翻了个白眼偷偷溜回房间了。	<p class='chapter_content_read_css'>阿南正拿着一封信站在她的房门口，面上尽是犹豫之色。<p class='chapter_content_read_css'>晏紫荆却是一笑，伸手就要抢过信来，被阿南躲了过去，晏紫荆狐疑的看着她，指着信道：“这是——翎他给我的信，还是二哥他们寄来的？”<p class='chapter_content_read_css'>阿南迟疑的摇摇头，还是像以往一样不敢抬头正视晏紫荆。<p class='chapter_content_read_css'>“你还是把信给我吧，我自己看。”晏紫荆心中想着还能有谁给她寄信，就趁阿南一个不注意抢过了信双手一边打开信纸一边想到，总不会是师父寄信给她吧？师父的消息什么时候这么灵通了？<p class='chapter_content_read_css'>正狐疑着，信纸上的一行字入眼，晏紫荆瞬时像被一盆冰水从头浇到底，都冷到了骨子里。<p class='chapter_content_read_css'>“皇后必为孚城岛晏氏。”<p class='chapter_content_read_css'>“这是谁写的？”晏紫荆死死盯着那信纸，恨不得能盯出来一个窟窿，但是她完全不知道是谁的字迹。<p class='chapter_content_read_css'>“小、小姐，是在张侍卫的门缝底下拿、拿到的。”阿南慌张地回答。<p class='chapter_content_read_css'>晏紫荆皱着眉头没有言语，默默将信纸塞进袖子中转身进了房间。<p class='chapter_content_read_css'>“小、小——姐……”阿南被“砰”地一声关在外面，她身子微微发着抖瞬间红了眼眶，然后吸吸鼻子慢慢转身出了小楼，被秋风掀起了一片衣角，像是枯叶蝶一般的落叶停留在她发梢上，静静的，静静地停驻。<p class='chapter_content_read_css'>晏紫荆大喇喇的躺在床上，静静地看着床幔，良久才闭上了眼翻了个身。<p class='chapter_content_read_css'>晚饭她也没心情吃直接把送饭的阿南拒之门外了，虽是闭着眼但她却是一点睡意也没有，虽说这封信可能有假但又有谁能保证没个万一？晏紫荆思考了一夜终于想好了怎么混出这个驿馆了。<p class='chapter_content_read_css'>第二日一大清早她们就被喊醒梳洗打扮，终于要开始“面试”了。<p class='chapter_content_read_css'>一路上晏紫荆都板着个脸一言不发，冻得那个小丫头都没敢靠近她，阿南还是像往常一样唯唯诺诺的跟在她身后。<p class='chapter_content_read_css'>她们每个人都有一个名牌，进宫城的时候都要交给执笔记名的内侍和宦官，但晏紫荆就是板着脸往前走被其中一个内侍拦住，阿南赶紧将晏紫荆的名牌递给那人，内侍一看名牌上的名字，脸色立刻就变了，口气也变得恭敬起来。<p class='chapter_content_read_css'>晏紫荆没理他继续跟着其他人往前走，可是袖中的手已经紧紧攥住。<p class='chapter_content_read_css'>“面试”一路下来晏紫荆什么也没做，但只要那些内侍宫人看到她的名牌就会变了一个人，对她极其恭敬，有甚者还会给她端茶递水。<p class='chapter_content_read_css'>其余的秀女虽有不满但也不敢做出什么动作，只能干巴巴的忍住，她们还不想给可能决定她们命运的“面试官”们留下坏印象。<p class='chapter_content_read_css'>晏紫荆也极其不理解她们，进宫有什么好？嫁给皇帝有什么好？三宫六院这么多人怎么可能会独宠一人？<p class='chapter_content_read_css'>晏紫荆本想在人群中制造点混乱然后趁机逃走，但是她低估皇宫的守卫了，几乎每个秀女身边都会跟着一个护卫，就算她想制造混乱也不成了，只能用那个方法了，晏紫荆暗暗提了一口气。<p class='chapter_content_read_css'>晚间她们都无一例外的住在皇宫内苑中，其余人都是主仆六人一间房唯独她是和阿南两人一间。<p class='chapter_content_read_css'>她依旧板着脸不和阿南说话，阿南沉默的收拾着东西也不敢和她搭话。<p class='chapter_content_read_css'>吃完晚饭就上床睡觉，阿南等她上床盖好被子之后才熄灭了烛灯，黑暗中还撞到了什么东西发出细微声响。<p class='chapter_content_read_css'>阿南低喏着道歉，回到了自己床上。<p class='chapter_content_read_css'>到了入夜时分，晏紫荆猛然张开眼睛，掀开被子猫着腰下床，摸索了一会儿才找到自己的鞋子，胡乱将鞋子一套就轻步向门边踱去。<p class='chapter_content_read_css'>晏紫荆手指才刚刚碰到门框，就感到门口有人，立刻弯了腰藏到门后的位置。果不其然门被轻轻打开，一个人溜了进来，看着身板应是一个男子。<p class='chapter_content_read_css'>男子并没有意料中的去翻什么贵重值钱的物品而是踱步到了床边，晏紫荆屏住内息猫着步子走到男子身后，想要劈手将他打晕，手才将将对准了后脖颈的位置，男子忽然转过身来，一把钳制住了她的双手，她还未来得及大喊就被男子一把堵住了双唇，没错，是被男子的薄唇堵住的。<p class='chapter_content_read_css'>晏紫荆惊恐地瞪大眼睛用脚使劲踢他，身子不断扭动，试图摆脱他的钳制，男子直接转身将她抵在了墙上，双腿抵住她的膝盖，任她再怎么也无法动弹分毫。<p class='chapter_content_read_css'>她只能瞪大着眼睛看着自己被侵犯，她想努力看清男子的面貌，但偏偏今夜是无月之夜，更何况男子又是背着微弱的星光。<p class='chapter_content_read_css'>忽然一双通透的眼睛闪现在晏紫荆眼中，她的泪水一下子溢满了眼眶，随即滚落在煞白两颊上。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351948&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351948&&novelId=15670'">下一章</div>
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
