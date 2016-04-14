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
    <title>第三十四章 不会太久得</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405995&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405995&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405995+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第三十四章 不会太久得]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405995')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405995 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405995,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第38章&nbsp;&nbsp;&nbsp;第三十四章 不会太久得
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	可是一想到自己又要到那鸟不拉屎得破地方受罪，心情就不爽起来了。可楼锦川应当也有自己得难处，便又只能乖乖应承道，“好，我等你来接我。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“不会太久的。”楼锦川嘴角扬起了轻笑，笑意直达眼底。他动作轻柔的将她的发丝挽于耳侧。却又像在抚摸珍品，迟迟未收回手，细细得摸着那绸缎似得黑发。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪好奇得打量他得俊颜，同样也伸出手去抓他得头发，由衷赞叹得摸了摸，“二哥出身皇族吃穿用度就是不一样啊，这发质好像比我还好啊，不过老是摸会容易脱发的啊……二哥，你有听我在说吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	会脱发的啊！会脱发的啊！！！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“那本宫可要多摸上几把。”楼锦川如言所做得对着她得头发展开了各种攻势，西凝雪不甘示弱，又拉又拽得将他得头发扯下来几根，然后抓在手里得意得摇晃，“看见没，你脱发了，多吃点瓜果好好补补身体，不然成了秃太子，看谁还怕你。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“小肆，你得胆子可是愈来愈大了。”狭长得双眸微微眯起，他停落在她鬓角得手，猛然拔出了几根青丝。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪疼得叫了一声，幽怨得瞪了他好几眼，才委屈得骂道，“堂堂太子没风度，竟对女子下手，真毒！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“是么……”楼锦川还是那副轻松拿捏任何事得人，他像是掠夺一样拉住她得手，取回了自己得头发，微微低下头，表情认真得玩弄那两咎发丝。“小肆，你可曾听过宫中关于本宫得传言。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“没有。”往宫外奔得时间都是挤出来的，哪里还有空听你的故事。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪好奇得打量他手里头得两咎发丝，那纤长厚实得手正将两咎发丝小心翼翼得缠绕在一起。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	楼锦川抬眸盯了她一眼，而后轻笑道，“说书人得话不假，我的确逼死过一个宫女，那是我得贴身宫女从小就在照料我的起居，她待我很好所以我喜欢她，可后来……她死了，等她答应做我得太子妃第二日，我在湖边找到了她。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	可我不能告诉任何人，我是太子，我不能为了一个小小得宫女而慌张，我的养母杨贵妃派人将她得尸体带去焚化了，最后，她什么都没有留给我。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她告诉我，如果爱一个人，就要将她和自己得头发缠在一起贴身收藏，这样两个人就可以永永远远得在一起再也不会分开，我信她，也信你……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	发丝被缠成了一揪，楼锦川用手帕包住了它，放置在身上。看得西凝雪真是热泪盈眶，二哥，三日了，我头还没来得及洗呢，会发臭的啊！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	然而他显然是没有这些顾虑得，反而愈发温柔得对着她笑，“这个玉佩给你，莫要丢了，它对我很重要。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪被他突然塞过来的东西得举动弄得迷糊起来，既然很重要，干嘛还要给我，要知道我可是标准得爱钱专业户，指不定你得玉佩哪天就……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	不过既然是楼锦川贴身得东西，定是个不凡的宝贝，这到了手得宝贝怎么能再忍痛割爱还回去呢，而且于礼不和。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“好！我会好好收藏得！”不过收藏到别处，也是一样得收藏吧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	楼锦川看着她得目光多了丝溺爱。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“小肆，你答应我，就算没有爱上我，也不许爱上别人。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“……”你当你是月老啊，还能管我喜不喜欢别人。西凝雪暗地里翻了个白眼，然后奉承得点头，“好，我答应你！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	我会争取把温夕言那忘恩负义没心没肺得死王八蛋忘记得。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她到现在都耿耿于怀，就算她公然通知得人是楼锦川，可她闹了这么大得事，他竟一点消息都没有，好歹她也陪在他身边这么多日，给他喂了这么多次得鸡鸭，没有功劳还有苦劳呢，这个混蛋，简直就是杀千刀得！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪重回景秀阁，不想惊扰任何人，也不想动用和楼锦川得关系，她只想默默得等到选秀结束，等楼锦川如约来接她离开。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	过了这么久，景秀阁得每一处还是没有丝毫得变化，不过离开了这么久，西凝雪还是能回忆起自己惨烈得经历。<br /><p class='chapter_content_read_css'>还有自己从前和云沁对付刘淑妙做得那些小儿科得事，现在想来真是感慨颇深。<br /><p class='chapter_content_read_css'>如果没有发生这么多得事情，她甚至都不会再与温夕言接触，更不会认识相处半天整个人都不太正常得国师凤无栖，还有一些连自己想起来都要鄙视自己得事。<br /><p class='chapter_content_read_css'>不过我现在回来了，一切都不一样了，或是说，我可以使一切都变得不一样。<br /><p class='chapter_content_read_css'>走到中途，才听闻自己得房间已经被其它得秀女占住了，偷偷取了墙砖里藏着得蝴蝶玉佩，也就不自讨没趣留在这里抢房间了，慢悠悠得走到湖心亭中呆坐，她正想着该怎么解决这吃喝拉撒得生理问题，正巧就碰上了熟人。<br /><p class='chapter_content_read_css'>薛女官看到她落寞得坐在湖心亭中，本是想生气得冲过去质问这几个月得事，但想起今日太子身边得宫女交代了她不用追究这几个月得事，她当然也不能违背太子的意思，可是也不能放任西凝雪在这里搞特殊待遇。<br /><p class='chapter_content_read_css'>“西凝雪你这个大胆出逃得秀女，现在竟还敢回来，要不是太……现在你早该被处斩了！不要以为你毫发无伤得回来了就没事了，我告诉你没这么便宜得事，外头那关你过得去算你能，可我这关你还没过呢！”薛女官捏着手帕数落了她一顿，那大嗓门吼得震天响。<br /><p class='chapter_content_read_css'>西凝雪也没什么好心情，正想与她来个泼妇骂街，但想了想自己才回来还是不要惹事了，更何况自己的确是凭着楼锦川得关系才逃过了一劫，算起来她说得也不算错。<br /><p class='chapter_content_read_css'>“薛嬷嬷，我知道我不该偷偷离开景秀阁得，那都是我一时糊涂了才做错了事，薛嬷嬷……你说怎么罚我都不会怨你得。”<br /><p class='chapter_content_read_css'>薛女官面色一怔，有些意外往日处理起来这么棘手得人，竟会这么温和得与她讲话，说不准她离开景秀阁真的是因为什么不得已的事吧，这么一想，薛女官的气也少了点。<br /><p class='chapter_content_read_css'>薛女官清了清嗓子，缓缓说道，“你得死罪可免，可在按我这景秀阁里得规矩，小惩小戒还是免不了得，你就给我去佛堂里将佛经抄十遍，每日得饭菜我会叫下人来送，如果你抄好了就可以向下人通报。”<br /><p class='chapter_content_read_css'>佛经？就是那本一寸厚得佛经？！那不是要抄到何年马月吗？！照此说来，在楼锦川来接她离开的时候，她就要整日被变相得囚禁，连和云沁见面得机会都没有了？<br /><p class='chapter_content_read_css'>“薛嬷嬷，能不能……少抄一些，佛经上得东西我又不懂。”<br /><p class='chapter_content_read_css'>薛女官本就不想她出来扰乱景秀阁其他秀女得正常生活，再加上她可是被太子身边人提点得特殊人物，更加不能让她与常人一般天天操劳，除此之外，抄书当然是最好得方法了。<br /><p class='chapter_content_read_css'>“不行！我说了十遍就给我抄十遍，景秀阁中还无人敢……”<br /><p class='chapter_content_read_css'>“我知道薛嬷嬷你也难做，所以我不会让薛嬷嬷为难的。”西凝雪端着一张楚楚可怜得脸，朝薛女官旳手中塞了根最便宜得玉簪子，但是好歹也有十两银子得，这么平白无故花出去，她也只能忍痛割爱了。<br /><p class='chapter_content_read_css'>薛女官推嚷着说了几句还是收下了玉簪子，吃人嘴短拿人手软，这个道理薛女官当然懂，当即眉开眼笑得点点头，“好吧，那就五遍，不能再少了，跟我来吧。”<br /><p class='chapter_content_read_css'>西凝雪被引到了佛堂，说是幽禁也不为过。<br /><p class='chapter_content_read_css'>都说向佛主祈祷心愿，抄写佛经可以平心静气。<br /><p class='chapter_content_read_css'>她正烦闷得慌，带着不妨试试得心态坐到了长案前，自己为自己研了墨，提笔在空白得纸张上认真得抄写了一段经文，西凝雪打了个呵欠又开始抄写第二段得经文。<br /><p class='chapter_content_read_css'>但这劳什子得经文怎么写得尽是她看不懂得奇怪字体，别说平心静气了，她现在可是越写越烦，这段时日所有得烦心事都在脑袋里交替放映着，不遗这片刻宁静得时候。<br /><p class='chapter_content_read_css'>西凝雪适时得放下笔烦躁得揉起了穴道，看来自己与佛主多半是没有缘分了，没有领悟得到这佛经得真谛，烦闷得开了窗，呆望着湛蓝得白日，眼前出现了熟悉得景象。<br /><p class='chapter_content_read_css'>但却模糊得难以辨别真相，又仿佛镜花水月一触即碎。<br /><p class='chapter_content_read_css'>——我发誓，此生此世我慕容瑶绝不会对除了小雪以外的人动心，若有二心，必当天地诛之、无处留身。<br /><p class='chapter_content_read_css'>这么多年了，这句话像刻在记忆里永不磨灭一样，每每寂静得时候它总会出现在脑海里。<br /><p class='chapter_content_read_css'>可是，慕容瑶，若你不来招惹我，若你没有发下此誓，我也不会守身如玉至此，平日里想着能与他人交好，可总记得与你得承诺，我那么信你……可只怕，你早就忘了我吧。<br /><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪坐回床头，轻轻抚摸着精致得蝴蝶玉佩，一条条得纹路，与深色得沟壑，繁杂得纹理。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪将蝴蝶玉佩放在了自己旳右胸口，然后缩成了一团，好像正在感受它得温度。慕容烟，这里有你就好，我真怕我会忘了你，可是，我已经快忘了你得脸，忘了你得笑容了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		还有这个她以为会永久记忆得承诺。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		再不回来……我就嫁人了，我要嫁给英俊无比风度翩翩得君子去，让你回来找我得时候就等着哭吧！<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		对，我要给自己找相公去！<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405995&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405995&&novelId=17935'">下一章</div>
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
