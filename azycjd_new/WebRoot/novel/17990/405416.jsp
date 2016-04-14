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
    <title>第十一章【嫁妆】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405416&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405416&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405416+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第十一章【嫁妆】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405416')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405416 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405416,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第11章&nbsp;&nbsp;&nbsp;第十一章【嫁妆】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; &nbsp;“你先下去吧！”如今那边刚刚要了安氏的嫁妆，自己这边在传出杖毙婢女的事情，这不是明摆着告诉邵渊戎自己有所不满嘛，她眼皮子还没那么浅。于是让锦玥先行退下，捡回一条命的锦玥急忙叩头，“奴婢谢过夫人！”说完，连滚带爬的从地上起身退了出去，靠在外间的门上，锦玥劫后余生的拍了拍自己的胸口，夫人的心狠手辣从来都不是摆在明面上的，只是暗地里使一些伎俩。她到现在还记得之前伺候前头夫人安氏的绿荷，被夫人收买后，帮夫人传递一些消息，顺便帮安氏的饭食中加一些不好的东西，最后夫人上位，绿荷的下场便是出门采买不慎路遇盗匪，不仅抢了钱财还被人糟蹋了，最后更是赤裸的身体被扔在了市井中，身上的所有痕迹都告诉着众人，在她死前遭受到了怎样非人的对待。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 锦玥知道，那件事情根本就不是意外。因为绿荷想要成为老爷的通房丫头，夫人嘴上答应，但是暗地里却吩咐自己去找舅老爷送了一封信，信中的内容她虽然不知，但是舅老爷却让自己带了一句话给夫人，说是让夫人放心，一切都会给她安排好的。锦玥还记得，当时夫人表情略显狰狞，让绿荷去阎殿给小鬼做通房去吧。于是，过了没多久，绿荷外出采买就遇到了那样的事，锦玥一直以来都小心翼翼的伺候着张氏，生怕哪一天自己就遭遇了不测。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; &nbsp;“贱人，贱人，”张氏斜眼看了邵卿卿一眼，“这是你一个未出阁的女子该说的话吗？让外人听去了你的闺仪还要不要了？”张氏对于这个女儿有些恨铁不成钢，但自己膝下就只有一子一女，女儿再蠢再笨都是自己身上掉下来的一块肉，自己只能慢慢教导。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “这不是在娘亲这儿嘛，女儿不怕！”邵卿卿说着便上前挽着张氏的胳膊，巧笑倩兮的对她撒着娇，灵蛇髻上簪着的赤金挂助钗随着她的动作发出悦耳的声音，一副小儿女的娇态，张氏看着看着也没了脾气，只是拍了拍她嫩白光滑的手背，“你父亲要让那小贱人打理她那短命母亲留给她的嫁妆！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp; “什么？”邵卿卿听到这话立刻向后跳了一步，“父亲怎可如此偏心！”她还看上了那些嫁妆中的一套红宝石的头面，一个炕屏，还有一对青花瓷的摆瓶。其实，那里面有很多东西她都喜欢，母亲也答应过她，那些都会变成她的嫁妆。如今，这眼看到手的东西怎的变成了那个贱人的，“娘亲，我不干！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏自然也是不愿的，可是邵渊戎既然已经发话了，还有她说不的权利吗？张氏眼中的狠厉一闪而过，“放心，那些一定会是你的，如今，就先让邵依依帮你保管一阵子好了！”张氏抬眼便看到了那只一人高的美人瓶，上面的仕女图画的是惟妙惟肖，而安氏嫁妆中的诸多摆件都在自己这屋子中。这要是全都给了那个小贱人，以后到了换季的时候自己拿什么来替换房中的摆件呢。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 夜色渐渐拉开帷幕，轩辕府中的主院花厅摆上了丰富的晚膳，只是轩辕澈整个心都不在这么多的美食上面。用双银箸挑起一根琉璃笋丝，扬州府产的莴笋数量不是很多，这种蔬菜是近两年才从西方国家引进的，生产的也基本上都供应了御膳房。只是，轩辕家乃是金陵国的大家，所以自己的农庄也有生产莴笋，自然将最好的留下来供主人家食用。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; &nbsp;“大哥，明日你是会去的吧？”轩辕澈放下手中银箸，有些不确定的看了轩辕祁一眼，只见对方夹了一筷子清蒸卢鱼正在慢条斯理的剔去上面的小刺，而后缓缓的送入口中，脸上露出满足的神情来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕澈有些无奈的看了自家大哥一眼，感慨自己时运不济的同时再次感叹一下自家大哥的爱好。轩辕祁嗜鱼，一日三餐不羁什么品种什么做法是何口味的鱼，总要有上一条。而他在吃鱼的时候非常专注，不管别人说什么都不会理会。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 知道他这个嗜好还是在一次宫宴上，那好象是十年前的事情了吧。那个时候东边海岸的渔民遭到了倭寇的攻击，国家出动了大量的军士前往剿寇。但是国库银两吃紧，他们的父亲动用了账面上所有能够动用的银两以及家里的现银，总共凑齐了一百万两纹银全都送到了帝王的手中支持国家。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 大军剿寇归来，帝大喜，摆宴庆祝，而后破格允许轩辕家的人饮宴，父亲带了母亲与他们兄弟二人。席间，帝王问了他们很多话，无非就是一些功课学业之类的，一开始都是作为哥哥的轩辕祁恭敬的回答帝王的问题，但等上了一道鱼之后，哥哥再也没有回答帝王的问题。他记得很清楚，父亲急忙起身向帝王告罪，而帝王却只是无所谓的挥了挥手示意无碍，这也是轩辕澈第一次知道哥哥的这个嗜好。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 那个时候，他还以为帝王是一位非常和蔼可亲的人，但到后来见识过帝王翻手为云覆手为雨的雷霆手腕之后他再也不敢如此认为了。只是，轩辕澈私心以为，帝王对待轩辕祁是与众不同的，先不说破例让轩辕祁坐在皇子才能做的靠前的位置上，便是帝王在每次上鱼之前都会不在意的停止谈话，待轩辕祁放下银箸之后，他才会接着问话。虽然帝王每次表现的都很随意，但轩辕澈还是有一种不现实的感觉，那便是帝王在迁就着他的哥哥！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕澈给自己斟了杯酒，清亮的酒水在翠绿的酒杯中也折射出淡雅的绿。将酒杯拿在手中，轻轻晃动杯壁，而后一饮而下，入口微辣，回味绵软带点甘甜，是上好的百年老窖！静静的品酒等待他的哥哥放下筷子。终于，看到轩辕祈放下筷子，用一旁备着的锦帕拭了拭唇角不存在的油渍，而后优雅的用了一盏茶水，抬头看了轩辕澈一眼，“再说吧！”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405416&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405416&&novelId=17990'">下一章</div>
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
