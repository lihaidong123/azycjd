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
    <title>（二十九）逃离逃离快逃离 相遇相遇快相遇</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351942&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351942&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351942+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二十九）逃离逃离快逃离 相遇相遇快相遇]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351942')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351942 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351942,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第30章&nbsp;&nbsp;&nbsp;（二十九）逃离逃离快逃离 相遇相遇快相遇
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			一双手瞬时搂过她，暖暖的手掌覆在南宁眼上，鲜血洒满手背、脸上……紧接着是东西落在地上时发出的骨碌碌的声音。<p class='chapter_content_read_css'>南宁面前漆黑一片，但大脑完全脑补出砸向自己的是什么，她软趴趴的倒在南宫宁雪怀里，粗喘着气，脸上有粘稠的东西向下滑落，嘴里湿咸一片。<p class='chapter_content_read_css'>南宫宁雪的手缓缓移开，南宁猛地闭上眼睛。<p class='chapter_content_read_css'>“秦姑娘，没事吧？”南宫宁雪都没有发现自己的声调有些发抖。<p class='chapter_content_read_css'>南宁睁开眼强装镇定，用袖子擦擦脸努力使声音恢复平静：“没关系，走吧，只是一个人头罢了，话说，是沿着这条小路下去没错吧？”<p class='chapter_content_read_css'>“没错。”南宫宁雪点点头。<p class='chapter_content_read_css'>“还是我抱着叶子吧，衣蓝你可要好好保护我们啊。”南宁从衣蓝怀里接过顾叶，顾叶老老实实地盯着南宁，不发出一点声音。<p class='chapter_content_read_css'>衣蓝抽出腰带剑走在前面，行云背着已经吓呆的木梓跟在后面，南宁抱着顾叶被南宫宁雪半扶着跟上，一行几人步履匆匆又小心翼翼。<p class='chapter_content_read_css'>而身后的惨叫声和兵刃相接的声音也越来越远。<p class='chapter_content_read_css'>一樱山上生长着一种特殊的植物，能够使人产生幻觉，就像是鬼打墙一般的一直在原地打转，南宁等人就遇到了这种状况。<p class='chapter_content_read_css'>“糟了，已经第五次经过这个地方了。”众人额头都狠狠滴下冷汗，甚至连呼吸都有些难过。天空传来几声凄厉的鸟叫。<p class='chapter_content_read_css'>“公子，怎么办？”行云觉得眼前都有些发黑，更何况还背着个木梓。<p class='chapter_content_read_css'>“我想起来了，”南宁伸手掏掏顾叶的小兜，果然从里面掏出一块黑漆漆的东西，“这是我之前炼的熏香，也不知道有没有用。”<p class='chapter_content_read_css'>“一定会有用的。”南宫宁雪接过来用火折子点着，袅袅烟丝散着香味挥发出来，所有人的眼神都变得澄澈起来。<p class='chapter_content_read_css'>“既然这样，应该不会再绕回来了。”<p class='chapter_content_read_css'>几人整整走了半个时辰终于到达山脚。<p class='chapter_content_read_css'>南宁瘫坐在地上，刘海黏糊糊的粘在额头上，衣服被刮得到处都是密密麻麻的口子，南宫宁雪一派儒雅的模样也被彻底颠覆，其他三人也是如此，只有顾叶最幸运，张着小嘴睡了一路。<p class='chapter_content_read_css'>“这下，我们，要怎么到滦城去？”南宁抱着顾叶的胳膊松了松，衣蓝顺势接过顾叶，她话音刚落，就有一阵马蹄声闯动着耳膜。<p class='chapter_content_read_css'>“是徐管事。”行云耳朵一动就听出来，脸上露出喜悦，但随即疑惑地一撇眉，“还有一匹快马，不知道……”<p class='chapter_content_read_css'>他话音还没落就看到一个身影从飞奔的马上直接跳下来，扑到南宁身上。<p class='chapter_content_read_css'>“你、你、”南宁奋力一脚把身上的人踹开，“起开啦！”<p class='chapter_content_read_css'>“南宁，你、你怎么能这么对我！”女子将将站稳，叉着腰怒视南宁，“我可是很担心你的！你怎么能这样呢！南宁！”<p class='chapter_content_read_css'>“琴霜七你个笨蛋！谁让你来这儿的，你知不知道后果是什么！你到底知不知道！你是笨蛋吗？竟然从马背上跳下来，要是不小心撞到太阳穴怎么办？！”<p class='chapter_content_read_css'>“我是担心你啊，伯父说你到这儿来，我就害怕你一个人被人欺负了怎么办，我好歹也是你半个姐姐啊！”<p class='chapter_content_read_css'>“谁让你担心了！我怎么可能会让人欺负？你这个笨蛋！琴霜七大笨蛋！”南宁红了眼眶，声音哽咽。<p class='chapter_content_read_css'>“秦南宁才是大笨蛋！”琴霜七吸吸鼻子，和南宁抱在一起大哭。<p class='chapter_content_read_css'>剩下的几人面面相觑，徐管事稳住马车停在众人前面。<p class='chapter_content_read_css'>等到南宁和琴霜七平静下来，一众人都已经该骑马的骑马，该上车的上车了。琴霜七定睛看着南宫宁雪半晌，环胸仰视他道：“喂，你骑了我的马。”<p class='chapter_content_read_css'>南宫宁雪微微一愣，南宁扯扯琴霜七的袖子，小声道：“七七，我们还是去坐马车吧。”<p class='chapter_content_read_css'>“不要，”琴霜七大大咧咧地搂过南宁，大声笑道，“亲爱的，我带你去骑马兜风，这次可不是自行车哦。”<p class='chapter_content_read_css'>南宫宁雪利索下马钻进了马车里和木梓顾叶相伴。<p class='chapter_content_read_css'>“哎哎哎哎哎！”南宁还没来得及反抗就被琴霜七扔上了马背，琴霜七紧随其后跃身上马，她冲徐管事比个帅气的手势。<p class='chapter_content_read_css'>“我们先走了！”琴霜七说罢调转马头，将其余人远远甩下。<p class='chapter_content_read_css'>“这个女子，可真是有趣。”衣蓝冲着行云道。<p class='chapter_content_read_css'>“啊。”行云摸摸鼻子，甩起马鞭跟在马车后面。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>“七七，你慢一点儿。”南宁只觉得强劲的风划在脸上，火辣辣的疼，她慌张的连眼睛都不敢睁开。<p class='chapter_content_read_css'>“哈，果然还是骑马比较爽快。”琴霜七一只手拉住缰绳缓缓减速，另一只手固定住南宁，防止她掉下去，歪头稍稍一瞥，见马车被自己落了好远一段路，“这样就好了，咱俩说些悄悄话他们也听不到了。”<p class='chapter_content_read_css'>“七七想说什么？”<p class='chapter_content_read_css'>“是你想问什么吧。”琴霜七轻轻掐了她一下。<p class='chapter_content_read_css'>“嗯，你是怎么，到这里来的？”南宁心里就像打鼓一样，对答案既期待又害怕。<p class='chapter_content_read_css'>“我怎么到这里来的？”琴霜七故意笑道，“当然是骑马来的。”<p class='chapter_content_read_css'>南宁回头嗔视她。<p class='chapter_content_read_css'>“好啦好啦，我说实话啦。”若不是不能松手，琴霜七一定作双手投降状。<p class='chapter_content_read_css'>“其实是我得到一张邀请函，笙星服装大赛的邀请函，如果拿到第一的话就会得到时光之旅的名额。嗯，那时候你突然就失踪啦，要不是秦伯父回来告诉我你去参加时光之旅的活动了，我可就要报警了。然后，我就拿了第一名，第一名除了时光之旅的名额还有八十万的奖金哦，哈哈哈，现在我可是非常有钱哦，回去姐姐给你买男神的手办啊。”琴霜七兴奋地说道。<p class='chapter_content_read_css'>真的不是书绘音啊……南宁心里忽然愧疚起来，竟然就那样错怪他了。<p class='chapter_content_read_css'>“我原来还以为时光之旅是旅游大冒险什么的，结果是穿越啊——还是架空的，嘿嘿，反正我历史也不怎么好，到哪儿都一样啦。”<p class='chapter_content_read_css'>“那，时光之旅的时限是多久？”南宁忐忑不安地问道。<p class='chapter_content_read_css'>“呃——”琴霜七不好意思地笑笑，“我也不记得了，好像大概是什么，呃，到了时限就会被自动送回去之类的——吧。”<p class='chapter_content_read_css'>“自动啊。”南宁默默扶额，其实还是要靠七圣珠吧。越过琴霜七的肩膀南宁看见依旧甩得远远的几人，“七七，你难道没有认出来吗？”<p class='chapter_content_read_css'>“谁？”琴霜七思考一会儿，“你是说抢我的马的人吗？谁知道呢，但他不是宫雪，至少不是我认识的那个宫雪。你好像和他很熟哦。”<p class='chapter_content_read_css'>“他救过我好几次。”南宁听她的暧昧口气立刻反驳。<p class='chapter_content_read_css'>“好吧，那他可就算是你的救星吧。”琴霜七一副失望口吻，“还以为小南宁找到归宿了呢，好失望啊——”<p class='chapter_content_read_css'>“七七，你再说我可要生气了。”南宁被她说的耳根发烫。<p class='chapter_content_read_css'>“好了好了，我不说了。”琴霜七勒住缰绳停在原地，等着落在后面的几人。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>等着温度瞬间上升了有好几度，所有人都觉得闷热的时候，他们才真正到达了滦城。<p class='chapter_content_read_css'>虽然南苧整体一年四季都较为暖和，但是以宁州山脉为界，北边与南边的温度整整差了十度左右，所以除了宁州与商州北部以外，其他地方几乎是不会见到雪的影子，甚至连冰也不会出现。<p class='chapter_content_read_css'>进了城，南宫宁雪让徐管事和行云先将马车和马匹送回府中，他们几人就徒步去顾王府。<p class='chapter_content_read_css'>琴霜七热的不耐烦就拉着南宁去成衣店里买衣服，南宫宁雪他们都有准备好轻质透气的衣衫所以并不怕热。<p class='chapter_content_read_css'>他们几人跟着琴霜七在各种成衣店中乱逛，南宁是知道她的脾气的，不找到称心如意的衣服绝对不会罢休，也只能认命的跟在她后面。南宁稍微慢了几步站到南宫宁雪旁边，虽然看他没有一丝烦躁的意思，但还是不好意思道：“真是抱歉，七七她就是特别喜欢逛街，如果南宫公子还有别的事情，我们就自己去顾王府就好。”<p class='chapter_content_read_css'>“没关系，秦姑娘好像也很热。”南宫宁雪掏出一方帕子，“秦姑娘不介意用吧？”<p class='chapter_content_read_css'>“我有……”南宁刚想说她有帕子，但是一掏袖筒，没有，她面色一僵，不会是被阿阳拿去了吧？<p class='chapter_content_read_css'>“秦姑娘怎么了？”<p class='chapter_content_read_css'>“没事，我想起来有事要和七七讲了。”南宁快步追上琴霜七。<p class='chapter_content_read_css'>“啊。”南宫宁雪将帕子收回，微微捏了一下手指。<p class='chapter_content_read_css'>“这件怎么样，南宁。”琴霜七挑了件素色罗衫在南宁面前晃晃。<p class='chapter_content_read_css'>“嗯，还不错。”南宁点点头，不得不说七七挑的每件衣服都很入她的眼。<p class='chapter_content_read_css'>“那就赶快去试试吧。”琴霜七不由分说地把她推进试衣间。<p class='chapter_content_read_css'>等了有整整一刻钟南宁才慢慢吞吞地出来。<p class='chapter_content_read_css'>所有人都是呆住，早晨的时候琴霜七给她绾了个简单的发髻，只簪了那支素色木槿钗，原本南宁穿着粉色的齐胸儒裙只觉得平平淡淡，如今换了一身素色罗衫却闪住了众人的眼睛。裙摆上的木槿花像是活起来了一般，努力盛开着慢慢攀上腰线，对襟的荷花边落在锁骨上显得愈发妖娆。一小段手臂在轻薄的袖衫下若隐若现。<p class='chapter_content_read_css'>“是不是不好看？我马上……”南宁被琴霜七一把搂过来，“哪有，果然白色最配南宁了，南宁最漂亮对不对？”<p class='chapter_content_read_css'>琴霜七朝南宫宁雪和木梓眨眨眼。<p class='chapter_content_read_css'>“确实是，第一次见秦姑娘穿白色的裙裳，非常漂亮。”不擅长夸人的南宫宁雪竟也发自肺腑的一声赞叹。<p class='chapter_content_read_css'>“啊，还不错，以后秦小妹就穿白色的裙子好了，省的整天那一片粉色在眼前晃来晃去。”木梓还是很嘴硬。<p class='chapter_content_read_css'>“没错，就穿着一身好了，到时候我再给你做一身，小case。”琴霜七说着就掏出自己的荷包付钱，南宁伸手拦住她，她扔扔荷包，表示很有分量，“放心，我现在可是土豪哦，不光是在现代哦。”<p class='chapter_content_read_css'>“好了，接下来就要到顾王府去了！”琴霜七豪气地一拍南宁。<p class='chapter_content_read_css'>“嗯。”南宁努力挤出一个笑容，希望会很顺利。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351942&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351942&&novelId=15670'">下一章</div>
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
