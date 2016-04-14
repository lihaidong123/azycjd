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
    <title>第二十七章【恶毒计划】</title>
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
	<script language="javascript">var novelId='17990';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406317&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406317&&novelId=17990";
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
					window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406317+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十七章【恶毒计划】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406317')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990.jsp'">公子万劫不复之嫡女撩人</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:苏易尘</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406317 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406317,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第29章&nbsp;&nbsp;&nbsp;第二十七章【恶毒计划】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; “以后要是再让我听到你说‘贱人’二字，你就给我乖乖回房抄《女戒》，”张氏看了邵卿卿一眼，果然从她眼中看出了害怕，她这个女儿你不给她下猛料，她都不会长记性，“你给我记住了！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “是，娘亲！”邵卿卿垂首低声应道。但同时她又在内心将邵依依骂了个狗血淋头，若不是她，她怎么可能被母亲如此责罚，哼，自己一定不会让她好活！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “娘亲的好女儿，”打一棒子再给颗甜枣，张氏怕激起邵卿卿的逆反心理，于是这会又将她揽到怀中，语气温柔的劝哄，“你大姐姐已经嫁人了，况且她只是个庶女过继到安氏名下的，根本算不得嫡女，所以……”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “可是娘亲，还有邵依依，”邵卿卿直接打断了张氏的话，语气透着一股不死不休的意味，“她还挡在女儿前面，娘亲，女儿要她死，一定要她死！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “你急什么。”张氏扶着邵卿卿的手，母女二人双双坐到了软塌上，张氏抬首看了唐妈妈一眼，唐妈妈立刻会意，待着房内的众人全都退了下去，而她则守在了邵卿卿的闺房门外，阻止着任何人入内。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏看着屋内闲杂人等都退了下去，这才笑着对邵卿卿道，“你这小丫头，年纪小小的性子怎么那么急，娘亲的话还未说完呢。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “娘亲有好的主意吗？”听到此处，邵卿卿擦干眼泪，俨然已经忘记了刚刚的不快，邵依依若是不在了，那么父亲的视线肯定是要落在自己这唯一嫡出女儿的身上了。于是，邵卿卿面露喜色的继续问道，“娘亲快告诉女儿好不好嘛……”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 就在张氏母女二人密谋之际，邵依依所乘坐的马车终于出了扬州城，车夫调转马头，直接朝北行去，“胜龙寺”在扬州城北五十多里，马车慢行也就两个时辰的车程，所以大家并未着急赶路。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 扬州处在江南水乡，有着天然的湖泊绕城一周，现在马车刚刚踏上石拱桥，邵依依不顾画影的反对执意掀开马车小小窗子上的帘子朝外看去。说来，她来到这里这么久了，从未去外面好好欣赏过美景。话说，她前世一直忙于奔波，执行命令，也从未出去散个心旅个游，如今好不容易有了这个好机会，怎能错过？<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 低垂在湖面的柳梢被风儿轻轻吹起，原本平静的湖面漾起了圈圈涟漪，风儿拂过林梢，枝头微微晃动。凉风袭来，邵依依忍不住的轻轻闭上了双眼，感受着清风拂面的凉爽，去掉夏日的燥热，湖面的水汽使得空气都不那么干燥了，整个人感觉舒服极了！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 但好景不长，短短的几十米桥很快就走完了，邵依依还有些意犹未尽之意，回头看看，心中暗想，以后一定要多多出来走动走动，这样才不会浪费这大好年华。重活一世，邵依依早就抛掉了前世的种种，不是每个人死后都可以one's again，所以她要过属于自己的快乐人生！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 当太阳慢慢移到头顶时，已经看不到扬州城的城貌了，巳时从府中出发的，到现在已是正午时分，邵依依下令众人找个阴凉的地方休息一番之后再行赶路。最后，领头的护卫看到一条河，河边有几颗大树，于是，护卫大掌一挥，众人终于停下了脚步，邵依依也在浣纱的服侍下从马车上走了下来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 后面小一点的车上坐着年龄较小的涟漪与画屏，她们二人下车之后在河边玩耍，然后发现清澈的河水中一尾尾肥美的鱼儿游过，于是两个丫头跑到邵依依跟前软磨硬泡的想要下河捞鱼。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依没怎么考虑就同意了，说实话被涟漪的巧嘴说的她也觉得有些饿了，虽然出发之前才吃过午餐，但现在还是让她们去玩吧。后来，邵依依还是没让两个丫头下河捞鱼，毕竟有那么多的精壮劳力，怎能让妹子下河？于是，两个丫头前去挖些野菜，邵依依点了几个护卫下河了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 就在邵依依这边忙的热火朝天的时候，邵卿卿还在缠着张氏想要知道张氏的具体安排，张氏笑着抚摸邵卿卿的头，语气温柔嘴角含笑，但说出来的话却让她怀中的邵卿卿也不由的抖了抖，“放心，娘亲定叫她这次有去无回！但是娘亲不会直接要了她的命，不然太便宜她了不是？娘亲会让人毁了她的清白。然后，”说到这里张氏冷笑两声，“会毁了她的容貌毒哑她的嗓子，卖去‘怡香院’，去接待那些最肮脏的乞丐。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “娘亲，”邵卿卿到底年少，听到这里就有些不忍心，拽了拽张氏的衣袖，“我们直接要了她的命就好了，不要节外生枝。不然，若是给父亲知道了……”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “怎么，你怕了？”张氏温柔的拂过邵卿卿如花的俏颜：“放心，你父亲他不会发现的。再说，谁让她挡了我乖女儿的前程，只要她再也回不来，你就是这府中唯一的嫡出小姐。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏笑了笑，她甚至能想象邵依依悲惨的模样，她没有告诉她那乖女儿的是，“怡香院”是她娘家大哥暗中置办的产业，这样自己就可以随时去折磨邵依依了。当年让她母亲走了个轻松，如今这些就交给她女儿享受吧。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 本来还有些害怕的邵卿卿一听到“嫡出小姐”四个字，瞬间什么都不怕了，她甚至还想起了那位只有一面之缘的公子，如果自己取代了邵依依的地位，那么那门婚事应该就跑不掉了。想到男子那俊逸的面容，那优雅的姿态，邵卿卿的俏脸顿时通红一片。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “所以，从现在开始，”张氏垂首看了一脸春色的女儿，有些严厉的开口，“我会托人寻个从宫中退下来的嬷嬷来教你规矩，我的女儿以后肯定不止官家夫人的身份。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张家带给她的消息，邵渊戎当初的触怒龙颜并不像表面上看起来那般简单，再看现在今上授予邵轻扬的职位，邵家重返盛京的时机不远了。待到那个时候，谁人不上赶着求取邵府这唯一的嫡出小姐。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 这个时候的邵依依还在大树下乘凉，一旁的画影与浣纱拿着扇子不停的给她扇着凉风。邵依依看着提着个小竹篮的涟漪与画屏欢快的跑来跑去寻找野菜的身影，不自觉的露出了浅笑。这应该就是她上辈子憧憬过的生活，那时候她刚到组织，每天都是无休止的厮杀，每当夜深人静的时候，她就幻想着自己明天就会过上无忧无虑的生活。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依抬眼望向湖面，就看到河中的几个护卫人手一个鱼叉，精准度还蛮高的，一会儿就往岸上扔了十几尾鱼了，还有两个护卫已经将火生起来了，趁着这当口已经开始处理扔上岸的鱼了。然后用新鲜的柳枝条穿起来架到火上开始烤了起来，涟漪与画屏也挖了半篮子野菜，她们竟然还将锅子带了出来，既然锅子都能带出来怎么可能少得了调料呢。看着众人忙碌的样子，邵依依轻轻的闭上了双眸。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 同一时间，远在盛京的轩辕祁根本不顾众人的阻止，一意孤行想要前往扬州，他觉得自己昨日的状态一定与邵家二小姐有关，所以他有些迫不及待的想要见到对方，想要看看对方是否安好。<br /><p class='chapter_content_read_css'>&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕昊虽不同意他的所为，但到底还是没有阻止他，只得帮他安排人手护送他前往扬州。看着载着轩辕祁的马车缓缓离去，轩辕昊转身去了书房，铺好宣纸，提笔写了一封信，让人快马加鞭送去扬州知府的府邸，封面上书：渊戎亲启！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 做完这一切，轩辕昊才放下了心，虽然祁儿他本身功夫很好，但从不在人前显露，所以有很多人都被他温润如玉的外表给骗了，安全方面完全不用他操心。但是他这次的行为让人看不懂，问他，却又什么都问不出来，澈儿虽然跟他一同从扬州回来，但是也没听他说祁儿有什么异常啊？算了，还是去找澈儿，好好的问个清楚。自己的儿子自己清楚，轩辕澈大大咧咧的性格，很多事情他都会选择性遗忘，自己去让他仔细回忆回忆。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 想象是美好的，现实是残酷的，轩辕昊来到轩辕澈的院子，却被告知二少爷偷偷跟着大少爷的马车走了，说是担心大少爷的身体状况，一路上好有个照应。好在轩辕昊早已习惯了自家二子神龙见首不见尾的性子，无奈的摇摇头便离去了，只是在内心默默的为自家长子祈祷一番，希望不要被他二弟折腾疯了。其实，轩辕昊真心多虑了，轩辕澈虽然放荡不羁，个性跳脱，但遇到不喜言谈的兄长，他就乖顺了许多。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “大哥，说实话你是不是对那个邵家小姐念念不忘？”当马车行驶到盛京的南门的时候，轩辕澈趁着停车检查的功夫直接跃进了轩辕祁所在的马车，直接开口打趣道，而后继续以一种自言自语的状态说着，“那姑娘长的又不甚漂亮，大哥怎么会看上她？”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406317&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406317&&novelId=17990'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')"/>
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
