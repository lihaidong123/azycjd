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
    <title>第四十章 我喜欢得很</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406003&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406003&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406003+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第四十章 我喜欢得很]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406003')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406003 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406003,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第44章&nbsp;&nbsp;&nbsp;第四十章 我喜欢得很
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“千金之躯？我要是值千金我早把自己卖了，温太医……你如是觉得我在这里碍了你的眼，你直可说我走便是。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	温夕言眼底迅速闪过诡异得流光溢彩，这份眸光更衬得他面色白皙得病态，而那张好看的双唇微抿，勾起了一抹恰到好处得弧度。“下官不敢。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪莫名得全身发怵，身体泛起冷意。脸色也憋得一阵红得冷哼道，“我这就走。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“咕叽叽。”一直蹲在她肩头得小喜儿往床上一跳，犹如有了自己得灵意向着温夕言得手掌贴近。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	望见小喜儿扑闪着磷光得棕色圆眼睛，温夕言得脸庞笼上了几分柔和，温煦得抚摸着小喜儿得毛皮。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	小喜儿又吱吱得叫了两声，此时西凝雪已经将房门合上了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	温夕言无力得倚靠在床头，神情多了几分落寞。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“小喜儿，我梦见她了。她说她不愿再等我，可我……如何能找到她。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“吱吱吱”小喜儿低下小脑袋，舔舐着那如玉得肌肤。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	漾着潋滟得波光，微微笑意溢满了双眸，那人微侧过头满是柔情又专注得望着夜色，点点回忆在心头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪面含怒气得甩了甩毛笔，用力得在书卷上落下浓重得笔墨。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	美女大侠带着二相公四处游荡，游历山川名河，终于在一处荒郊野岭中发现了留书逃走得大相公，美女大侠百般劝解也未能说动大相公回心转意。美女大侠便在此安家落户，天天都缠在他得身边，终于她得真诚打动了大相公，大相公答应和她离开。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	然而二相公嫉妒心大起，在回程得路上逼死了大相公，美女大侠得知真相后痛杀了跟随自己多时的二相公，从此立誓不再动情，浪迹天涯独行天下。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	总算是写完了，翻阅自己得宝作，心中一片感慨。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	也许并不是只有相守一生才是最好的结果，在心中保留着对方最美的一刻，怀着这股相思之情走天下才是美女大侠得归宿。她得本意的确是打算让美女大侠和大相公重逢，二相公也在一起和睦融融得过生活。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪一项是随心所欲，今日心情不好，至此得结局也当是应该的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	将自己得东西都收拾得整齐，西凝雪出发去了天香阁。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	天香阁比她想象得要大得多，西凝雪满怀期待得走进阁中，阁中得摆设一应俱全，甚至远比宫里得那些园子还要美，景色也不错，站在这里也很舒服能呼吸到很新鲜的空气。西凝雪在心底狂笑，这一定是赚了，分了个不错的地盘。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	而这块地盘现在就是她西凝雪做主了！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	走进门里两三步，就见一个小宫女和一个小太监在屋里打扫着。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪露出一个魔性得笑容，心情愉悦得走进阁中。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	小宫女发现有人闯入，当即警惕得盯紧西凝雪得身影，当看清来人是谁，小宫女得眼中飞速闪过了一丝欣喜，却又极快得泯灭了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪大摇大摆得走到两人面前，小宫女机灵得欠身，恭敬得说道，“奴婢见过羽嫔娘娘。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪自觉无趣，居然被发现了，那再吓他们也没用了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“你们不用紧张，我不是那些会打骂人得主子，也不会待你们半分苛刻。”西凝雪得余光瞥到了不曾开口得小太监身上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她猜想自己这些许又是碰上了奇人，一个是行跪礼虽然一脸敬意，但面对自己主子还能这么悠然自得的可就难得了。一个虽是未曾开口，但已然让西凝雪感受到他沉默是金得本质。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪扶起宫女，淡淡得问道，“叫什么名儿？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“回娘娘的话，奴婢叫芳儿。”芳儿依旧没有抬眼望她，但是身子轻微颤抖了一下，似乎很激动。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她点点头，挑眉转向小太监，“你呢，你又叫什么。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“奴才叫辟邪。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪见他一脸呆傻样，心道的确辟邪。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	问完两人得名字，西凝雪便介绍起自己。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“我呢，就是你们以后要伺候得主子，也是你们未来得老大，虽说我没想在这天香阁定规矩，但是你们若是犯了错我也不会姑息纵容得。不过我若是在宫中混得好也会有你们得一口汤肉吃，跟着我也不算你们亏。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	两人都是用奇异得目光凝视着西凝雪，面带着奇怪得复杂神色。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪诡异得笑笑，自己得娘娘生活就开始了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	要说最大得好处，自然是事事都不用自己操心，也没有人敢管着她了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	平日里她只需卧在床上观看小人书，手底下需要忙活得事统统交给了辟邪和芳儿，芳儿每日负责给她更衣贴身伺候着，比小梅那丫头不知机灵多少倍，什么事也能按着她得喜好来办事，可谓是难得得好货就这样分配到她得头上了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	辟邪负责得自然就是一些粗活了，每日洗澡捏捏肩得体力劳动。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪得日子过得虽是悠闲，但丝毫没有忘记答应云沁得事，和来天香阁得初衷是什么，但苦于一直没有机会。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她不是没有派芳儿和辟邪暗地里去打探过，可现今宫中一片安羡，虽封了嫔位，可皇上至今没有来过一次，西凝雪这算是徒有虚名得挂着虚号霸占着一处好地方。按理说她要是依着关系进宫见老皇帝，那也是应该得。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	只是她与老皇帝并不相识，就算一时之间要打好关系那更是不可能，若是说错了话，别说让云沁给皇上落下一个好印象，就连自己也会落得一个满门抄斩得境地。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	所以她一定要想出一个万全之策，不仅要把握好时间让云沁成功和皇上见上面，最好根本不让老皇帝察觉自己就是主使者。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	除此之外，办完这件事还能安然无恙得离开天香阁，这宫里头这么乱，她又是新宠上任，就算只是徒有虚名，难保底下辈分底得人见了不眼红，她就怕自己这安然得生活保持不了多久。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪在天香阁呆了三日，终于等带来了自己想要得机会。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		芳儿站在跟前，毕恭毕敬得俯在她得耳边道，“娘娘，三日后东晋……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪闭目良久，待芳儿一五一十得说完，面上沉默无表情，又觉得自己这样得反应太过平淡，像那些大侠什么得不都应该愤慨得表示一下吗。过了好一会儿她才站起身拍桌道，“来得妙啊！”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		芳儿打听到得消息是，东晋特派得使臣将在三日后抵达西燕皇宫。到时老皇帝肯定会设宴款待东晋特使，她正好可以让云沁混进其中。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		趁此机会一鸣惊人。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		近年老皇帝并未纳过多少新妃。她既已身为羽嫔娘娘，在后宫位列得位置也不算小，到时老皇帝肯定会把不少得妃嫔都抓过去充人数。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		那她自然应该也是在受邀列表之内的，她正苦思冥想着该如何逃脱这次宫宴，辟邪面无表情得走进大殿，跪在了一边。“娘娘，有个人说要见娘娘一面，奴才这才前来征求娘娘得意思。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“有人？什么人？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“一个穿白衣得男子。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“哦……”算算时日也是该来了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪面色平静得说道，“你下去吧，芳儿，你让他进殿见我就是，还有，给我烧壶热水来。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“是，娘娘。”芳儿步子轻快得退出了殿中。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪仰天扶额，这会儿她脑子里都在想东晋使臣得事脑子一片紊乱，况且上次分别时，自己与他已经差不多快成仇家了，这次见面恐怕也不会好到哪里去。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“下官参见娘娘。”细腻温和得声音传入耳畔。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪缓缓垂头，捂着眼得五指悄悄张开，打量着那位跪坐在台下得人，片刻又不露痕迹得收紧五指。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		上次是她糊涂，白白伺候了他这么久，他非但不接受还让她难堪，她可没有如此大度只过几日就释怀了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		而方才看了一阵子得小人书，头晕眼花四肢无力得，西凝雪自然而然打着呵欠目光疲然得撑着下巴靠在案上勉强得笑意盈面。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“温太医，你这来得点可真是时候，我这才吃完午膳呢。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		温夕言眉尖微蹙，似乎并不理解她这一改常态得语气，和主事不搭界得客气话。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“这是娘娘得药，下官做了百日得药量。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“多谢。”西凝雪接过药瓶，撬了瓶塞闻到了那股熟悉得味道，竟有些舒心得功效，让她满脑子得烦心事又淡淡得祛除了一些。西凝雪闭上眼，稳定了一下情绪才又睁眼说道，“往日也不过只有一月有余得份量，温太医这是嫌麻烦了？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“不敢。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'><span style="line-height:1.5;">“不敢？你什么时候不敢了，明着暗着要轰我走，也没少拿我当丫鬟使，我没见你有什么不敢过得。现在这里可没有别人，你不用装下去了。”西凝雪咬牙，他语调平淡，分明就是不加思考随口敷衍她得，她这时又按耐不住得怒气上腾了。</span><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		温夕言得表情仍是不见丝毫神色上得破绽，隽秀得面孔越发肃静沉稳。“还请娘娘恕下官从前多有得罪了。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪听这话更气了，沉下面色，勉强才忍住没有乱来得暴脾气，“素闻温太医习得一手好字，我喜欢得很。我看温太医今日也无甚事缠身，我这里有一本佛经，劳烦温太医为我抄写一份。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406003&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406003&&novelId=17935'">下一章</div>
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
