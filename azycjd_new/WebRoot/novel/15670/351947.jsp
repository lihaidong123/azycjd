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
    <title>（三十四）信中秘密唯你知 我的心意有谁知</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351947&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351947&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351947+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三十四）信中秘密唯你知 我的心意有谁知]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351947')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351947 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351947,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第35章&nbsp;&nbsp;&nbsp;（三十四）信中秘密唯你知 我的心意有谁知
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			 晏紫荆猛然合上信纸，二哥好奇地想要抢过信纸，被晏紫荆一巴掌推开。<p class='chapter_content_read_css'>  “怎么了？难道这信上有什么不能让二哥我知道的内容吗？”二哥一脸奸笑，“哎呀呀，莫非是——唔。”<p class='chapter_content_read_css'>  一个红豆包子被硬塞进二哥嘴中，晏紫荆边把信藏进里衣里，一边拿着红豆包子说道：“你看二哥，这可是我专门为你从李娘家买的红豆包子，你看，还是热的呢，你尝尝哈。”<p class='chapter_content_read_css'>  二哥被包子噎得呜呜直叫，想说的话一句也说不出来。<p class='chapter_content_read_css'>  晏母看着他们兄妹打闹掩面闷笑，又抓过阿南的手轻抚，“你看，我们家其实没有那么多规矩，你也就随意就好。其实我还是很担心紫荆的终身大事啊，她今年都已经十七岁了啊。”<p class='chapter_content_read_css'>  阿南在心里默默说了句不用担心，而且看晏紫荆的反应，她也大概知道信是谁写的了。<p class='chapter_content_read_css'>  晏紫荆吵嚷了半天可算把二哥的注意力从信上移开，吃完晚饭她熟练地从后院的西墙翻出去，脚刚刚落地就听到二哥极其独特的笑声。<p class='chapter_content_read_css'>“哎呀呀，紫荆你以为就用几个红豆包子、桃花酥、芙蓉饼、脆鸭香、茴香馒头和蒸饺就可以让我忘记那封信吗？你还是太天真了，哦哈哈哈哈。”二哥笑的一脸灿烂，一手抓过阴影处的阿南，阿南有些局促不安，狠狠低着头不敢看晏紫荆。<p class='chapter_content_read_css'>“啊——”晏紫荆看着二哥拉长单音节，一手搂过阿南，“二哥，你是不是又哄骗人家小姑娘了？我一猜就是。”<p class='chapter_content_read_css'>“哎呀呀，怎么能是哄骗呢？我只不过是从阿南口里了解你的情况而已啦。”二哥搂过晏紫荆，丹凤眼一挑，“我这不是关心我妹妹嘛，我妹妹在外面认识了陌生男人，还莫名其妙跟人家告白，我不得帮我妹妹好好审查审查啊，啊？”<p class='chapter_content_read_css'>“二哥。”晏紫荆刨了他一眼，“二哥你还是回家吧，我都跟他约好了，我一个人去的。”<p class='chapter_content_read_css'>“约好？没关系，我就在后面远远地跟着，绝对不会打扰到你们俩的，怎么样？”<p class='chapter_content_read_css'>晏紫荆审视了他好半天，才不情不愿地答应了。<p class='chapter_content_read_css'>“好吧，你要远远的跟着，要是让他发现你，我就——”晏紫荆恶狠狠地挥挥拳头。<p class='chapter_content_read_css'>“好好。”二哥弯腰做双手投降状。<p class='chapter_content_read_css'>晏紫荆不再管他，一心只想着公孙翎，嘴角扬起笑容，快步向信中的地点走去，慢慢变成了飞奔。<p class='chapter_content_read_css'>远远的就看见了公孙翎。<p class='chapter_content_read_css'>晏紫荆直接跳起来，双臂搂住他的脖子整个人都悬在他身上晃呀晃的。<p class='chapter_content_read_css'>“翎怎么这么快就到孚城岛了，不是说要处理滦城的一些事吗？”<p class='chapter_content_read_css'>公孙翎把她从身上扒下来，揉揉她的脑袋，笑道：“我办事可是很快的，又坐的西渡口的船，可比你坐的东渡口的船省了好多路，大概午时的时候就到了，你呢？”<p class='chapter_content_read_css'>“我申时才到的家嗳，早知道我就跟你一起回来了。”晏紫荆万分后悔地嘟囔着。<p class='chapter_content_read_css'>“好啦，你是吃完饭出来的？”<p class='chapter_content_read_css'>“当然啦，不过你为什么不要让我对其他人说起你？”<p class='chapter_content_read_css'>公孙翎眼神含笑的望着她：“傻丫头，就算你再大大咧咧也毕竟是个姑娘家，这种事传出去对你的声誉不好，明白了吗？”<p class='chapter_content_read_css'>晏紫荆被他弹了一下脑门，傻乎乎的笑了两下。<p class='chapter_content_read_css'>“走吧，我可是初来乍到，你这个东道主不得好好带我逛逛？”公孙翎将手掩到广袖下，晏紫荆以为他不愿意牵自己，心中立刻低落，只好不甘心的拽住他的袖角拉着他往前走。<p class='chapter_content_read_css'>公孙翎从后面扯住住她的发辫，晏紫荆吃痛回头瞪他。他拂开她的手，好笑的将手拿出，将准备好的面纱给她戴上，“这样就不怕别人认出来了。”<p class='chapter_content_read_css'>晏紫荆腾地红了脸，她摸摸发烫的脸颊，她想，幸亏是晚上否则还不丢脸死了。<p class='chapter_content_read_css'>“好了，这样可以走了。”公孙翎将她的手包在自己的手掌内，晏紫荆心里就像装了只兔子，“砰砰”跳个不停，像是一下子就会跳到喉咙口。<p class='chapter_content_read_css'>然而她完全忘记了在后面跟着自己的二哥，直到和公孙翎分开，突然出现的二哥还吓了她一跳。<p class='chapter_content_read_css'>二哥收敛了以往玩世不恭的笑容而是用一种很复杂的眼神看着她，直到看的她心里发毛才猛然笑出声。<p class='chapter_content_read_css'>如果那时她能问下去好了，如果那时她能看懂二哥的眼神就好了，可惜，她什么也没问，懂的又很晚。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>之后和公孙翎的相处也是让晏紫荆觉得既平淡又很甜蜜。<p class='chapter_content_read_css'>公孙翎也答应会娶晏紫荆，并将自己的信物交予她，那天夜里她将环玉扣在手心里睡了一夜，她以为她能很是开心的等着公孙翎来提亲，但是，这是什么情况！<p class='chapter_content_read_css'>绝对是她爹和那两个哥哥干的好事！她一个世外高人的徒弟竟然被三个加起来武功都不如她的人给绑起来了！这让她怎么对得起她师父的在天……啊！不对，师父他老人家还健在啊，罪过罪过……<p class='chapter_content_read_css'>晏紫荆整个人眼前漆黑一片，思考了半天才发觉是被蒙上了黑布，而不是被关小黑屋。使劲晃晃脑袋想让脑袋清醒过来，身体往上拱了拱应该是抵住了墙。<p class='chapter_content_read_css'>就听见一个慢吞吞的脚步声向她走来，她一下子就知道了是谁。<p class='chapter_content_read_css'>“小、小姐。”一贯软糯糯的声音怎么会让人听不出？<p class='chapter_content_read_css'>竟然连阿南都是帮凶，这个世界真让人绝望！晏紫荆一个字还都没有吐出来，她身下就一阵晃动，接连有东西砸到她身上，脑袋撞到硬物再次昏了过去。<p class='chapter_content_read_css'>时间回到几天前，二哥告诉晏紫荆爹和大哥在为她置办嫁妆。<p class='chapter_content_read_css'>晏紫荆有些吃惊，难道是公孙翎来提亲了？但是她怎么一点信儿也没听到呢？她缠着二哥让他说是怎么了，但二哥是闭口不谈。<p class='chapter_content_read_css'>她也急了眼，偷偷到她爹那里探探口风。她爹那里不成又跑到大哥那里，不过她也没想到一向老实巴交的大哥竟然也学二哥那样给她卖关子。<p class='chapter_content_read_css'>晏紫荆最后还是在阿南的望风下在她爹的书房里找到了缘由。<p class='chapter_content_read_css'>她只将那函书狠狠往地上一扫，怒气冲冲的抬腿就要出门，忽然顿住，又将函书一把捞起来，才撒开脚丫子在宅子里狂奔，最后终于在仓库门口找到她爹和大哥。<p class='chapter_content_read_css'>还没她说话她爹就让数十个家丁直接将她捆上了，她其实还反抗了好一阵但最终败阵于人家的车轮战。<p class='chapter_content_read_css'>“紫荆，你也老大不小了，这次选妃你还是乖乖去吧。”大哥蹲在她面前，好声相劝到。<p class='chapter_content_read_css'>“哼，我一辈子不嫁我也不去选什么破妃，更何况我唔唔唔！”一团不知是何物的东西被塞进晏紫荆嘴里，顺带着她也被她二哥抗进房间里，她无法反抗的躺在床上死死盯着二哥。<p class='chapter_content_read_css'>“哎呀呀，紫荆不要这么凶的看着我，去选妃又不会怎样，你以为以你的身姿难道可以成功进得了皇宫大门吗？哎呀，就算进去了，以你女红女红不会，写诗写诗不会，三从四德不会，《女戒》啥的又没看过，你以为你可以选上么？你还是老老实实去吧，也好让爹和大哥死了心。”<p class='chapter_content_read_css'>二哥好笑的看着她，“放心，你嫁不出去二哥以后养你，哈哈，别担心了。”<p class='chapter_content_read_css'>他说完人已经到了门口，“啪”的把门关上又“咔”的落了锁，晏紫荆整颗心都落到了谷底。<p class='chapter_content_read_css'>啊啊啊！他这到底是在劝慰她还是在损她啊！<p class='chapter_content_read_css'>真是的，二哥他明知道有翎了还这样！晏紫荆看着门板半天，又望了望窗子。窗子的话……啊！<p class='chapter_content_read_css'>她正想着跳窗逃跑就听到两扇窗户齐齐落锁的声音。<p class='chapter_content_read_css'>二哥的身影落在窗纸上，手里还在把玩着钥匙，晏紫荆无语默默翻身面对墙闭上眼，心中好似有无数草泥马践踏而过。<p class='chapter_content_read_css'>靠！看她出来了不狠狠揍他一顿！<p class='chapter_content_read_css'>不过她这个愿望一直都没有实现，虽然她从家里逃出来了。<p class='chapter_content_read_css'>入夜，晏紫荆半睡半醒之际被人从床上拖下来，没错是拖下来，晏紫荆发觉这个情况的时候她已经半个身子在地上了，而且是头先着的地，就着从窗口洒下的微弱的月光她看清了那人的脸。<p class='chapter_content_read_css'>清秀的脸上满满的汗珠，咬着嘴唇两只胳膊架在她腋下正费劲的往后拖着她，晏紫荆很明显的看到了她两腿都在打颤。<p class='chapter_content_read_css'>“阿南，你在干吗？”晏紫荆终于受不了了，挑着眉毛问道。<p class='chapter_content_read_css'>“啊。”阿南轻叫一下不禁往后退了一步，架在晏紫荆腋下的双手也抽了出来，晏紫荆整个人披头散发的栽到地上。<p class='chapter_content_read_css'>“小、小姐，你，你怎么，怎么醒了？”阿南哆哆嗦嗦的把她扶起来。<p class='chapter_content_read_css'>“你弄出这么大的动静我想不醒也难。”晏紫荆坐在床边揉揉被磕痛的后脑勺，才发现原本绑着自己的麻绳都被割烂塞到了床底下，她皱着眉扯过阿南的手，果然是密密麻麻的红印子。<p class='chapter_content_read_css'>“小、小姐，快走吧，老爷，少爷们都睡着了。”阿南慌忙指向被打开的窗户。<p class='chapter_content_read_css'>“好，你也跟我一起走。”晏紫荆扯过她，跳窗而出，然后——在亲爱的大地上滚了两滚。<p class='chapter_content_read_css'>再晏紫荆然后又看到阿南腰上挂着的一串钥匙，“不会有房门上的钥匙吧？”<p class='chapter_content_read_css'>阿南乖乖点了点头。<p class='chapter_content_read_css'>晏紫荆扶额，所以说，为什么她们要跳窗出来啊……<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351947&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351947&&novelId=15670'">下一章</div>
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
