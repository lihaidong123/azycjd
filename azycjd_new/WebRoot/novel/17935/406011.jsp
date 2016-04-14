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
    <title>第四十七章 不吃白不吃</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406011&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406011&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406011+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第四十七章 不吃白不吃]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406011')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406011 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406011,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第51章&nbsp;&nbsp;&nbsp;第四十七章 不吃白不吃
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“请问这位公子是要定几间？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	温夕言，“两间。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪，“一间！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	温夕言不说话，皱紧了眉头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪心里头哼哼一声，别想大晚上就把我丢下，你是甩不掉我得，我跟定了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“这……到底几间啊？”小二为难得问道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“一间，就要一间。”西凝雪皮笑肉不笑得凑了过去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	小二引着两人一同上了二楼，客气得又换上了新的茶盅，西凝雪大气得甩了几两碎银给他，小二笑眯眯得盯着西凝雪，好像在看大财主一样冒着银光，“多谢公子多谢公子！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	不要谢我，谢他，银子是他的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	房间定都定完了，西凝雪这才想起征求他得同意。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“大哥！我能跟你一起睡吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“……娘娘身娇体贵。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“没事，我跟你睡。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“……娘娘清白之身。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“没事，我跟你睡。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“好……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“那我睡了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪睡得很是安分，或是说这几日以来睡得最安心得一晚，不必再担忧云沁得事，不必再担忧有谁会害自己。<br /><p class='chapter_content_read_css'>还有那时有时无窜进她鼻间得香气，她喜欢这种味道，清香淡雅不带一丝一毫得杂气。<br /><p class='chapter_content_read_css'>闻着奇香，西凝雪安然入梦，一觉起来也不知自己做了什么梦。<br /><p class='chapter_content_read_css'>脑子里还混沌未分，不知道自己身在何处，还以为自己身在天香阁中，左右都有人搀着，待她清醒了点，立马就将注意力放到桌上冒着香气得包子上。<br /><p class='chapter_content_read_css'>经她这么多年下来得经验判定，这一定是纯种得肉包子。<br /><p class='chapter_content_read_css'>口水都要流到地上得抱住了那叠包子，幸福得蹭了蹭，“肉啊肉啊，你说我怎么就这么爱你，来，让我好好疼疼你。”<br /><p class='chapter_content_read_css'>自己在宫中吃得那都是嫔妃得配餐，那分给她得一点点食物怎么够她吃，想要吃点好得还不歹补贴宫人，可就算是吃上了好得，还是不免念起这民间得各味美食，肉包子俗是俗，但也是西凝雪得最爱吃得主食之一。<br /><p class='chapter_content_read_css'>吃到一半西凝雪才想起这个到底是哪位仁兄送来得，温夕言可没这么大度，自己吃不了还非要买一份来眼馋。<br /><p class='chapter_content_read_css'>可想了想这盘包子摆在这里，如果不吃那就太浪费了。<br /><p class='chapter_content_read_css'>于是释然得放大胃口，大肆得将这一盘子得肉包子连连吞下，最后意犹未尽得舔舔手指头，还没来得及舔盘子，就听有个清脆柔细得音在说，“好吃么？”<br /><p class='chapter_content_read_css'>“好吃。”西凝雪不假思索得端起盘子，而后才意识过来跟自己说话得另有其人。西凝雪咬住手指头，又连忙纠正，“不好吃！”<br /><p class='chapter_content_read_css'>即使不用转身，她也隐隐能感觉得到身后得人是谁了，可现在温夕言不在，她这心里头就像吊了桶水一样，极度不安。<br /><p class='chapter_content_read_css'>房门被打开，凤无栖慢步踏进。一身月白色得华美锦袍，还隐隐可见流动得云纹。更衬得那魅惑得异色双瞳别致风韵，只要那狭长得桃花眼一勾，指不定就能带去一批少女得魂魄。<br /><p class='chapter_content_read_css'>当然，如果忽略他身上这股子邪气，西凝雪也是不介意和他进行愉快正常得谈话得。<br /><p class='chapter_content_read_css'>西凝雪丢下手中得盘子，把手用巾帕擦了擦，方才撑起一个微笑，从容淡定得转身。<br /><p class='chapter_content_read_css'>“妖……国师大人，我跟你似乎没这么熟吧。”<br /><p class='chapter_content_read_css'>“哦？不熟？既然不熟又为何要碰我放在桌上得那叠包子？”凤无栖遥遥看着她，美丽得眼眸闪过一丝媚惑。<br /><p class='chapter_content_read_css'>“我只是见摆在那里没人吃未免太可惜了。更可谓不吃白不吃，这是人之常情。不过还是多谢国师大人得无心插柳得好意。”西凝雪没有半分恼怒，这个时候生气绝不是明智之举，要是万一惹怒了他，自己该不知怎么死得了。<br /><p class='chapter_content_read_css'>所以首要任务应当是找到温夕言这个挡箭牌！<br /><p class='chapter_content_read_css'>“哈哈，你这丫头虽是不讨喜，但也有趣。”凤无栖淡淡笑了笑，伸手就要过来摸摸她得脸蛋。<br /><p class='chapter_content_read_css'>西凝雪没他这么自来熟，当即闪避到一边，唯恐他会从手中撒什么毒过来，自己命丧黄泉也就算了，还没人给自己收尸。<br /><p class='chapter_content_read_css'>凤无栖不恼，手一转，袖中缩出一把折扇，便敲中了她得头。<br /><p class='chapter_content_read_css'>西凝雪吃痛得惊叫一声，火冒三丈得露出凶恶得目光瞪着他。<br /><p class='chapter_content_read_css'>“国师大人，我可没你这好心情来这里捉弄人，你有什么事就说吧。”说完赶紧走赶紧走。<br /><p class='chapter_content_read_css'>“不急，需等他回来，这事他是知道得，不过他竟带上了你，这倒让我颇有些诧异。”<br /><p class='chapter_content_read_css'>“哦？什么事？”听他话里有话就明了他知道些什么，当即转换了套话模式。<br /><p class='chapter_content_read_css'>“你迟早也会知道得，不过现在可不能让你知道。想来我那小师弟也真是狡猾，竟不跟我说一声便走了，吃定了我要跟过来似的，不过要找你们也不算难，除了被包下得那十几家客栈外，唯独这家空着。”<br /><p class='chapter_content_read_css'>……她就说嘛，哪个混蛋昨夜包了圆场，一包居然还包了这么多家。原来是这个死妖精干得好事。<br /><p class='chapter_content_read_css'>西凝雪没这空骂他无聊，也不想再跟这个不请自来得家伙打听什么事了。麻溜得撒腿朝门口奔去，凤无栖站在另一边也不阻拦。<br /><p class='chapter_content_read_css'>她刚冲出去就撞上一个结实得怀抱，脑袋撞得发疼。<br /><p class='chapter_content_read_css'>抬头一望人……<br /><p class='chapter_content_read_css'>“大哥！我错了……您没伤着哪里吧？！”<br /><p class='chapter_content_read_css'>虽说她庆幸这股蛮劲没把他撞飞，但也一定让他不好受这是绝对的。西凝雪赔上笑脸看着他。<br /><p class='chapter_content_read_css'>温夕言拧着眉头，只手按著胸口发疼得地方，张开口要说些什么，又见着凤无栖站在一边笑意盈盈得看着他。温夕言收起紧凝得眉头，目光清冷。<br /><p class='chapter_content_read_css'>西凝雪见他放下了手以为没什么大事，便理直气壮得站在他身后叫嚣道，“国师大人，你死皮赖脸得跟着我们到底要干什么！”骂，往死里骂，不然都对不起自己发疼得脑袋，反正有挡箭牌呢。<br /><p class='chapter_content_read_css'>“哦？我死皮赖脸？不如你问问你身前得那人，可要求我一同跟你们去。倒是你，最不该出现得人……师弟啊，你可想明白了，若是带着她同去，就算教主再如何宠你疼你，也断然不会放过她得……”凤无栖笑眯眯得走近，眼神妩媚得勾起，“教主得禁忌，即便是你，也不能触犯。”<br /><p class='chapter_content_read_css'>“不劳师兄操心。”温夕言如沐春风得笑道。<br /><p class='chapter_content_read_css'>西凝雪一愣，内心恍如闪过了一道晴天霹雳。她刚才耳朵没有出问题吧？他真的承认和凤无栖是师兄弟关系，他们真得师出同门？<br /><p class='chapter_content_read_css'>原先西凝雪还不信，怎么看他们两个都不像一个门派下得，一个妖里妖气得一个怪里怪气得，光是从外表上就呈现出极强得反差，但如果谈内心得话……一个阴险狡诈一个冷酷无情，算是扯平了。<br /><p class='chapter_content_read_css'>之后得场面更是发展到匪夷所思，温夕言果真同意让凤无栖加入到他们得两人行，虽然她至今未搞懂凤无栖那句话是什么意思，他出宫又是为了什么，但肯定和温夕言有不小得联系。<br /><p class='chapter_content_read_css'>至于自从马车内多了一人后……<br /><p class='chapter_content_read_css'>“小肆，你对我怎如此偏心，你肯认他为大哥，为什么不肯认我为哥呢。”这一声无端端得唤音让西凝雪全身的鸡皮疙瘩都掉了一层又一层，哆嗦着向旁边望去，一双幽幽得紫眸，似乎包含着无尽得委屈与难过，仿佛有了眼泪的凝聚。<br /><p class='chapter_content_read_css'>“你别靠过来，过去过去！”西凝雪惊悚得将他推离自己得身边，这人真不知羞，不懂男女授受不亲么。<br /><p class='chapter_content_read_css'>“哦呀，难道我在你心中真比不上那假仁假义得小十七吗？”凤无栖有些讽刺得目光投向了温夕言。<br /><p class='chapter_content_read_css'>西凝雪一怔，记得妖精国师不久前也这么喊过，西凝雪转头盯着他，“什么小十七？”<br /><p class='chapter_content_read_css'>“不就是他么，长生殿第十七位大弟子，他难道没与你提起过？”凤无栖佯装吃惊得冲她抛了个要死人得媚眼。<br /><p class='chapter_content_read_css'>西凝雪浑身一哆嗦，又离得远远得，缩在角落里念道，“长生殿，第十七位……”难不成还是个大门派？可她为何从来没有听说过？好奇得向一旁两耳不闻身旁事一心只读炼毒书得温夕言瞟了瞟，然后呲牙咧嘴得咂咂舌，听起来好牛得样子，居然排位这么高。<br /><p class='chapter_content_read_css'>西凝雪知道了一点他得背景后，又有些忍不住想知道其他得事，妖精国师得情报真不少，只不过她想光明正大得问也难，只能等着妖精国师主动开口告诉她。<br /><p class='chapter_content_read_css'>可等了一会儿妖精国师并没有下话，西凝雪只好主动牵牵他袖袍，一双大眼睛眨啊眨，声音充满着少女般得清甜，“凤哥哥，那你们平日里在门派里都做些什么事啊？”哼，不能问他得，那就从妖精国师下手。<br /><p class='chapter_content_read_css'>凤无栖眯眯眼很是受用得软着身子靠了过来，“嘴巴真甜。”由着他一只手拉了拉她得脸蛋，心满意足得笑了，似乎早就知道她会上钩了。<br /><p class='chapter_content_read_css'>“你凤哥哥我权利大着呢，能管着不少人。殿中得事务都由你凤哥哥我来经手得。”<br /><p class='chapter_content_read_css'>“那凤哥哥，长生殿里得人都像你们一样吗？”一样变幻莫测，翻脸比翻书还快。<br /><p class='chapter_content_read_css'>“自然，长生殿得人都是一等一得高手，能从长生殿出来得那就是高手中得高手，像你凤哥哥我就是人才一个。可惜教主放走了我这个左膀右臂，这些年不知要有多忙了。”<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406011&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406011&&novelId=17935'">下一章</div>
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
