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
    <title>第八章 软硬都不吃</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405620&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405620&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405620+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第八章 软硬都不吃]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405620')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405620 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405620,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第12章&nbsp;&nbsp;&nbsp;第八章 软硬都不吃
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	好歹她西凝雪也是从一品官员的女儿，真要出了什么事，太尉这官帽压在她身上，她也担不起这个责任。女官这次果然开窍了，把她送回房间说接下来两日在屋里好好休息，不用练习站姿了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪乐得清闲的躺在床上装病，依她来看，女官估计对她能当上什么妃子的位置不抱任何希望了，任她自生自灭去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	可是这光躺着也不是什么事，趁着女官出外西凝雪又跑出来闲逛，原想找云沁聊会天，却见云沁和刘淑妙坐在一块，旁边还有一群女子在吵吵闹闹的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她走近几步，依稀听见了秀女叽叽喳喳你一言我一语的讨论声。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她听不清楚她们在讲什么，也不想前脚装病后脚就被人拆穿，只好偷偷躲在了离亭子里比较近的假山后。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“姐妹们，我看这里最美的就当属淑妙姐姐了，淑妙姐姐以后成了贵人，可别忘了姐妹们啊~”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“就是就是，姐姐生的这般美丽，皇上不动心才怪了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“姐姐排第一，那论美貌谁排第二呢？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“当然是云沁姐啦！云沁姐的姿色可比我们入眼的多。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	一旁正在压腿的秀女插嘴道，“我看不见得，云沁那房里不还有个叫什么雪的吗，我倒觉得她比云沁美多了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“说起来也是。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“不过那女子身娇体弱，刚来就病倒了呢。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁听得又是羞愤又是记恨，她与西凝雪的相貌在相比自然落了下风，可除了相貌，她身上的哪一点比不过西凝雪！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	转瞬间又为了自己的想法感到吃惊，她在胡思乱想什么呢，西凝雪是她从小到大的好姐妹，她怎么能记恨她呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪一言不发的躲在暗处听着，倒不是为了压腿秀女的那句自己排行第二的美貌，而是为了那一句身娇体弱，忍不住喃喃的嘀咕了一声，“我身子壮的很，哪有那么脆弱啊……”再说了，她一顿饭尚能吃五个包子一碗粥，这样的体格还能算身娇体弱吗？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	俯着身子还想多听一阵子，女官的身影从门口踱了进来，西凝雪自然为了不让女官发现自己是在装病，随即就转向了房间狂奔着躺回去装病了，女官神情庄重的走来，身后跟着几队官兵。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“东宫丢失翡翠玉石一块，太子下令盘查皇宫每一处，你们若有消息，尽可通报于我，赏银五十两！”领头的官兵说罢就摆了摆手，让身后的官兵上前来搜查房间。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	几队官兵分别撞入不同的房里，又是翻又是掀的，轮到西凝雪这屋她自然也装不下去的起了身，配合着搜查将衣袖都撩起来给他们看，官兵也只是匆匆望了一两眼就打算离开。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这位大哥，请问发生什么事了？”照理说，这宫中的事，也不应该波及到景秀阁这种地方，若非是某某妃子藏匿在此处或是某某人发现此处有秀女与人私会？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“东宫玉石失窃，你若知道些什么大可告诉于我，还可从我们头手里赚得赏钱。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哦。”西凝雪回答的虽然平淡，但还是在心底惊讶的吊起了一口气。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	玉石什么的她肯定没碰，不过这东宫当属太子的地盘，这太子竟然为了一块玉石大动干戈到处搜查，她倒有些好奇这玉石的事情，西凝雪坐在凳上思考，官兵搜查完统统退了出去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这回景秀阁也是热闹非凡，领兵的人将侍女和所有的秀女叫到了角落里站着，然后女官高调引着太子来到景秀阁，站在角落里的秀女更是眼巴巴的抬头望着，生怕错过了目睹太子容颜的机会。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哎！太子来了，快看！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“啊呀，太子殿下……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	女官冷眼瞥了众人一眼，恨铁不成钢道，“你们还愣着作甚，见着太子还不快快行礼！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“参见太子殿下！”众秀女皆千娇百媚的行了礼。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“免礼。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁一抬头便看见了那穿着蓝衣，神情自然洒脱的人，不禁下意识的要喊出口，但又硬生生的梗在喉处并发出声音。微微皱眉，袖口紧紧的攥在手中。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	此人正是当日在吟风楼和她有过一面之缘的楼小二，当时虽对楼小二出众的才华心悦诚服，但万万没想到此人却是当今的西燕太子，更没有想到，能在景秀阁见到太子殿下。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	吃惊之余，楼锦川的目光便向自己扫来，云沁连忙低头，却还是不妨被他感觉出她的视线，楼锦川并未开口，只是目光越加灼热，似审视又带着几分迷惘。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“太子殿下，在景秀阁并未查出翡翠玉石的下落！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“本宫没这时间陪你们耗，限你们三日，若还未找出半点消息，统统削去官籍，去大理寺服刑。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁站得远自然没听到远处的声音，可她仍免不了在心底迟疑，究竟该不该将这件事情告诉西凝雪，可仔细思索下来，若是西凝雪知道了，万一先一步凭着关系转到太子身边呢？更何况他贵为一国太子，日后便是西燕的皇帝，任谁的选择都该是想和眉目俊朗的人在一起，而不是选择一个前半只脚已经踏入棺材的老头子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但若是不告诉西凝雪，等到了日后难免也会与他相见。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	对于所有事全然不想关注的西凝雪正剥着香蕉皮，眼下这皮被一层一层的剥落，她的心中无限畅快。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	时不时还哼出调子的西凝雪愉悦的吃了一大口，含糊不清的口中嘟囔着她最喜欢的曲儿，连她自个儿也不知道在唱些什么，吃得肚子饱了西凝雪照例躺回床上从包袱里取出诗经。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	封皮自然是中规中矩的，但里面的内容却是不折不扣的画页，还是出自一位西凝雪最膜拜的画师寂秋然之手，那插图和绘页精美无比，每一幅图都栩栩如生般的在她心中落下了不可磨灭的记忆，她还想着日后要是做不成女侠，做个受万人崇拜的画师也好啊。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	闲来无事，这小人书就是她打发时间的好东西了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不过明儿就是那什么什么的太医就要来了，她观望之下又想起自己并没有稳妥的办法能够对付他，自己不过是普通得女子，手脚下也只有点三脚猫的功夫。可西凝雪还是决定要留足精神去对付他，所以只是看了两三眼就又把小人书塞回去了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	如她所料的一丝不差，隔日女官吩咐大家检查身子时也把她喊上了，还说什么她这温病落到那人手里头绝对是药到病除、妙手回春、包治包好。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她反射性的想到，以前一卖狗皮膏药的郎中就这么在街上喊的，她清楚的记着这个郎中最后被百姓围起来狠狠的殴了一顿，开玩笑……药到病除是世外高人的事，而世外高人一定在云里雾里的大山上等着她去拜师，且绝对不会和皇宫的大夫，有一丝一毫的关系。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	照旧在浴池磨到最后一刻，女官知她本就磨磨蹭蹭的，所以就在人都快走光的时候提醒了一句快些出来。西凝雪慢腾腾的擦干净了身子，拾掇完毕后绕到了院子里，用手帕包了一堆泥沙，以便到时候突袭之用。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她已经知晓那个人会武功，也不打算自己这点泥沙真的能够偷袭到他，只是她放下了大话，总要有所行动，不然这就不是她西凝雪的作风了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	晃晃悠悠的踱进了屋里头，虽是恨的牙痒痒，但西凝雪也是个狠人，面上不露一丝一毫的厌烦之情，甚至还笑着将手主动伸出配合把脉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	帘中之人更是静的出奇，除了这一道缠在手上的银线在微妙的抖动着，西凝雪惊奇的发现自己的呼吸也不由自主的减小了，她有些紧张，莫名的紧张，总有一种感觉在告诉她，如果真的要动手，会发生什么不可挽救的事情，但如非他事先挑衅自己，她也不会走到现在这一步。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“姑娘脉象平稳，并无大碍。”有点怀念的音，当然，西凝雪已经迫不及待的想要听他撕心裂肺的扯着嗓子狂吼，光是想想就有趣。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	银线微动，西凝雪出其不意的用左手拉住了银线，与此同时银线正飞速的向帘中一撤，刹时如刀割般的刺痛从掌心传来，她本想用劲去拽着那根线，却不成想他这么不怜香惜玉，下手那么狠！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪低眸看了一眼掌中被勒出的血痕，表情变得凌厉起来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	既然你如此，也别怪我西凝雪辣手摧花，呸，摧狗屎！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我看还是开个方子给姑娘治治才好。”声如止水。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你……这点小伤我才没有放在眼里！”西凝雪恶狠狠地扯出另一条巾帕包住了手，不过是小伤口，过几日就会好，她也不必要为了这点小伤就让他出手相救自己。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我说的是脑子。”声音停顿了一下，又道，“我若再用点劲，姑娘的手指怕是会一个不留。如此作为，非常人所用。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪顿时气的脸色发绿，不经思考就起身掀帘子要动手，这一次此人非但不阻，还主动的掀了帘子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	于是她的小手就挥到了他的肩头，泥沙一点点的落到了他的白衣上，虽弄脏了衣襟，但那点污泥却似一副正在流动的山水画覆印在他如雪般洁白的衣上，反而增添了一股别样的魅惑。她的动作就此停住，他动作轻柔的掸了掸衣上的泥沙，笑容温和的抬头，宝石般闪亮透明的黑眸散着淡淡的流光溢彩。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“姑娘，三日之后，我还会来的。”他如是这样说道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	等西凝雪从那张美貌中把魂带回来，才发现自己全身动不了，使劲的一提劲，手腕处微微的刺痛让她注意到竟有根银针不偏不倚的插在她能看见的地方，而始作俑者俨然已经带着东西跑路了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	一边为自己沉迷美色而追悔莫及，一边为这个卑鄙的混蛋竟然动手更加愤恨，她想了想，这个暂且称之为脾气不好没心没肺的小美人可以归类为小人了，没有半点谦谦君子当有的礼数，而且所作所为太对不起自己的相貌了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	长着一张这么好看的脸，居然干这种坑蒙拐骗且暗地里这么阴险狡诈的勾当，连西凝雪都开始心痛了，亏她刚才竟然那么丢脸跟花痴一样盯着他。耻辱！耻辱啊！脾气不好没心没肺的小美人，你给本姑娘等着，下次！下次我一定克服自己把你的脸划烂！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	女官进来已经是半个时辰之后的事了，她一副恨铁不成钢的模样瞪了西凝雪许久，西凝雪也不甘示弱得回瞪。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我听温太医说有个秀女要对他动武……就是你啊。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪转着眼睛看女官绕圈，心想这小人果真是卑鄙无耻，居然临走还要陷害她一把，而这女官明知故问分明是在看她的笑话，她气愤的想着，自己堂堂太尉之女未来江湖上响当当得一号人物，怎么出师未捷身先死的栽到了这个大夫手里头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“啪！”女官凌厉的一巴掌落下，这是西凝雪从小到大受到的第一个巴掌，没顾着西凝雪吃痛的表情，女官一副丑恶嘴脸的骂道，“别的人你得罪也就罢了，偏是此人你一万个开罪不起，人家温太医可是太后跟前的红人，堂堂三皇子锦仁殿下的太傅，多少人求着盼着都望巴结得，我打你也是为了让你脑子清醒点，在宫里不是什么人都能惹的！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪只感觉脸都要被扇歪到一边的疼痛，顿时火冒三丈的紧咬着牙，若不是银针还在，她一定要把这个十恶不赦动用私刑的薛翠花一掌打出西燕皇宫。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	还有那个小肚鸡肠脾气不好没心没肺的瘟神，借着女官之手报复完她弄脏他衣服的事，她都深刻的记下了！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“还敢瞪着我是吧？！你还瞪！”女官突兀的呵斥，转瞬间冷笑道，“你瞪也没用，自己惹的祸就歹担起责任，今个你就好好呆在这房里思考明白，若是还想不出自己哪里错，我这还有更好的手段等着呢。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪撇过头态度强硬的哼了一声。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	打了她一巴掌还要她安分的认错？她做不到！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	眼瞪着女官离开了房间，还有那哗啦哗啦落锁的声，就这么把房门牢牢的锁住了，这样就算有人可怜她想将她救出来，但没有女官手里头的钥匙也是白费心思。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	于是西凝雪就保持这一副丢泥沙的模样，站的身子都酸了，腿都发软了，但心中憎恨丝毫不减的和这枚银针僵持了一夜。<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405620&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405620&&novelId=17935'">下一章</div>
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
