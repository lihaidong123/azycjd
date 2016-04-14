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
    <title>（三十六）伪装还是心情糟 真相自在迷雾中</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351949&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351949&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351949+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三十六）伪装还是心情糟 真相自在迷雾中]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351949')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351949 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351949,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第37章&nbsp;&nbsp;&nbsp;（三十六）伪装还是心情糟 真相自在迷雾中
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“好了，不要哭了，是我不好，吓到你了。”公孙翎用手指轻轻为她拭去泪水，柔声道歉。<p class='chapter_content_read_css'>晏紫荆抽抽鼻子别过脸去，竟然被他看到她哭了，真是有够丢脸的。<p class='chapter_content_read_css'>“怎么样，这几天还好吗？”公孙翎将她搂在怀里，细心问着。<p class='chapter_content_read_css'>“你说呢！我都在这了，还能好吗？”晏紫荆不满的看着他，“我那天逃出家去找你，你竟然不在回滦城了！你都不知道担心我！”<p class='chapter_content_read_css'>“我有担心你啊，所以才来看你的。”<p class='chapter_content_read_css'>一听他说过来看她这件事，晏紫荆用手指戳着他的脑袋道：“你既然知道我在这儿，那在驿馆的时候你就知道了！你为什么不带我出去！”<p class='chapter_content_read_css'>“因为——”公孙翎忽然敛了笑，“因为我不想让你出去，我要你嫁给皇帝，而你只能是皇后。”<p class='chapter_content_read_css'>“你！你在说什么！”晏紫荆狠狠打在他胸口一下，“你再敢说一遍我就打死你！”<p class='chapter_content_read_css'>公孙翎微微一皱眉，扯过她的胳膊，再次将她抵在墙上，低头俯视她眼中的怒火，“我说，我要让你做皇后。”<p class='chapter_content_read_css'>“你！呜呜唔……”晏紫荆还未骂完就又被公孙翎堵住了唇，知道她被吻得气喘吁吁说不出话来，公孙翎又接着问道。<p class='chapter_content_read_css'>“你知道我是谁吗？公孙翎又是谁吗？”<p class='chapter_content_read_css'>晏紫荆脑袋里一团乱但还是清楚的回答了问题，“公孙翎？公孙？公孙丞相！你是！”<p class='chapter_content_read_css'>“怎么样？知道了吗？知道为什么我要你做皇后了吧？”公孙翎亲昵的蹭蹭晏紫荆的脸颊被她厌恶的躲开。<p class='chapter_content_read_css'>“我没想到你竟然这样骗我！你这个无耻小人！”晏紫荆终于忍不住边哭边骂。<p class='chapter_content_read_css'>“紫荆，我是骗了你对不起，原谅我吧。”公孙翎满怀歉意的抹着她脸上的泪水。而晏紫荆却一口咬上了他的虎口，直到口腔里溢满血腥味也不松口。<p class='chapter_content_read_css'>公孙翎费力的救出自己的手掌，吃痛到整个人都面容扭曲，“紫荆，你冷静点，冷静下来。”<p class='chapter_content_read_css'>“你让我怎么冷静！你这个骗子！你这个无耻小人！早知道本小姐就让你死在那个破山里好了！被野狼吃了都没人管！本小姐就没见过如此厚颜无耻之徒！就算本小姐没读过女戒好歹看过兵法，你以为你想干什么我不知道吗？你不就是想把我送到皇帝床上然后巩固自己的权势吗？你以为因为我喜欢你就会帮你吗！呸！果然我爹说的对，朝堂上就没有一个好东西！尤其是你！我说你怎么这么年轻就当上了一品丞相，原来是当这种勾当当上的！也不知道你到底祸害了多少女子！我怎么就……唔！”晏紫荆正骂的气势汹汹忽然被公孙翎捂上了嘴。<p class='chapter_content_read_css'>公孙翎耷拉着还在流血的左手，再次不怕咬的用右手捂住她的嘴，压低声音道。<p class='chapter_content_read_css'>“紫荆，你是不是误会什么了？”<p class='chapter_content_read_css'>晏紫荆恶狠狠地看着他，她误会个屁了！<p class='chapter_content_read_css'>他忽然松开他的手想要去掏什么东西，结果晏紫荆得了空就想骂，公孙翎一脸无奈的继续用唇堵上她的嘴，一时四目相对。<p class='chapter_content_read_css'>公孙翎从腰间扯下一个物件在晏紫荆面前晃晃，晏紫荆的眼珠紧跟着物件转来转去，虽然屋中灰暗但那物件上像是涂了什么东西发出微弱的荧光，不多时就看清了物件上的字，然后完全石化的看着他。<p class='chapter_content_read_css'>公孙翎松开他的唇，轻叹了一口气，然后无奈笑道。<p class='chapter_content_read_css'>“其实我是……”<p class='chapter_content_read_css'><p class='chapter_content_read_css'>“其实我是来找姐夫的。”木梓在顾白的书房门口被书绘音逮了个正着。<p class='chapter_content_read_css'>书绘音看着他没说话。<p class='chapter_content_read_css'>“哈、哈，我真是来找姐夫的。”木梓继续陈述道。<p class='chapter_content_read_css'>书绘音依旧只是看着他。<p class='chapter_content_read_css'>“书哥，我真的只是——呃，”木梓总感觉书绘音的目光像冰棱一样扎在心里，心虚道，“好吧，其实我就是想溜进姐夫的书房看看，我总觉得姐夫对秦小妹太好了，甚至比我对姐都要好，我就是觉得古怪，听管家说书房里有秘密所以就，就想溜进去看看。”<p class='chapter_content_read_css'>书绘音继续看着他，看了半晌才开口：“你今年多大？”<p class='chapter_content_read_css'>“啊？”木梓心里疑惑问这干嘛，但没敢问出口只能老老实实回答，“过了十月就十六了。”<p class='chapter_content_read_css'>“嗯。”书绘音点点头，自顾自的走开了，留下木梓在原地发呆，所以是刚才怎么了？他只是被书哥看了两眼就老老实实说了实话！啊！<p class='chapter_content_read_css'>木梓默默蹲到地上画着圈圈。<p class='chapter_content_read_css'>木梓忽然站起身看看周围没人，就将魔爪伸向书房门板，就看见几个大字浮现在门上，看完之后木梓被吓得落荒而逃，门板上的字瞬时消失。<p class='chapter_content_read_css'>除了两位当事人，没人知道上面到底写了什么。<p class='chapter_content_read_css'>但这件事确实在木梓心里留下了心理阴影让他不敢再怀疑顾白对南宁的好是为什么。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>晏紫荆脑袋嗡的一声像是炸开了一样，他刚才说了什么？<p class='chapter_content_read_css'>她使劲眨眨眼睛，僵硬的扯着嘴角道：“你不是又在骗人吧？”<p class='chapter_content_read_css'>“紫荆，你看我像是在开玩笑吗？”<p class='chapter_content_read_css'>“像，非常像。”晏紫荆完全忽视了公孙翎，脑洞大开，他刚才说了什么？其实他是宫珩，如果她没记错皇帝一家就是姓宫吧？他、他、他、他竟然就是皇帝！怪不得信誓旦旦地让她做皇后，可是——她不要做皇后啊！世界是没有比皇后更惨的物种了，在她很小的时候她外婆就喜欢给她讲睡前故事，讲的还全是各个国家每朝每代的皇后的故事，她们的下场一个比一个惨，有的是被大火烧死，有的是被灭族流放，有的是被凌迟处死，有甚者还被那啥活活折磨死……<p class='chapter_content_read_css'>“我一定是还没有睡醒，对，没有睡醒！等醒过来我就在家了！我还要狠狠揍二哥一顿呢。”晏紫荆自言自语的躺上床钻进被子里。<p class='chapter_content_read_css'>公孙翎使劲晃了她几下，她还是没有反应，晏紫荆心里神神叨叨，梦梦梦梦梦梦梦梦梦，这只是梦，这只是梦，这只是梦，这只是梦……<p class='chapter_content_read_css'>也不知道何时她晕晕乎乎的睡着了，也不知道何时宫珩也离开了。<p class='chapter_content_read_css'>偷偷躲在被子里的阿南却看见了一切。<p class='chapter_content_read_css'>小、小姐，她要做，皇后了。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>现实就是现实，没有因为谁想让它变成梦境就会变成梦境。<p class='chapter_content_read_css'>宫珩的身份已经告知了晏紫荆，就让宫人们收拾收拾晏紫荆的东西搬到了他的寝宫，所有秀女都羡慕的看着她，而晏紫荆却感觉自己深陷囹圄。<p class='chapter_content_read_css'>原本阿南作为贴身侍女也是要一同过去的，但被晏紫荆强制性留在秀女们住的碧水宫，阿南什么也没说默默点头称喏了。<p class='chapter_content_read_css'>虽然晏紫荆与宫珩同住一室，晏紫荆却觉得两个人隔得无比遥远，早晨宫珩要去上早朝，晏紫荆就在寝宫外面的小花坛旁转转，再坐到花坛边发发呆；中午两人一起吃午饭，宫珩下午去处理政务，晏紫荆就到鸟房里逗逗鸟，再发发呆；晚上两人一起吃晚膳，晚间两人各睡一张床，到了半夜晏紫荆很明显的感到有人爬上了她的床，男人轻轻搂住她的腰，她无法言语只能保持沉默。<p class='chapter_content_read_css'>就这样日复一日的过去，晏紫荆一句话都没同他说过，她有时会梦见一个女子身穿白衣被大火吞噬，每做一次梦她就会离那女子更近一步，心脏也会更痛一分，终于梦境停在只要一步就可以看清女子面目的地方就不再前进。<p class='chapter_content_read_css'>她每次都会一身冷汗的醒来，总有一个声音在不断地告诉她，做皇后就会是这个下场。<p class='chapter_content_read_css'>她自己陷在心里的折磨中无法再前进半步，到底是她爱宫珩多一点儿，还是她的害怕多一点儿？<p class='chapter_content_read_css'>她只想将这样子的日子拖长一点儿来掩盖她内心的犹豫，但是，该来的终究还是会来，怎么也躲不过。那日宫珩下了早朝就说给她一个惊喜，她听的心惊胆战，果然宫珩拿出的是册封皇后的诏书，晏紫荆看着宫珩脸上的笑意只觉得恐怖，她落荒而逃了。<p class='chapter_content_read_css'>她只能去找阿南，她也没有发觉阿南身边有什么人拉起她就跑，好像这样就可以让害怕全部消失。<p class='chapter_content_read_css'>她拉着阿南跑到了一处极其萧条宫殿外，宫殿门扉大开，这儿并不像其他宫殿一样富丽堂皇，而是破旧的、完全没有人气的。<p class='chapter_content_read_css'>“你们是什么人？”一个苍老的声音在耳边响起，两人都是吓了一大跳。<p class='chapter_content_read_css'>“我、我们只是迷路到这里来的。”晏紫荆看着一位老婆婆慢悠悠的从门后走出来，还拿着一把扫帚，看样子是在打扫宫殿。<p class='chapter_content_read_css'>“迷路？真没想到还有人能迷路到这儿。”老婆婆站在门口，眼神犀利的看向她们，“你们还是赶快走吧，这里不是你们这种人可以停留的地方。”说罢就要关门。<p class='chapter_content_read_css'>“为什么？婆婆你能告诉我们这里是哪里吗？”晏紫荆赶忙扶住门扉。<p class='chapter_content_read_css'>“这里？这里当然是阿鼻地狱。”老婆婆阴冷冷的说道。<p class='chapter_content_read_css'>“小、小姐，这里是，冷宫。”阿南弱弱地说道。<p class='chapter_content_read_css'>“冷宫？”晏紫荆听外婆说过，所有被皇帝讨厌的妃子就会住在这里，孤独终老，心里一动，“是不是皇后也会住在这里？”<p class='chapter_content_read_css'>“皇后？”老婆婆被她一问好像也提起了兴头开始说起来，“看来你还真是不知道啊，我朝的每位皇后都无一例外的住过这里，当然能出去的寥寥无几，就像先皇后都是在冷宫里自杀而亡的，而皇后的子嗣更是没有好下场，若是女儿就被派去和亲，若是儿子——就会被杀掉……”<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351949&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351949&&novelId=15670'">下一章</div>
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
