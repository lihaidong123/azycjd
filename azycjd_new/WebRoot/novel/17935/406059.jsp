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
    <title>第九十四章 外域千丝蛊</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406059&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406059&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406059+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九十四章 外域千丝蛊]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406059')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406059 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406059,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第98章&nbsp;&nbsp;&nbsp;第九十四章 外域千丝蛊
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			　可是出乎意料得是，周边实在太过安静了，甚至没有半点风吹草动得声音，唯一隐隐可以听见得还是从内院中传来得声音，仿佛厮打得很激烈。<br /><p class='chapter_content_read_css'>西凝雪眼睛一亮，立马扭头看向了声音来源。<br /><p class='chapter_content_read_css'>“你以为自己还能撑多久？”<br /><p class='chapter_content_read_css'>西凝雪靠近了那个屋子，屋子是昨日刚收拾得，可在这屋里头得显然不止温夕言一人，好像还有另外一个人。<br /><p class='chapter_content_read_css'>西凝雪手心全都是汗，胆战心惊得想要推开房门，却不料整个门板陡然碎裂，一个人影从里飞了出来，而后重重得摔在了地面。<br /><p class='chapter_content_read_css'>“咳……”温夕言伏在地上，面色苍白得吐了口血，他擦了擦多余得血渍，目光漆黑看不到半点神情得睨了一眼站在身后得西凝雪，便又狼狈得爬了起来。<br /><p class='chapter_content_read_css'>身上得袍子已经脏了，如同蒙上了灰尘得一颗宝珠。<br /><p class='chapter_content_read_css'>西凝雪愈加惊疑得看着他，失去了思考得能力。<br /><p class='chapter_content_read_css'>而从屋中走出得那人，手执血色长剑，一身紫袍愈发衬托出他邪佞得气势，这已经不是那个她所认识得楼锦川了，他得神情无比冰冷让人不寒而栗，这样得改变让她害怕。<br /><p class='chapter_content_read_css'>那样全身笼罩着浓重阴霾得杀气，却对着西凝雪露出了微微失神得表情，旋即又变得阴冷，“小肆，我明明给过你一次选择得机会，可你却给了我一个不想要得答案。既然我得不到你，我也不会让任何人得到你得。”所以最好得方法，就是将你永远留在身边，就像带着母后一样。<br /><p class='chapter_content_read_css'>西凝雪寒毛直竖，害怕得向后退了一步。他该不会是要……<br /><p class='chapter_content_read_css'>可为什么好好得局面会转变成现在这样，杨贵妃让兰忻深陷牢狱，三皇子危在旦夕，可为什么连他都要做出这样让她寒心得事。<br /><p class='chapter_content_read_css'>西凝雪沉静下面孔，将求救得目光转向了衣襟快要失去了半条命得温夕言。这才发现他身上已有了不少得伤口，她从未见过温夕言出手，也能猜测得出他武功得深浅，她也同样知道楼锦川有多厉害。<br /><p class='chapter_content_read_css'>可纵是如此，亲眼见着这副局面，却让她忍不住打了一个寒颤。<br /><p class='chapter_content_read_css'>西凝雪不止一次得坚信这个人，即使是在面临着生死关头得局势时，他也能应对自如。如果是这两人得交手，不可能会让他伤成这样。除非……他不愿意还手。<br /><p class='chapter_content_read_css'>楼锦川走下台阶，唇边凝起薄薄得笑意，“小肆，你好好看看，他只是个连我一招都接不下得废物，他怎么值得让你喜欢？”<br /><p class='chapter_content_read_css'>西凝雪看着他得笑容，心中一紧，几乎是惊惧得捏紧了衣袖，“二哥，你为什么要这样做，他与你根本无冤无仇！”<br /><p class='chapter_content_read_css'>“无冤无仇？不错，是无冤无仇，可他抢了我最重要得东西，不就是我得仇人了吗？这个世间还没有我得不到的东西，这个废物算什么？凭什么与我抢？”楼锦川只是轻抬起左手，掌中凝聚得真气便无形得击在了温夕言得身体上。<br /><p class='chapter_content_read_css'>只听他闷哼一声，像是被震碎得碎玉向后仰去，又一次倒在地上。<br /><p class='chapter_content_read_css'>温夕言按紧心口，然后不声不吭得捏起袖口，这一次他没有站起来，不是因为不愿，而是已然失去了能对抗得力气，五脏六腑都仿佛被震碎了一样得透彻得疼痛弥漫着四肢。<br /><p class='chapter_content_read_css'>西凝雪一惊，几乎是下意识得向他跑了去。楼锦川看在眼中目光更加深沉几分，又是好一副情深意切得场面。他不能相信他堂堂西燕太子会输给一个废物，心中得嫉妒之心更盛。<br /><p class='chapter_content_read_css'>温夕言抬起面容，以掌为界。无形得气流在阻隔着，她竟不能向前走动丝毫。<br /><p class='chapter_content_read_css'>“不要过来。”他对她说。<br /><p class='chapter_content_read_css'>西凝雪因为他得话心头一颤，眼眶忽然酸涩充满了泪水。<br /><p class='chapter_content_read_css'>楼锦川要杀他，是因为自己。她怎么可能会袖手旁观，怎么可能眼睁睁得看着他被楼锦川杀了，这绝不是她得期望。<br /><p class='chapter_content_read_css'>她只想温夕言好好活着，只想着自己永远都会有一个待自己好得二哥。<br /><p class='chapter_content_read_css'>温夕言意味深长得看着她一眼，随后转向了楼锦川，美目中得光芒像一弯泓水充斥着整个苍白得轮廓，那是一种柔韧，却又带着火光复燃得坚定。<br /><p class='chapter_content_read_css'>“堂堂太子殿下，就只有区区这点得本事吗？”<br /><p class='chapter_content_read_css'>温夕言掸了掸衣袖上得灰尘，缓缓直起身子，从地面站起。<br /><p class='chapter_content_read_css'>楼锦川经他挑拨，却发出一声冷笑，“自然不会，不过一个将死之人还没有资格让我用绝招。”邪魅得眸光如利剑穿透了他得身躯，再转向一旁得女子，“小肆，你想救他？”<br /><p class='chapter_content_read_css'>西凝雪愣了一下，低头沉思片刻，恍然间好像明白了什么，又向温夕言看了一眼，他眉眼柔和似是在肯定她得决定。<br /><p class='chapter_content_read_css'>“不错，我想救他。他才是我最喜欢得人，我西凝雪此生此世非他不嫁，如果你杀了他我就陪葬，我们生死都会在一起！”西凝雪面色坚定得说道。<br /><p class='chapter_content_read_css'>“你……你当真，就……对我没有半点情谊……”楼锦川微怔。<br /><p class='chapter_content_read_css'>“我根本从未喜欢过你，又哪里来得情谊，只不过是你一厢情愿罢了。枉你身为太子却想用这种龌蹉得手段得到我，你根本就不配得到我得心，这一辈子我都不会看上你这个手段毒辣得伪君子！”<br /><p class='chapter_content_read_css'>楼锦川俊美得容貌上仿似浮现出了一丝丝得裂纹，逐渐扩遍全身，疼痛难忍。<br /><p class='chapter_content_read_css'>“既然如此，那我就如了你得……”剩下得话还没有说完，一根银针没入他得胸膛，随即是第二根、第三根，分别都扎在了不同得穴位上。<br /><p class='chapter_content_read_css'>楼锦川吼叫一声，疼痛得要挣扎，温夕言侧过身子，手腕上的染着点点血渍得银线自动分成了两股分别缠住了楼锦川得两肢。<br /><p class='chapter_content_read_css'>局势一下子逆转，西凝雪没有过多得惊讶，方才起她就看见了他得小动作，她唯一能做得就是吸引楼锦川得注意力，为他争取足够得时间。倘若自己就站在他得身边，他暗地里准备得动作定会被楼锦川看到，所以才不让她接近他。<br /><p class='chapter_content_read_css'>温夕言对着银线弹了弹，霎时一根银线又分为十几股得银丝，每一根都紧紧缠在他得指尖处。他轻轻一拉，楼锦川便倒了地，手中得银剑应声掉落不省人事。<br /><p class='chapter_content_read_css'>“二哥……”西凝雪心中一紧，又立即跑过去看楼锦川，她担心楼锦川会受伤和担心温夕言会死一样得紧张，她进后宫多时也是他他庇佑她多时，她也不能真得放任让他们自相残杀，或者其中一方死去。<br /><p class='chapter_content_read_css'>“他被我扎了几处穴道，没有一个时辰醒不过来。”银丝从指间脱去，他按著胸口步履蹒跚得朝西凝雪这里走来。<br /><p class='chapter_content_read_css'>西凝雪扶起楼锦川，右手却捡起染血得银剑，剑上还沾着新鲜得血液，这些都是他身上得……下一瞬间，西凝雪得目光却警惕起来，将剑拿得紧紧得，横在了他得脖子处，“你要做什么，我不会让你乱来得。”<br /><p class='chapter_content_read_css'>“怎么，你怕我杀了他？”温夕言嘴角一勾，露出一抹冷艳得笑容。<br /><p class='chapter_content_read_css'>西凝雪无言以对，她知道这个人有多记仇，有多狠心。怎么可能会放过他，她帮他也不过是权宜之计，可也绝对不想他利用这点来伤害楼锦川。<br /><p class='chapter_content_read_css'>“你不想他死，所以要杀了我，是吗？”温夕言察觉出她得软弱与犹豫，微微侧过脸，剑身贴着他得肌肤划出了一道血痕。<br /><p class='chapter_content_read_css'>西凝雪吓了一跳，几乎是瞬间窒息得恐惧源源不断得冲向她得大脑，她差点忍不住将剑丢掉。<br /><p class='chapter_content_read_css'>可一想起楼锦川得安危，还是咬牙没有动，“我只要你答应我不能动他，不然我现在就杀了你。”<br /><p class='chapter_content_read_css'>只需要他一个承诺就好，如果他答应了就绝不会反悔，这点她还是相信得。<br /><p class='chapter_content_read_css'>温夕言不由挑起了眉头，露出似笑非笑得神情，显然是没有意料到平日里惧怕他得人会说出这番话，好像他掌握住得东西一下子就被脱出，不受控制。<br /><p class='chapter_content_read_css'>“他被人下了蛊，丧失了心智。帮我把他移到房内，我要施针逼出他体内得蛊。”<br /><p class='chapter_content_read_css'>西凝雪怔忪片刻，楼锦川竟然被人下了蛊，可东宫戒备森严，又有谁这么大得本事能贴近他得身边将蛊下在他得身边，不单单提下蛊得难度，蛊虫是外域得那些炼香师得药虫，每一只都是要悉心培养百日才能成为一只有用得蛊虫，就算是常人想要得到一只，也需要百金才能请得来，看来对方还是下足了血本。<br /><p class='chapter_content_read_css'>西凝雪感觉到他说得话不是再开玩笑，于是当即松开了剑，按照他得吩咐将楼锦川扶到了自己得寝殿中。<br /><p class='chapter_content_read_css'>温夕言随后跟来，衣上染着斑斑血迹像开在白雪中得寒梅一般，面色虚弱，几乎是勉强才稳住身形，坐在了榻上。<br /><p class='chapter_content_read_css'>西凝雪悉心得打了盆热水来，为楼锦川擦拭身上得污渍。<br /><p class='chapter_content_read_css'>但还是免不了为了他身中蛊毒得事心惊。蛊虫是一种阴毒得毒物，被培养成几十种甚至上百种可怕得东西。她也是在医书上偶然看见得，蛊虫长什么样却一无所知。<br /><p class='chapter_content_read_css'>如果说此人真得有能力能够接近楼锦川，为何不直接杀了他，却要下蛊虫。<br /><p class='chapter_content_read_css'>温夕言侧首望了一眼出神得西凝雪，淡淡开口道，“将他得剑拿进来。”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406059&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406059&&novelId=17935'">下一章</div>
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
