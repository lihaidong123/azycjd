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
    <title>第六十八章 智取明月楼</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406033&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406033&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406033+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第六十八章 智取明月楼]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406033')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406033 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406033,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第72章&nbsp;&nbsp;&nbsp;第六十八章 智取明月楼
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	但有了银两以后果真方便了许多，先是找了家客栈，然后舒舒服服得泡了一个热水澡，换上了新买得干净衣裳，最后就是饱餐一顿了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	现在市集才开始热闹，市集得小商贩们一个个才露面吆喝着，西凝雪站在窗前享受着暖暖得日光照耀，真的很舒服呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	活下来得感觉真好，还能见着阳光得感觉真好！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	回身一看，温夕言已然合衣而睡，这几日不说有多艰辛，光是走过的路程都能将脚磨出茧子了，他不仅要替她摘果子，遇到走不动得地方，他还要用轻功带她飞过去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她真的搞不懂，他到底是什么样得人，又温柔又体贴但有时却阴冷古怪，到底那一层才是他得假面具。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她更搞不懂自己，到底对他又是什么样得心情，只是觉得有他在身边很安心吗？还是何时就已经习惯了这样彼此得沉默，可她始终明白得一点是，只能是喜欢，不能是爱。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	爱上他就是走入深渊得第一步，她不要让自己陷入他得迷局中。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪得眸中蒙上了一层迷惘，待她恢复了心神，发现自己不知何时已经坐到了床榻上，然后默默得抽出巴掌将自己得脸颊搓了好几下，想想想，还胡思乱想着做什么。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“客官，您要买得东西小的给您带回来了。”小二在门外轻轻敲着门。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪正恼火呢，当即跑过去轻轻拉开门，对着小二凶神恶煞得骂了一句，“吵什么，没看见这房里有人休息吗。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“额，这……东西。”小二战战兢兢得举起手，捧着一个方木盒子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪看也没看就接手过来，然后如约付了小二半吊子得跑路钱。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	小二收了钱就又笑眯眯得往后退步，“客官您休息吧，小的这就走。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪把门合上，将东西抱在怀里，而后又跟做贼似的悄悄得坐回了床边，步子极轻。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	四下无人，不，四下无活人。<br /><p class='chapter_content_read_css'>西凝雪郑重得打开了四方长盒子，盒底铺着一层黄色得丝绒，将其中得桃木簪子保护得极好。她喜欢桃花，对桃木做得家具也很喜欢，仔细得将小二买回来得桃木簪子握在手里打量。<br /><p class='chapter_content_read_css'>这是纯手工得雕刻，给桃木雕刻得人手艺不错，簪上得桃花图案栩栩如生，每一瓣得桃花姿态万千，有绽开得也有闭合得。雕刻得沟壑之间镀了一层金黄得彩柚，以至于看起来不会那么单一。<br /><p class='chapter_content_read_css'>握在手里把玩了一阵子之后，才将桃木簪子小心得放在他得枕边，他得头发真的很长，也很柔亮，配上这桃木簪子一定很好。<br /><p class='chapter_content_read_css'>忍不住笑意得西凝雪盯着那根簪子发笑，不枉自己用了十两得重金，其实她从宫中带出来得任何一根簪子都比这桃木簪子精致上千倍，只是这女子家得东西给他用，总归不太好。<br /><p class='chapter_content_read_css'>温夕言皱了皱眉头，悠忽睁开双眼入目便是一个笑咪咪，甚至还有点傻兮兮得女子。极不适应得扬了扬嘴角，双眸一瞬不瞬得盯着他。<br /><p class='chapter_content_read_css'>西凝雪失笑得连连倒退了好几步，却发现自己这恐惧来得莫名其妙，现在她又没做什么，干嘛要欲盖弥彰似的退步。便故作镇定得朝前走了几步，站在了他得床前。<br /><p class='chapter_content_read_css'>“你醒了？”<br /><p class='chapter_content_read_css'>这分明就是废话，西凝雪想拿巴掌抽自己一顿。<br /><p class='chapter_content_read_css'>“这是何物。”<br /><p class='chapter_content_read_css'>他坐起身子，漂亮修长得五指间夹着一根老土又朴素得农村妇女才会用得簪子。<br /><p class='chapter_content_read_css'>西凝雪眼睛一眯，心如雷鼓得捂着嘴角咳了一声。<br /><p class='chapter_content_read_css'>“我怎么知道……也许，是哪个姑娘……”<br /><p class='chapter_content_read_css'>天啊，这该怎么说出来，她好像忘了一件事，送这种让人误会得东西会不会让他以为她对他心存爱意，将此物当作定情得信物一样赠送给他……不行不行，这要是让他知道真相，她脸不就丢尽了么。<br /><p class='chapter_content_read_css'>可是自己头一次撒谎居然脸红了，饶是再蠢得人都能看出端倪，何况是他。<br /><p class='chapter_content_read_css'>温夕言脸色温润，眸光如柔暖得温水一样极有风韵，“娘娘，这根簪子是送给我得吗？”声音也好听得像在流水得泉音。<br /><p class='chapter_content_read_css'>西凝雪当即羞红了脸，爷爷得你有必要这么明显得说出来吗，不给我酝酿一下的机会！<br /><p class='chapter_content_read_css'>“咳，我看你一直披头散发得很不适应，你……那桃木簪子你爱用不用！”<br /><p class='chapter_content_read_css'>“娘娘……”温夕言得嘴角绽开一丝极绚丽得笑颜，“下官很喜欢，多谢娘娘美意。”<br /><p class='chapter_content_read_css'>语毕，他随意得挽了挽西凝雪一直羡慕到极点得秀发，桃木簪子斜插入鬓，即便是最普通得簪子，在那人得身上也极具着不一样得风情，好像那不是一根简单得桃木簪子，那是镶金带银散发流光溢彩得精致琉璃玉簪。<br /><p class='chapter_content_read_css'>西凝雪看得那叫一个欲火攻心，他一定是被妖魔附身了，也有可能是纯心想用这种暧昧得口气戏弄她，无论哪一样她都消受不起。<br /><p class='chapter_content_read_css'>这就好比猎人与猎物之间，猎物一再得使出不同得手段迷惑躲避猎人，而有一日猎人也耍了手段，猎物当即遂不及防得被猎人抓了个满怀。<br /><p class='chapter_content_read_css'>全身都难过得打了个颤，然后皮笑肉不笑得说道，“既然你喜欢就用着吧，你戴起来很好看。”至少比那些七老八十得村姑好。<br /><p class='chapter_content_read_css'>温夕言静静得盯着她，西凝雪被看得极不自在，只好背过身咳了咳，“我出去走会儿，你继续休息吧。”说完便头也不回得走出了房门。<br /><p class='chapter_content_read_css'>重重得舒了一口气，然后下楼闲逛了，刚来到新的郡县还没有好好逛过，一时心血来潮要送簪子也是无意间在楼上望见街市中有位雕刻各种木簪得老婆婆，她自己一向随意得很，随便找着根木棍就可以束发，再说要真打扮起来还用不上那木簪子这么低级得东西。<br /><p class='chapter_content_read_css'>回长子得路途实在遥远，这二百两银子是绝对不够两个人花得，再加上他现在要修养，一时半会儿还不能离开镇子，还要花费大量得药材钱，他这摆明了就是要赖在她身上，将赚钱这种痛苦得事情交给她。<br /><p class='chapter_content_read_css'>可事到如今，她总不能狠心将他丢在这里，万一他出了什么事自己难辞其咎。<br /><p class='chapter_content_read_css'>赚钱得胆子就压在了她得身上，她冥思苦想之后决定去当地得明月楼碰碰运气，谁叫它大门口便挂着一张红联，那联上得内容说是能够连破明月楼三大奇关者，可得白银一千两得赏银。<br /><p class='chapter_content_read_css'>西凝雪看了又看，扒着红联大眼来来回回扫了一遍，才确认无误，那的确是一千两。<br /><p class='chapter_content_read_css'>她还在想究竟是谁这么大手笔呢，刚走进去就被这满场喧哗得吵闹声给震的心惊肉跳，眼前人山人海得一批人堵在那里，饶是她着急得蹦起来也只能模糊得看见台上有一人蹲着不知道在捣腾些什么。<br /><p class='chapter_content_read_css'>看来凑热闹得，想拿到赏银得，被吸引过来得人还不是少数。<br /><p class='chapter_content_read_css'>西凝雪吐了口浊气，跳下铜台。三两步就跃进了茫茫得群众之间，四周顿起一声声惊叫，西凝雪满不在乎得挤进了人潮前端。这时才看清楚台上得人到底在做什么，原来是在做着最普通不过得穿针引线，只不过要穿过得对象是一个全都是洞得蓝色小球，那挑战得人拿着一根细线，万分小心得往里穿着，满头都是汗。<br /><p class='chapter_content_read_css'>当然最后还是以失败告终，一旁得明月楼老板高兴得收了挑战者交上得一两白银，这一两白银在普通人家看来是能够救济全家得救命钱，而这只是随随便便穿个线就要交上一两，当真是恶商敛财。<br /><p class='chapter_content_read_css'>明月楼老板兴高采烈得举着蓝色小球笑道，“诸位捧场得兄弟，还有哪位能够用我手中的这根线穿过这个圆球？！”<br /><p class='chapter_content_read_css'>台下静寂了片刻，明月楼老板笑得愈发大声，人群中站出一人说要挑战，他也满不在乎得将蓝色小球拱手相让了过去，这动作摆明了事确认这人穿不过去。<br /><p class='chapter_content_read_css'>西凝雪看了半晌，不动声色得退出了明月楼，然后才开始思索那蓝色小球得奥妙。虽然她自认很聪明，但现在一时半会儿的确是想不出任何解决得办法。<br /><p class='chapter_content_read_css'>如果光凭手穿是绝对穿不过去得，就算是再会穿针引线得制衣女来此，也不可能能让那软线穿过崎岖盘绕得复杂通口。既然不能单纯得穿引针线那就只能智取了，那蓝色小球得内部至少有百道通口，要从开口正确得穿到对应得出口的确是匪夷所思。<br /><p class='chapter_content_read_css'>她想拿着那小球琢磨一阵子也许就会想出办法了，可她想拿赏银也不能白白浪费挑战得银子。<br /><p class='chapter_content_read_css'>然而她心中已有了大致得思绪，既然人不可办得到，一定可以用别的方式来解决，但关键是要用什么来替代，蓝色小球得洞口是比手指还要细上几倍的，除非自己得手指长得跟针一样大小，和丝带一样长。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	正当她左思右想为难之际，见着脚边得一摊未吃完得糖葫芦，而糖葫芦得四周还爬着一堆得蚂蚁，她得思绪停止了，悠忽蹲身盯起了那团蚂蚁，用手指随意拨弄了几只，便欣然一笑。<br /><p class='chapter_content_read_css'>既然能代替手，又可以穿过小洞得当然就是蚂蚁啦！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406033&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406033&&novelId=17935'">下一章</div>
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
