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
    <title>（三十九）仙城大雪降人间 晏家惨遭灭门祸</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351952&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351952&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351952+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三十九）仙城大雪降人间 晏家惨遭灭门祸]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351952')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351952 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351952,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第40章&nbsp;&nbsp;&nbsp;（三十九）仙城大雪降人间 晏家惨遭灭门祸
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			晏紫荆怀孕的时候正是金秋十月，等到次年七月就生下一位帝姬，宫珩为她取名为梦，封为宜芷长公主。再到成亲第四年的四月，晏紫荆再次怀孕，到了寒冬十二月都温暖如春的滦城竟然飘起了鹅毛大雪，就在下雪当夜，晏紫荆生产，诞下一名男婴。<p class='chapter_content_read_css'>“紫荆，你看上天都在眷顾这个孩子，滦城可是从未见过雪影，没想到就在今天下了这么一场大雪。”宫珩将已经洗干净裹好小被子的男婴轻轻抱在怀里，“你说给他起什么名字好呢？”<p class='chapter_content_read_css'>晏紫荆瞧着男婴雪一般净白的肌肤，笑了笑，“就叫他雪好不好？反正雬儿也是带雨的不是吗？”<p class='chapter_content_read_css'>宫雬正是宫珩还是太子的时候的太子妃所生的，只可惜那太子妃在生完宫雬之后就撒手人寰了。<p class='chapter_content_read_css'>“好，那就依紫荆的意思，就叫雪好了，雪，雪……”宫珩一遍遍喊着，喊得晏紫荆也不禁笑了起来，只是她现在的笑不再像以前那样大大咧咧，而是变得分外柔和。<p class='chapter_content_read_css'>自从生了宫梦之后，晏紫荆就开始学习做女红学唱摇篮曲，常常扎的手指上都是小孔连筷子都拿不住，宫珩劝了她几次都被她给驳回了。也多亏了她能坚持下来，才能像现在一样和阿南一边缝着给宫梦和宫雪的衣服一边聊着天。<p class='chapter_content_read_css'>或许是一直在照顾小婴儿的原因，阿南的笑容也变得多了起来，只是还很腼腆，话也慢慢能和人聊上几句，二哥和晏紫荆也一直有书信往来，二哥还明确表示等他靠自己的努力赚到第一桶金的时候他就来向阿南提亲。<p class='chapter_content_read_css'>当她跟阿南说起这事的时候，阿南整个人都恨不得挖个坑把自己埋进去。她和宫珩则是在一旁哈哈直乐。<p class='chapter_content_read_css'>日子一直过得很平淡快乐，就在晏紫荆完全忘掉外婆讲的“皇后的悲惨下场的时候”，噩耗就那样传来了，还被宫珩狠狠压了将近三个月才传到晏紫荆耳朵里。<p class='chapter_content_read_css'>“你们在说什么！”晏紫荆完全不相信这些宫娥在说些什么，什么叫晏家的船队毁了晏家的人全都死在了船上？<p class='chapter_content_read_css'>“皇后娘娘……婢子们只是从别处听说的，娘娘饶命，娘娘饶命。”<p class='chapter_content_read_css'>晏紫荆只觉得眼前一阵阵发黑，随即落入一个怀抱里，她扯住宫珩的衣襟，接近哀求的问道：“她们只是胡说对不对？我爹爹和哥哥们没事的对不对，前些日子二哥才刚和我通过信的，怎么会就没了呢？”<p class='chapter_content_read_css'>“对不起紫荆，我……”宫珩被晏紫荆一把推开。<p class='chapter_content_read_css'>晏紫荆失神的往前走，嘴里喃喃自语：“怎么会？怎么会？二哥怎么会在船上，他明明……是阿南，他要赚钱，他要向阿南提亲……二哥……二哥……”<p class='chapter_content_read_css'>“紫荆，你要是想哭就哭出来吧。”宫珩上前几步将她抱在怀里。<p class='chapter_content_read_css'>晏紫荆抬头看看他，呆呆道：“只有二哥才会这样劝我，别人都只会劝我要坚强，二哥——呜呜呜呜呜呜！”她将头埋在他胸口痛哭起来，她整个人都哭得昏天黑地直接一口气没提上来晕了过去。<p class='chapter_content_read_css'>等晏紫荆清醒过来已是半夜时分，宫珩睁着眼睛躺在她身边。<p class='chapter_content_read_css'>“宫珩，爹爹、大哥和二哥的尸首找到了没有？”晏紫荆也不敢相信自己可以这么平静的说出这句话来。<p class='chapter_content_read_css'>宫珩依旧将她圈在怀里，“我会尽力派人去找的，放心吧。”<p class='chapter_content_read_css'>晏紫荆到没有怕晏家绝后，因为还有一个人跟她流的是同一脉的血，虽然他并不姓晏。<p class='chapter_content_read_css'>“还有两个月就是雪的满岁宴了，你要怎么置办？”晏紫荆忽然扯开了话题。<p class='chapter_content_read_css'>“就和梦儿的一样可以吗？”宫珩软声问道。<p class='chapter_content_read_css'>“嗯。”晏紫荆点点头将脸紧贴着宫珩的胸膛，听着他强劲有力的心跳心情才能平稳一些。<p class='chapter_content_read_css'>宫珩忽然轻轻唱起了晏紫荆一直给孩子们唱的摇篮曲，或许是因为有些跑调，惹得晏紫荆轻轻一笑。<p class='chapter_content_read_css'>“谢谢你，宫珩。”一直陪在我身边。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>宫珩派出军队在汐海里打捞了将近四个月，虽是打捞上一些尸体但全都不是晏家人，晏家人的尸体就这样被卷入大海，再无半点踪迹可循。<p class='chapter_content_read_css'>晏紫荆是一日比一日消沉，甚至连孩子的事也无心管理，她又再一次到了冷宫门口，她是无知觉的到了那里，定睛往前看便是之前的那位老婆婆。<p class='chapter_content_read_css'>“你又迷路到这里来了？”老婆婆依旧拿着扫帚，只是语气比之前要好一些。<p class='chapter_content_read_css'>晏紫荆无力的摇摇头，坐在门口的石阶上。<p class='chapter_content_read_css'>“怎么了？遇到烦心事了？”老婆婆坐到她身边，颇有讽刺意味的说到，“这皇宫里最不缺的就是烦心事和死人。”<p class='chapter_content_read_css'>“婆婆，你之前说的皇后的下场都是真的？”晏紫荆想起那些话都觉得遍体生寒。<p class='chapter_content_read_css'>“你若相信那便是真，你若不信那便是假。”老婆婆又将问题抛给晏紫荆。<p class='chapter_content_read_css'>“我不知道……我不知道……”晏紫荆痛苦地蜷起身子，喃喃低语。<p class='chapter_content_read_css'>“你是——宫珩的皇后。”老婆婆突然道。<p class='chapter_content_read_css'>晏紫荆闷声“嗯”了一下。<p class='chapter_content_read_css'>“姑娘，只怕是你上了贼船了，”老婆婆起身离开，语气晦暗不明，“宫氏之人都是一群薄情寡义之徒……”<p class='chapter_content_read_css'>“薄情寡义……之徒……”晏紫荆默默念叨这一句。<p class='chapter_content_read_css'>那么——宫珩他，也是那样吗？<p class='chapter_content_read_css'>晏紫荆在心里打了个抖。<p class='chapter_content_read_css'>也不知是晏紫荆的心理作用还是老婆婆的话成了真，宫珩果然对她愈来愈冷淡，不仅不和她一起吃饭了也不来她这儿就寝了，一直推脱住在书房。就连宫梦和宫雪他也不来看望了。<p class='chapter_content_read_css'>晏紫荆只觉得害怕恐惧在心里一点点放大，她到底是在怕什么？果然……还是怕死吗？<p class='chapter_content_read_css'>最终也不知道到底是自己的哪个举动被宫珩厌烦了，宫珩就一纸诏书将她关进了冷宫。<p class='chapter_content_read_css'>“我朝的每位皇后都无一例外的住过这里，当然能出去的寥寥无几，就像先皇后都是在冷宫里自杀而亡的……”老婆婆的话就像魔咒一样萦绕在晏紫荆耳边。<p class='chapter_content_read_css'>阿南带着简单的行李和晏紫荆一起到了冷宫，冷宫很大但只有老婆婆一人在打扫，没有一个下人，老婆婆见到她们二人的行头便深深叹了口气，紧接着带她们到了一座有三层高的小楼前面，楼前挂着一个破旧的牌子。<p class='chapter_content_read_css'>“房栱殿”<p class='chapter_content_read_css'>“你们以后就住在这里，住在这里可不比在皇后的凤椒殿那样舒坦，要做好心理准备。”老婆婆好心提醒道。<p class='chapter_content_read_css'>“嗯，婆婆以前说过嘛，这里可是阿鼻地狱啊。”晏紫荆故作轻松的说道，“啊——这里可真安静，可算听不到那些叽叽喳喳的宫娥们的声音了！”<p class='chapter_content_read_css'>“小姐。”阿南这么多年了还是改不了口，一直喊她小姐。<p class='chapter_content_read_css'>“哈，小阿南你忘了吗？我以前可是跟着师父住在深山老林里的，这里可比那里的条件好太多了啊。”晏紫荆像是在说给阿南听，其实是在说给自己听。<p class='chapter_content_read_css'>“你们能有这样的觉悟就好，”老婆婆一边念叨着一边走远，“这次能撑几天呢？三天？不，还是七天吧……”<p class='chapter_content_read_css'>到了晚间出乎晏紫荆的意料，阿南竟然主动请求和她在一起睡，晏紫荆本来还想喊阿南和她一起睡，没想到她们会想到一块去。<p class='chapter_content_read_css'>晏紫荆还是第一次和阿南睡在一起，心里有些小小的雀跃，或许是抱着宫珩睡习惯了，晏紫荆到了后半夜就整个人黏到了阿南身上，像是八爪鱼一样。<p class='chapter_content_read_css'>阿南睡眼朦胧的盯着她，然后在她头上蹭了蹭，两个人就那样像是互相取暖的熊紧紧依偎在一起。<p class='chapter_content_read_css'>到了第二天，却有宫娥将宫梦和宫雪送到冷宫来，宫娥将两个孩子丢到台阶上就走了，宫梦抱着宫雪在台阶上瑟瑟发抖，直到老婆婆照点开门才看见两个小孩子，两个人都被冻的动不了了。<p class='chapter_content_read_css'>晏紫荆一脸心疼的把宫雪抱在怀里给他捂暖，阿南就抱着宫梦，老婆婆给她们点上了炉子。<p class='chapter_content_read_css'>“雪睡着了。”暖了大概有半个时辰宫雪惨白的小脸才变得粉嫩起来，缩在晏紫荆怀里睡着了。<p class='chapter_content_read_css'>“母后，为什么父皇要把我们送到这儿来？还让梦儿和雪在外面挨冻？”宫梦趴在阿南怀里抬头问晏紫荆。<p class='chapter_content_read_css'>晏紫荆见她不解的眼神笑笑道：“因为母后就住在这里，你们父皇想要你们跟母后住在一起啊。”<p class='chapter_content_read_css'>宫梦眨眨眼，“这样啊，梦儿最喜欢听母后唱歌了，母后晚上再唱给梦儿和雪听好不好？”<p class='chapter_content_read_css'>“好。”晏紫荆伸手摸摸她的脑袋。<p class='chapter_content_read_css'>“今年天气真奇怪啊……”在一旁看炉子的老婆婆突然说道。<p class='chapter_content_read_css'>“是啊，今年确实冷得很反常啊，虽然很冷却是没见一点雪影……”晏紫荆哈了一口气，很快就有白雾出现。<p class='chapter_content_read_css'>什么时候她能再见一场雪啊，就像雪出生时的那场雪一样就好了，那时她身边还有一个愿意将肩膀借给她靠的人，现在——只是物是人非罢了。<p class='chapter_content_read_css'>晏紫荆默默叹了口气又重新扬起笑容。<p class='chapter_content_read_css'>“如果再下雪的话，母后就带你和雪去打雪仗好不好？”<p class='chapter_content_read_css'>宫梦的小手紧紧握住晏紫荆的手，开心道：“好啊！母后可要说话算话，来，拉钩钩。”<p class='chapter_content_read_css'>晏紫荆将小指与宫梦的小指连在一起。<p class='chapter_content_read_css'>“拉钩上吊一百年不许变！”<p class='chapter_content_read_css'>不知怎么的，晏紫荆有种想哭的冲动。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351952&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351952&&novelId=15670'">下一章</div>
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
