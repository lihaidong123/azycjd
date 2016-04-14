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
    <title>第六十九章 智取明月楼2</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406034&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406034&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406034+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第六十九章 智取明月楼2]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406034')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406034 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406034,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第73章&nbsp;&nbsp;&nbsp;第六十九章 智取明月楼2
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	连上天都在有心帮她啊，哈哈哈……西凝雪将糖串捡了起来，然后大摇大摆得走进明月楼，此时那蓝色小球仍是无人可解，所有人都束手无策，唯独明月楼老板笑嘻嘻得鼓励众人上台。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪报了一下姓便大胆得上了台，看着这一身白得儒雅公子，手里竟拿着一串孩提才吃得糖串众说纷纭七嘴八舌得开始讨论西凝雪得来头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	明月楼老板一看是个拿着糖串，比起普通男子还要弱小，估计还未行成人之礼得少年。不由有些嗤笑得用手推了推他，“这位小哥年纪轻轻还是不要来凑大人得热闹，以免到时候输了银子，付不出来那可就……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪将早已准备好得一两银子丢入他的手中，明月楼老板一脸笑意得凑了上来，“这位小哥，可是要一试？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪白了他一眼，她人都站上来了目的还不明显吗？难不成他真以为自己是来简简单单送银两得？！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪面无表情得开口道，“老板，我能先问一下，你们楼外贴着的那红联上说，只需连过三关便可获赏银千两，这是否属实？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那是当然，只要你能过得了我明月楼得三大奇关，我李大贵决不食言，一千两银子如数奉上，但你若是失败了，交上得这一两银子可就作为挑战费用归我所有，小哥可明白了？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“很好。”西凝雪朗朗一笑，嘴角微扬，然后当着众人得面将糖串上得蚂蚁小心翼翼得取了几只下来，一手捏着蚂蚁一手将糖串递给明月楼老板，“麻烦帮我扔了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	众人更是对西凝雪故弄玄虚得动作感到可笑，一个身材瘦小得少年儿郎怎么可能解得了那奇关，然而西凝雪接下来得举动却让现场鸦雀无声起来。只有站在前排得人才能看清楚西凝雪得动作，后面得人也不知为何一同静了下来，不敢声张。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪撩起衣袖，任蚂蚁在手上爬着，然后全神贯注得将那只最大得蚁后用细绳子绑了起来，一边手吊着细绳，截断了多余得部分将正在到处乱爬得几只蚂蚁都纷纷系上了细线。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	一切都准备好以后，西凝雪将几只小蚂蚁通通都塞进了洞口，她则轻松得将细绳摁在球上，让蚁后挂在出口处。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	几只拴上线得蚂蚁纷纷开始行动，二寸长得三根红线都一前一后得开始扯动，西凝雪也聚精会神得盯着那几条缓缓移动得细线。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她挑的都是些适中得小蚂蚁，如果太小会拖不动细线，如果太大这些蚂蚁是绝对不会如她所愿乖乖托线的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	而蚁后和蚂蚁得关系就相当一个大人和一群孩子一样，小孩子在尚未学会所有知识前就会一直依赖着大人，但如果是已经成年得大人就会有自主意识，也会一点点脱离蚁后得领导独立。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	为了保证绝对得胜利，她用了三只，就算发生意外这三只蚂蚁也不可能统统都发生事情。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	时间一分一秒得过去了，被托着的细线越来越短了，只见那三只小蚂蚁同一时间从出口钻了出来，她一手截断蚂蚁身上得细线，将三根绳头一并拉出。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“老板，这穿线得一关我过了，那么第二关呢？”望了望目瞪口呆得明月楼老板，她笑眯眯的说道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她不期望自己真得能拿到那千两银子，不过解谜得乐趣她倒是挺喜欢的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	所有人都沉寂了一段时间，而后响起雷鸣般得掌声。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“了不得了不得啊。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这位小哥可真是个奇才！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“爷爷得居然这么简单就可以穿过去了，我怎么没想到呢！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪面不改色得在明月楼老板眼前挥了挥手，“老板，你不会说话不算话吧，我这才刚解开第一关呢，还有第二关尚未解开呢。”她这话是在提醒他，自己凭着运气破了这蓝色小球，但不一定真的能够一并揭开二、三两关。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	老板这才缓过脸色得说道，“小哥好本事，那么就看小哥是否能过第二关了，来人，上笔墨纸砚。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	什么？笔墨纸砚？西凝雪咽了咽口水，有些焦急得在内心默哀，她也就能动动什么歪才，这真正得作诗吟词，她一定占不到半点好处，更何况她大字都不识许多，哪里能做得出劳什子得破诗。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	现下书台都已经搬过来了，西凝雪只能硬着头皮问道，“老板搬上书台，是不是要我吟诗作对？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“非也非也，这第二关考的是画技，只要小哥在这纸上画出一幅四季图便算小哥过关。不过这时辰只能在一炷香内才算成功，若香燃尽了此关便算作失败。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“一炷香得时间画四季图？这怎么可能！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“对啊，你这分明是难为这个小哥！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	底下一时骂声载道，所有人都在为西凝雪打抱不平而群雄奋起。而西凝雪更是苦着一张脸，开始迷迷糊糊得思索这四季图怎么画，她踌躇不决得思索，一旁的老板将毛笔递了过来，还有专人为她磨起了墨汁。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这位小哥，请！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哦，好。”西凝雪收下笔，蹙紧眉头站在了书台前，她闭上眼焦急得思考四季图究竟为何物，而这一炷香少之又少不等她画完就会消失殆尽吧。台下人也是静静的等待，希望西凝雪能创造出又一个惊喜。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	四季图……四季图……你爷爷的，我见都没见过，也不喜欢欣赏那劳什子得山水画，我怎么知道那是什么鬼玩意儿啊！！！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小哥，这香……可要尽了。”明月楼老板忽得出声，西凝雪本就紧绷得心神更加如紧弦一样被拉得大开，她的手心全是汗，握着毛笔都已经很难了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	无非就是画出一幅叫做四季图得山水画，图她确确实实是没有见过，就算见了放在边上临摹她也画不出来啊。但她想这只是“四季”图而已，西凝雪沉着冷静得面上绽开了一丝放松得笑意，好似清泉在缓缓流动，清澈澄净。<br /><p class='chapter_content_read_css'>她自信得握紧笔杆，仿佛握住了一条会舞动得丝帛，神色自然得在纸上挥洒着墨水，笔落，最后一截香也暗无声息得断了。<br /><p class='chapter_content_read_css'>明月楼老板对她方才悠然自得的笑有些发怵，这会儿只吩咐下人将画纸取走带到了他得手中。他定睛一看，脸色顿时大变，抓着画纸得手都在颤抖。<br /><p class='chapter_content_read_css'>“老板，这四季图画得可妥当？”西凝雪放下毛笔，定定得看向他，眉开眼笑道，“按照你的要求，春夏秋冬四季我都一一画出来了。”<br /><p class='chapter_content_read_css'>底下的人一听她竟然都完成了，不由得个个伸长脖子张望着老板手里得画。<br /><p class='chapter_content_read_css'>明月楼老板抓着画纸抖了半晌，浑身也跟着涨红起来，愤然得将画纸丢下了台。<br /><p class='chapter_content_read_css'>“你！你这哪里能算得上是四季图，我明月楼可不承认！”<br /><p class='chapter_content_read_css'>画纸飘到了台下，底下的人争先恐后的抢着，最后落到一位贵公子手中，大家齐齐将视线转了过去。<br /><p class='chapter_content_read_css'>只见那白纸上写了八个大字，春季、夏季、秋季、冬季，一个不差一个不落，字体秀气婉婉，颇有些游离得手法。<br /><p class='chapter_content_read_css'>这好歹也是西凝雪废了好大一番心思才落笔得，寻常时候她写的鬼画符连她自己都看不懂。<br /><p class='chapter_content_read_css'>这会儿已经让大家都瞧见了那四季图，她也不怕明月楼老板会赖下去了。<br /><p class='chapter_content_read_css'>“这怎么就不算画呢？古有家人才子一笔千金，皇帝得随意提笔得墨宝都是有价无市，只不过是区区提了几句便被那些画家到处追捧，何况老板递给我的是画纸，而不是作诗用得宣纸，怎么……就不算呢？”<br /><p class='chapter_content_read_css'>西凝雪眼底带笑，望向众人，“大家说这理，是对是不对？”<br /><p class='chapter_content_read_css'>“这位小哥说得在理，这白纸黑墨，不是字画又是什么！”<br /><p class='chapter_content_read_css'>“对，是画！”<br /><p class='chapter_content_read_css'>“你们明月楼难不成还要欺负这位小哥，赖账不成？”<br /><p class='chapter_content_read_css'>众人抬哄得跟着参与起热议，所谓水涨船高底气足了，西凝雪更是笃定得扬扬眉，“各位在场得兄台切莫着急，我想先问问这明月楼开设这三大奇关就为了敛财，恶意欺负我们这些贫苦老百姓，这样日后谁还敢来这谎话连篇得明月楼啊！”<br /><p class='chapter_content_read_css'>底下刚在第一关败下阵，输了一两白银得人吼得尤为激烈。<br /><p class='chapter_content_read_css'>明月楼老板脸色红了又白，白了又青，像个调色盘一样变了好多种得颜色，才悻悻开口道，“我明月楼向来是言出必行得啊各位！既然这位小哥连闯二关，我李大贵自然不会食言，最后一关若是过了，一千两我便双手奉上！”<br /><p class='chapter_content_read_css'>西凝雪满意得点了点头，笑道，“那么第三关就请老板快些出题吧。”<br /><p class='chapter_content_read_css'>明月楼老板虽气得不行，但还是压抑住怒火得说道，“这第两关并非由我而出，我只是代为出题罢了。这最后一关就看小哥能不能成功过得了那位公子设下得题了。”<br /><p class='chapter_content_read_css'>西凝雪悠忽凝起了小脸，立马又开始慌乱起来。<br /><p class='chapter_content_read_css'>她没听错吧，这两关已着实费了她好大一番心血，若不是她歪才多，只怕是捉襟见肘。现在要面对真正得出题者，她却没有把握了，对方是人，同自己一样会思考多变。更何况他还是出了那么刁钻得两关之人，自然不好对付。<br /><p class='chapter_content_read_css'>难不成现在就要败在这第三关上了？<br /><p class='chapter_content_read_css'>众人也跟着纷纷期待着这三关，只见明月楼老板气急败坏得甩着袖子，“快去请云三公子，说已经有人破了前两关！”<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406034&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406034&&novelId=17935'">下一章</div>
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
