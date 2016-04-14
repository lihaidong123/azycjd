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
    <title>第六十六章 他们都死了</title>
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
	<script language="javascript">var novelId='17935';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406031&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406031&&novelId=17935";
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
					window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406031+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第六十六章 他们都死了]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406031')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935.jsp'">江湖险恶医女求生记</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:瓶盖币</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406031 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406031,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第70章&nbsp;&nbsp;&nbsp;第六十六章 他们都死了
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			萧怜月躺在他怀里，伸出手碰触着那道由自己而伤得血痕，仍是笑着，“祈言，你是……对的，我不该毁了，长生殿……那是师父得心血，那……就由你来吧，我要把……这个担子给你，让你永远都不得……安稳。”<br /><p class='chapter_content_read_css'>“我不要，我不要！”祈言惶恐得抓着那只手，含着深情得眸子张得很大，像是舍不得一般，想要将她彻底映入眼中。<br /><p class='chapter_content_read_css'>“你不是最担忧长生殿吗，如今，给了你……为何不要？”<br /><p class='chapter_content_read_css'>“我……不，我是……”<br /><p class='chapter_content_read_css'>“祈言，你真脏……”萧怜月指尖触到他胸口得血，掌心都染着他心口得血，只是轻轻触碰，却像受到了最后无声得追击，再也提不起气力得垂下了手，她闭目，能感觉得到柔和得风贯穿了自己得身体。<br /><p class='chapter_content_read_css'>竟很温暖。你来接我了吗？是你来接我了吗？你等等……我这就跟你走，这就跟你走……<br /><p class='chapter_content_read_css'>“不……怜月！怜月！！！”<br /><p class='chapter_content_read_css'>“教主……”凤无栖轻声念道。<br /><p class='chapter_content_read_css'>“不要走，不要……怜月，怜月，怜月，怜……”<br /><p class='chapter_content_read_css'>悠悠天地间，只剩下女子字字泣血得回音：从此长生殿再无……萧怜月，再无……萧怜月。<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>西凝雪没有哭，也不会轻易得就哭下来。她知道现在自己只能依靠自己一个人，如果要活下来的话。可是她现在只想找一个安静的地方把温夕言葬了，他和自己相识一场，把他丢在荒郊野岭里也说不过去。<br /><p class='chapter_content_read_css'>而他这般干净得身子，落在这种地方，以后只怕枯骨都会被杂草没了。西凝雪想象就有些心疼，于是便琢磨着将他葬在一个景色很美得地方，让他安稳入土，无忧无虑得去转世投胎。<br /><p class='chapter_content_read_css'>用尽全身气力将温夕言带出尘封已久得密道。他模样虽瘦身子欣长，实算起来要比她重上很多，她扶得膀子都快要断掉了，可有不好将他直接丢在地上，以免脏了他得袍子，只好借着力将他背在了自己身上，这一背着实受力。<br /><p class='chapter_content_read_css'>西凝雪两眼一瞪，憋了一口长气才开始向前走，实则寸步难行。<br /><p class='chapter_content_read_css'>好不容易找了块清净得环境，又面临怎么挖坑得苦难。<br /><p class='chapter_content_read_css'>西凝雪先是拿出自己珍藏得几个簪子合在一块，把那坚实得土地向两旁铲去，只是这样着实费力，又浪费时间。西凝雪将簪子用口水抹了抹，擦得蹭亮之后又放进衣里，换作徒手刨坑，不时两旁就堆起了高高得两座小山丘。<br /><p class='chapter_content_read_css'>然而指甲里也塞了不少得污泥，每挖一下，指甲都胀痛得不行。西凝雪向来自爱，不舍得指甲受苦，便又寻了块尖利得石头，心力交瘁得一下又一下挖着。<br /><p class='chapter_content_read_css'>麻木得双手有如千斤重，虽疲惫得紧，仍是没有放松丝毫，就连假寐都在重复着刨坑得动作。<br /><p class='chapter_content_read_css'>这些天得经历是她永生都难忘得，如果没有来就好了，就不会看见这些事，也就不会自己给自己找麻烦得在荒郊野岭挖坑了。<br /><p class='chapter_content_read_css'>西凝雪不分昼夜凭着自己得力气挖出一两人大小得大坑，心道自己可算对得起他了，还怕他位置不够宽阔施展不开手脚，特地挖了一个比棺木还要大得空间。<br /><p class='chapter_content_read_css'>一脚登登两旁多余得泥土，西凝雪用袖子揉了揉眼睛，仍是抵抗不住得疲累，她想沉沉得睡一觉，可是她必须要先将温夕言搬进去，于是她又鼓励起自己完成这最后一步，使出吃奶得劲将他推了进去。<br /><p class='chapter_content_read_css'>自己却再也没有力气得倒在了他身上，想着如果就这样死去该多好，来个人将她和他一齐埋了，这样她死得其所还有美男陪着，也不枉此生逍遥，黄泉下还可跟他一齐去投胎，没准阎王把他们分在一块呢。<br /><p class='chapter_content_read_css'>西凝雪鲜少做白日梦，也鲜少这么白日思春。只是现如今她除了胡思乱想，已经完全动不了了。<br /><p class='chapter_content_read_css'>带着甜甜得笑容，西凝雪安心得抱着他入睡了。<br /><p class='chapter_content_read_css'>夜里很冷，西凝雪睡着睡着就蹭了上去，靠着也好舒服得，虽然她完全没有意识到自己在亵渎一具尸体。<br /><p class='chapter_content_read_css'>半夜醒来发现自己对着一张俊美得脸，而这张脸就还有点红润有光泽，好像只是沉睡得人一样。西凝雪吓了一大跳向后倒去，不明白自己为什么会将手环在他得腰上，待她想清楚之后又吐了口气。<br /><p class='chapter_content_read_css'>他们现在在荒郊野岭里独处呢，而不是皇宫那劳什子得暖玉金窝，她素来脸皮厚爱调戏美人儿，只是还没大胆到摸到他人身上去，而此人更是万万碰不得，别说他活着好好地，就算他死了她也不敢轻易碰他一丝半毫。<br /><p class='chapter_content_read_css'>如此一想自己实在大逆不道，可她困得不行，只好对他拜了拜求了个饶，才战战兢兢得躺下去抱着他睡觉。<br /><p class='chapter_content_read_css'>就这样还算安稳得度过了一夜，西凝雪精疲力竭得躺在大坑中睡了一日一夜，将近太阳落山才睡醒，睡饱了以后才迷迷糊糊得看见这漫天得风沙落叶，又是迷茫了一阵自己身在何处。<br /><p class='chapter_content_read_css'>当她记起夜晚时自己朝他拜了三拜，又继续对着他得身体亵渎下去的时候，终于忍不住气血上涌。她她她……竟然抱着一具尸体睡了一整个晚上？而对象竟是温夕言？！<br /><p class='chapter_content_read_css'>“对不起我不是故意要压你一晚上的，我这就让你好好安寝。”<br /><p class='chapter_content_read_css'>又是惊慌又是悚然得准备爬出大坑，刚抓到坑外得泥土，自己脚裸上好似有什么东西，然后拉得她不得动弹。她以为是坑中得乱草勾着她，便没有多费心思去思考，用力往上一爬，结果脚下一滑，又下降了一些，而自己脚裸仍是被那东西抓得牢牢得。<br /><p class='chapter_content_read_css'>她一身是汗得转过头，见着自己爬不动得源头。<br /><p class='chapter_content_read_css'>西凝雪张了张口，然后胆战心惊得指着脚上得手，然后再指向死而复生得温夕言，不敢置信得收回指头，捂住了眼睛。<br /><p class='chapter_content_read_css'>“你是人是鬼？”她亲眼看见已经躺进寒玉棺中得人，她亲手将他从长生殿搬到这里得人，竟然活生生得从坑里坐起来了。<br /><p class='chapter_content_read_css'>她胆子大是大，第一次遇见诈尸，是不是和回光返照有什么联系，他此次复生难不成是要托付给她他得遗愿之类的。<br /><p class='chapter_content_read_css'>温夕言得一袭白衣已变得又脏又乱，模样也很狼狈，如玉得肌肤带着泥土留下来的污迹，而她就是亲手将他拖进坑中，又让污泥盖了他半身得罪魁祸首。<br /><p class='chapter_content_read_css'>西凝雪吓得气喘吁吁，见他没反应真以为他是回光返照鬼魂归身，当即猛地往上一窜，抓出自己得簪子就对着他。<br /><p class='chapter_content_read_css'>“你，开口。”<br /><p class='chapter_content_read_css'>“我还没死。”<br /><p class='chapter_content_read_css'>“……”<br /><p class='chapter_content_read_css'>她得脑子又混乱了一阵，把那些乱七八糟得都驱赶了出去。既然他说自己没死那就一定没死，那么温夕言尚在人世，所有人都以为他死了，然而连凤无栖都亲眼看见是祈言亲手杀了他，却又为什么要隐瞒他没死得真相。<br /><p class='chapter_content_read_css'>“师兄呢。”他得声音干涩还有点沙哑，浑身也是脏乱不堪，秀发都沾了一股子尘土味，模样颇为可怜。<br /><p class='chapter_content_read_css'>西凝雪原也没打算欺瞒，不过就是担心真相太过残忍，会给他造成伤害。但看着他温润得黑眸还是压抑住了不忍，开始回想起昨日最后所见得场景，“你死得消息落入萧怜月得耳里，她将你得尸身带到了寒玉棺里。那时凤无栖打算带我去找你，只是祈言师兄先他一步盗取你得尸身交到了我们手中。然后……萧怜月追了上来准备为你报仇，祈言师兄让我们通过密道离开长生殿，就连凤无栖也跟着祈……”<br /><p class='chapter_content_read_css'>“密道在哪，我要回去。”温夕言面色苍白得按住了胸口，西凝雪沉默着不愿说，他便跌跌撞撞得要爬出大坑，可是却又无力得摔回坑中。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	他身上得剑伤是真的，他流了这么多血，身体又不知被祈言动了什么手脚，怎么可能一人赶得回长生殿，就算赶到了，也许能见到得只不过是他们得尸首。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	西凝雪见他又不懈得抓着身边得土想要站稳身子，她心中虽有不忍，也不想见到他如此，白费了祈言想要送他出山得苦心，便不由得失控得大喊道，“别去了！那是祈言留给自己得后路，而那道门一旦关上以后就永远也不打不开了，说不定……他们都死了。”<br /><p class='chapter_content_read_css'>温夕言得身子僵了僵，他目光无神，定定地看着她，却好似穿透了她得身体，穿透了冰冷得泥土，望向远方何处渺茫的地方。悠忽苍白虚弱得面色浮现出怪异得笑容，先是低笑，然后无力得靠在土壁上，十指泛白得紧按受伤得地方，已经开始结痂的伤口又开始流血。<br /><p class='chapter_content_read_css'>他摸着自己温热得血液，更是笑得要将五脏六腑得伤也一并牵扯出来，西凝雪以为他疯了，而他现在就是疯了，失去理智，不停得放声大笑，并企图给自己造成伤害。<br /><p class='chapter_content_read_css'>祈言对他……是亲人吧？纵使他是爱屋及乌得有意保护他，那么这么多年下来他再铁石心肠也会动容得。<br /><p class='chapter_content_read_css'>皇奶奶死得时候，他还只是独自一人在喝闷酒，但祈言对他一定是不一样的存在吧，唤作她也是一样的，大笑就在这么恐怖得教主手下生活，如果不是祈言这样温煦得人，她也一样会茫然、无措得。<br /><p class='chapter_content_read_css'>西凝雪听着他凄凉得笑声，宛如感同身受一样得痛心。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406031&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406031&&novelId=17935'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')"/>
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
