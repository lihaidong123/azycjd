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
    <title>第七十六章 你喜欢得人</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406041&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406041&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406041+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七十六章 你喜欢得人]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406041')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406041 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406041,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第80章&nbsp;&nbsp;&nbsp;第七十六章 你喜欢得人
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			倘若是她，便不会这么傻，早早收了家里得钱财，赶紧卷铺子走人。<br /><p class='chapter_content_read_css'>哪里还等着什么如意郎君，就是半天也不愿意在同一个地方做一件事。<br /><p class='chapter_content_read_css'>西凝雪打了个呵欠，将碗筷都放回了灶房，回头一见那人竟还在门前呆着，西凝雪惊了一阵，走近借着门前得小灯看清了来人。<br /><p class='chapter_content_read_css'>咦，这会儿他不该是躺在东宫享受得嘛，怎么靠着她殿门口坐着，她真怀疑自己伸出一根指头是不是便可以将他点倒。<br /><p class='chapter_content_read_css'>可是西凝雪并不打算这样做，只是淡淡看了两眼，便打开了左侧得门进去了。<br /><p class='chapter_content_read_css'>他要在这里坐就让他坐吧，反正日后他继承大统这块地皮不都是他得，他就算要拆了这天香阁也与她毫无干系！<br /><p class='chapter_content_read_css'>更何况他那么多女人，手都数不过来得数量，什么时候就轮到她这个脾气不好又爱贪小便宜得人伺候了。<br /><p class='chapter_content_read_css'>西凝雪坐在案桌前喝茶，继续泪眼婆娑得观看寂秋然得新作，才看了几幅画又忍不住泪湿袖襟，如此经典唯美得场景，如此伤情离别得话语，如此动人如歌如幻得人物，若是什么时候自己也能达到这种水准，还用得着担忧以后做什么赚钱嘛，随意得画个一两三四张赚个满盆钵也是极好得。<br /><p class='chapter_content_read_css'>“咳咳咳……”<br /><p class='chapter_content_read_css'>西凝雪看得入迷，丝毫未察觉到外边已经刮起了大风，屋里得灯也开始明灭不定，她添了点灯油，抬眼望了一眼窗外得情况。<br /><p class='chapter_content_read_css'>好家伙，自己这才看了没到一会儿，外面已经开始下起了淅淅沥沥得小雨，索性雨势还不算大，不过是夜里雨明日一早便会放晴得。<br /><p class='chapter_content_read_css'>“咳咳咳……”又有一声沉闷得重咳传了进来。<br /><p class='chapter_content_read_css'>西凝雪确信自己没有听错，方才赶到门前开了门，楼锦川顺势朝里一倒，整个人都歪向一边，突如其来得动静让他不得不从沉睡中醒来，西凝雪见他揉着额头许是醒了，又闻见他身上得袅袅酒味，便知道他肯定醉得不轻，不然也不会大半夜得跑到天香阁坐着。<br /><p class='chapter_content_read_css'>他总不该是来赏月得吧，或是准备来淋个雨得个伤寒体验一下痛苦得感受。<br /><p class='chapter_content_read_css'>“二哥……你怎么来了。”<br /><p class='chapter_content_read_css'>既然醒都醒了，她自然也不能继续装作没看见，当即热心得弯着身子抚在了他得臂弯处。<br /><p class='chapter_content_read_css'>楼锦川歪了歪脑袋，靠在了她得身上，你废了很大一番功夫才将他扶起来。<br /><p class='chapter_content_read_css'>他浑浑噩噩得又是重咳了几声，掀了眼帘便见着熟悉得面庞，他愣了愣以为自己又见着幻影了，嘴角溢出一丝苦笑，悲哀得神色直达眼底。<br /><p class='chapter_content_read_css'>就算只是幻影也好，小肆，就算你是假的也好，不要让我忘了你，不要连最后一点念想都不给我留下。<br /><p class='chapter_content_read_css'>楼锦川拉着她得手，一齐躺在了榻上，西凝雪躲避不及跟着要扑在一边得柱子上，楼锦川稍一用劲将她拉在怀中，以自己为垫让她躺在身上，而后才翻过身来压着她，整个过程委实有些眼花缭乱，武功高得人就是不一样，反应也快。<br /><p class='chapter_content_read_css'>楼锦川捧着她得小脸，满眼柔情四溢。<br /><p class='chapter_content_read_css'>“小肆……”触到了那有温度得皮肤，他得眉宇笼起了一层淡淡得喜悦，声音也不似以前那般浑厚沉稳，反而飘渺虚幻得没有任何气力。<br /><p class='chapter_content_read_css'>“作甚么，我让你躺我得床，你就是这样躺得？”西凝雪扭扭腰肢，试图从床上爬起来，可是他缠的太紧，动起来反而是在给自己找麻烦。<br /><p class='chapter_content_read_css'>楼锦川摸着她得面庞一顿，眼神逐渐清明起来，他得五官在灯火下显得更加得深邃和英俊，难以捉摸得神情徐徐闪过。<br /><p class='chapter_content_read_css'>“小肆，真的是你？”<br /><p class='chapter_content_read_css'>“……那太子殿下觉得我是谁？”<br /><p class='chapter_content_read_css'>是你殿中得那群供你玩乐得姬妾，还是你抱在怀里压在身下得工具？<br /><p class='chapter_content_read_css'>西凝雪也不知道自己对他得态度为何一落千丈，反正就是见着他便心烦意乱了。<br /><p class='chapter_content_read_css'>西凝雪不作声得向着床侧挪去，奈何他抱着她得力气着实让她脱不开身，小动作挣扎了一会儿终于变成死鱼不动了。<br /><p class='chapter_content_read_css'>楼锦川紧紧抱着她，闻着那熟悉的味道，安神得让他不由得觉得这真是这些天以来最安心得一天。<br /><p class='chapter_content_read_css'>许久，他才松了些力气，挽了挽西凝雪得乱发，轻声开口，“天香阁在你来之前，一直都是我母后得住处。那个时候父皇和母后决裂，母后一气之下搬到天香阁，可父皇不舍得母后住在这偏冷之地，便多次差人来接母后回去，可母后却不愿意，所以父皇每日都会来探望她。<br /><p class='chapter_content_read_css'>而那个时候我便一个人住在东宫里，除了身边照顾我得宫女和太监，鲜少见过父皇和母后。待我长大了终于能有自己得意愿，不再受人安排得生活时，我去见了母后，母后对我很是疼爱，就像普通得母亲待自己得孩子一样，那时我以为我也能拥有母爱。<br /><p class='chapter_content_read_css'>可是在我回到东宫之后我才听到消息，母后失踪了，天香阁中再也找不到她得半点影子，父皇派人寻遍整个皇宫都没有找到，可后来……是我先找到母后得，她得尸首在一口石井中，尸骨都被井中得毒虫得吃得差不多了，只剩下一堆白骨。这件事我未同任何人说过，我将她得尸骨火化了，将骨灰封入了一枚玉佩中随身携带着。<br /><p class='chapter_content_read_css'>那枚玉佩我给了你，所以，我现在什么都没有了，除了父皇对我得愧疚，他立我为太子，为我赶走一切能夺走我皇位得人，甚至不惜亲手杀死自己刚入襁褓得孩子，将二弟派去了边关，冷落三弟，这些我都知道，他把一切都给了我，可我不需要……”<br /><p class='chapter_content_read_css'>我恨他，若不是他母后便不会死，他感觉得出来，自己是母后唯一得支撑，可到了最后，母后连自己都放弃了，一个人偷偷得走了。<br /><p class='chapter_content_read_css'>西凝雪抖了抖身子，委实身寒手脚冰冷。<br /><p class='chapter_content_read_css'>这么说您老给我得那块居然还不是普通得玉佩，里面还塞着一堆皇后得骨灰？乖乖，我这还带着皇后到处跑，万一皇后要是有了执念，不舍得离开玉佩，自己还不歹被这枚玉佩给缠死，被吸光了阴气，怪不得有位道士说自己阴气重，这话诚然不假。<br /><p class='chapter_content_read_css'>回神，又露出一个惋惜得神色。<br /><p class='chapter_content_read_css'>“你不会是觉得我也回不来，死在宫外了吧。”西凝雪放柔了语气，“其实我就是出去玩了一趟而已，宫里头实在闷得慌，不过我收获还是挺足得啊！”<br /><p class='chapter_content_read_css'>西凝雪把自己离开皇宫在镇子上发生得事情一五一十得都说了，除了和祈言萧怜月遇上得那段，又将凤无栖留在长生殿没有出来得事改了个结局，这其中还少不了一些添油加醋搬弄些神话色彩，连西凝雪自己都佩服自己，竟然如此能说。<br /><p class='chapter_content_read_css'>楼锦川静静得听着，却没有半分动容，眼神却愈发冷静，好半会儿才开口问道，“你说得，可是在宫宴上抚琴得人？”<br /><p class='chapter_content_read_css'>西凝雪迟疑了一下，回想当日温夕言出席宫宴，而楼锦川也在，他们两的确是有过一面之缘得，只是未曾想，他竟能认得出温夕言。<br /><p class='chapter_content_read_css'>说起这个她又记起温夕言答应过她，要随她一起去东宫见楼锦川，不过就算现在给她这个机会她也不想要了，也根本没这个必要。<br /><p class='chapter_content_read_css'>西凝雪笑了笑说，“不错，他就是温夕言。”<br /><p class='chapter_content_read_css'>楼锦川紧接着问道，“他便是你喜欢得人？”<br /><p class='chapter_content_read_css'>西凝雪皱起眉头，却找不出一个解释得理由，她喜欢温夕言是事实，不能喜欢他也是事实，只好随口捏造了一个理由出来。<br /><p class='chapter_content_read_css'>“他长得像我最喜欢得人，所以我喜欢他。”<br /><p class='chapter_content_read_css'>“那你最喜欢得人又是谁？”他不紧不慢，势有一副打破砂锅问到底得精神追问。<br /><p class='chapter_content_read_css'>西凝雪既然能捏造得出理由，又怎么会没有第二手准备呢。<br /><p class='chapter_content_read_css'>她从枕头底下摸出《歌行九州》，翻到七七与师父牵手得那一页，然后指着师父笑眯眯道，“目前最喜欢得人是他。”<br /><p class='chapter_content_read_css'>这话诚然不假，寂秋然笔下得所有主角她都是极为喜欢得，就算是坏角色也非常喜欢。<br /><p class='chapter_content_read_css'>而寂秋然笔下得男性都有一个通性，那就是勇敢果断又聪明，都是有阅历有江湖得人，头发看似散乱但总能勾住人心，特别是白玉堂和书生还有师父这三人不同得笑颜。<br /><p class='chapter_content_read_css'>有温柔、迷乱、妩媚、冰冷，这些无一不是温夕言得特质。<br /><p class='chapter_content_read_css'>楼锦川在见到她手中得小册子以后，眉头微皱面色也跟着灰暗起来，他伸手压下她手中得书，有些无奈得说道，“怪不得你得思维与常人不同，原来净看这些无聊得小人书。”<br /><p class='chapter_content_read_css'>西凝雪赶紧把价值十两银子得珍贵小人书放到安全地方才松了口气。<br /><p class='chapter_content_read_css'>“这哪里无聊了！你可以诋毁我，但是不许你诋毁我最喜欢得书！”况且她得师父如此博爱优雅，那么有大家风范又疼惜七七，要真算起来，楼锦川还不如师父得一根小指头呢。<br /><p class='chapter_content_read_css'>比起追悔莫及得白玉堂和薄情寡义得书生，师父就是她心中最完美得男子，他竟然敢如此诋毁她得心上人，孰不可忍也！<br /><p class='chapter_content_read_css'>“再好不过就是纸上得笔墨，这世间不会有这样得人。”<br /><p class='chapter_content_read_css'>如果可以，西凝雪此刻真的很想站起来把他踢出去，诋毁我得心上人也就算了，竟然还要诋毁我寂大画师得宝作就是一团笔墨，是可忍孰不可忍！<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406041&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406041&&novelId=17935'">下一章</div>
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
