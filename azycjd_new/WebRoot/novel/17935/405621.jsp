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
    <title>第九章 惹不起我躲</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405621&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405621&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405621+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九章 惹不起我躲]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405621')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405621 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405621,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第13章&nbsp;&nbsp;&nbsp;第九章 惹不起我躲
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	而且这银针的主人，就是那个小肚鸡肠脾气不好没心没肺的瘟神。她透彻的考虑了一夜，他手段如此毒辣和不留情面，自己硬斗一定不可能斗得过这个瘟神，而且下次她万一还没举刀呢，就又被这银针定上了怎么办。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	和瘟神的精神体争斗了一晚，也没想出好的对策，她可是一百一千个不愿次次见面在他面前丢脸，先是患上天花绝症被戳穿，后是连自己亲自上阵准备的泥沙也只弄脏了他衣上一角，这就是说无论是斗文斗武，她一样都不及他。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	算了算了，惹不起难道我还躲不起嘛，死王八蛋，我西凝雪有仇报仇有怨抱怨，但愿你别犯在本姑娘我手里头，不然我不把你骨头拆了那还算便宜你了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	天色刚亮，女官就进了屋子，那趾高气昂的小人脸真是可恨。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“知错的，就给我眨两下眼，不知错的，那就继续在这屋里头呆着，直到想明白为止。”女官冷冰冰地说，“你自己决定吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪识趣的眨了两下眼，然后女官满意的点下了头，也大发慈悲的将西凝雪手腕上的银针除去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	四肢百骸顿时松软下来，西凝雪揉着腰又听女官教诲了许久，被打发着回了房间，云沁担心的凑过来又问东问西，西凝雪一概以嗯嗯啊啊的词糊弄了过去，不是她不想好好对自己的好姐妹阐述一下自己的悲惨经历，而是脑中一片混乱，要她说些什么她目前也总结不出来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	所以这事就算打烂了牙吞进肚子里便罢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	可这日子绝对是过不下去了，学礼学不成，还要遭受如此对待……不行！本姑娘可是立志要当上天下第一的女侠，怎可如此这般就被困在宫中做皇帝老头子宠幸的对象！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	对，逃！本姑娘要离开这个鬼地方，就在今日……不，即刻马上！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	做好决定的西凝雪偷偷的把正在训练的云沁叫到了无人的角落里，并说出了自己的计划。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“沁儿，我决定要离开景秀阁，你跟不跟我走？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	没有意料到西凝雪会做出如此决定的云沁愣了愣，然后惊恐的拉住了她的手，“小雪，你这是疯了吗，秀女私逃可是大罪，我听说那些被抓到的秀女要不就是被发配到边境永生不准进西燕，要不就是送到大理寺服刑，你要是被抓住了那就等于是死路一条啊！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪也没想到出逃的后果会这么严重，但既然决定已经做好了她就绝对不会改变，西凝雪不管不顾盛气凌人的吼道，“我管不了这么多了，大不了我逃到深山老林里，也总比这吃人不吐骨头的地方好上千倍万倍，再说了……秀女出逃虽是大罪，但祸不及九族，我西凝雪犯事了，碍不着任何人。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那也不行啊。”云沁寒着一张脸，坚定的说道，“我不能以身试险，你是我的好姐妹，自当我也不可眼睁睁的见你受罪，这出逃之事，我不会答应你也不会让你去冒险得！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪无措，看来云沁也是铁了心的要阻拦她……要不她俩怎么会脾性相投的成为好姐妹呢，现在麻烦事又多了一件，早知云沁这么激烈的阻止，她也就一个人收拾包袱偷溜就好。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但事已至此，她必须要先解决眼下的事……硬的不行那就来软的！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪也不嫌脏的回过头用唾沫抹了两把在脸上，然后扭头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“沁儿……你说你不忍心见我受罪，可是我在这里也呆不下去了啊……选秀是皇上的旨意，无人能改，也无人能帮我，难道就连身为好姐妹的你不仅不帮我，还要拦着我吗。”西凝雪晓之以理动之以情的又继续添油加醋道，“就当我求你的，你就当没听到这事，让我一个人走吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁有些怔松，恍然间忆起了当日在景秀阁出现的楼锦川，良久，才推了推西凝雪的身子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“好了啦，咱们姐妹一场，既然你决心要离开景秀阁，那……或许有一人能够帮你。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪立马停止抽泣，想也不想的就反抓住云沁的手。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“谁？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她是不抱任何希望得，普天之下还有什么人能从皇帝眼皮子底下夺人得。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“西燕太子，楼锦川。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“……我又不认识他。”西凝雪翻翻白眼，这都什么时候了，云沁还开这种玩笑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁不置可否的笑笑，旋即退开了两三步，面上羞赧微红道，“你可不知道，就在前些日子太子便来过景秀阁一趟，他呀……就是那日在吟风楼与我们二人……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“干什么呢你们两个！”刘淑妙突然出现，眼神冷漠的说道，“从刚才你们两个就私自脱离了队伍，被我抓住在偷懒吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪正愁满腔怒火发不出，正巧来了个能让她发泄得，近些日子若不是为了装病不能惹事，她大仇也难以得报，她此刻撞上来也算她倒霉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你这意思是要去打小消息告诉女官是吧？”西凝雪故意恐吓她的撩起袖子，脸上更是挂着标准得痞子笑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	生怕被揍的刘淑妙尖叫一声，却引来了女官的注意力，女官赶过来不出意料的又把她和云沁数落了一顿。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	刘淑妙得意洋洋的躲在女官身后，幸灾乐祸的看着西凝雪和云沁站在院子里面树思过。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪这次真算是打定了主意要离开景秀阁，实在不成她就跑到皇奶奶那里躲着，看这群人敢上慈宁宫要人不。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	摸到包袱西凝雪就忍不住笑了，还亏她足智多谋，虽然拟定了天花一号方案，但也备好了天花一号方案失败的二号方案，那就是溜，孙子兵法三十六计也不也说走为上策吗，她识相的早点开溜也就不用再受罪了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	景秀阁门外有官兵把守着，寻常要出去都要得到女官的手令才可放行，西凝雪警惕的朝门外看了一眼，正巧这时候大家都去吃饭了，没有人注意到这个屋子里的情况。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪把方才写好的信和装着自己所有首饰和小人书的包袱塞进了云沁的柜子里，然后又换上了自己带过来的一套男装，这样出去就算被发现了他们也认不出自己，西凝雪对自己的扮相还是很有信心的，虽提不上是仪表堂堂，但温文尔雅还是衬得上的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	万事准备的齐全，西凝雪走出房门时又折回到刘淑妙的床头，把她的枕头和被子扔在地上踩了几脚，然后很满意的离开了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	来到一开始被关押的地方，因为没人敢来，所以那乱糟糟的洞口一直没人来修理，也正好从了她的意。西凝雪麻溜的朝洞外爬出去，洞外是明亮的天色，和清香芬芳的空气。心想总算是逃出这鬼地方自由了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但西凝雪并没有因此而放下戒心，她清楚自己出逃的事情一会儿就会败露，在此之前她必须赶到一个能落脚得地方。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	而隔着不远处的地方，又是几个官兵在把守着，意味着她要是想出去就一定要从墙头打主意。西凝雪小时候和街头得一位无名大侠学过两手，轻功什么的不在话下，但前提是……她能从十分之一的机率中把内力调起来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	没办法了，这可是你逼我使轻功的！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	气沉丹田，身轻如燕，凝神聚气……“啊！！！救命……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪一边朝墙外飞去，一边迎着风没形象的惨叫，最后不出意料的摔在了地上，瞬间那粉身碎骨的感觉可让她好好痛了一把。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	装死的躺在地上，不是她不想起来，而是动一下身体就钻心的痛，原本是想躺着再缓缓，没成想从偏门传来了脚步声，那急促的恐怕她爬起来也会被追上，索性闭眼装死人什么事都不管的当死猪紧紧的扒着地面。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这就叫粉身碎骨浑不怕，只留清白在人间！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“快快快，别让贼跑了！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“快追！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪认命的紧闭上眼，然后身子猛地被人一折，双手被反扣住，西凝雪痛的直抽气，只觉全身的骨头经受着这么一下都要散架了，自然没骨气的求起饶来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这位大哥，你饶了我吧，我只是个过路的……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你以为我会信你？”楼锦川把她的脸扳向自己，那脏兮兮的小脸似曾相识，西凝雪哭的稀里哗啦的仍不敢睁眼看他，哆哆嗦嗦的说道，“大哥我上有老下有小还有八十岁老母等着我去养，要是你放过我我明个儿就烧香拜佛给你祈福成吗……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	眸中充满了氤氲的水雾，西凝雪难受的睁开眼，眼前却是一片模糊，看不清楚面前的人，只感觉自己突然被轻柔的抱起，西凝雪几乎的反射性的挣扎，但是想了想自己伤筋动骨着实在不便反抗，所以动着的手脚只是大幅度的摆动了几下就又颓然的放下了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“殿下，那贼人已经跑远了，还要加派人手去追吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“回宫。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	熟悉的声音，西凝雪凝眉想了想实在想不起来这声音的主人是谁，只觉得这个人虽然突然莫名其妙的突袭她，但是应该没有恶意，自然就扒的更紧了点，不然这人突然把她丢下，她岂不是又要落得一个伤筋动骨一百天的伤痛。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川垂眸底扫了一眼怀中的人，唇角不自觉的上扬。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪靠着这绫罗绸缎说不舒服那绝对是假的，这布料摸起来似乎就比自己那几件华贵的长衣还要柔滑，暗地里用他的衣服蹭了蹭脸蛋，什么眼泪鼻涕灰尘该抹的通通抹上去，谁叫你这么折腾我的身子，我弄脏你一件衣服也不算过分。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	好不容易把眼泪蹭干净了，然后偷偷瞄了一眼上方，只见到一个线条流畅弧度优美的下颌，而她失手间恰巧又不小心摸到了他腰间的龙纹玉佩，只是这么轻轻一触，那质地上乘的玉石落了手的滑腻感就迟迟不散。西凝雪当即傻了眼，她似乎并没有认识有这样一号身份尊贵的人物啊。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	发愣期间，西凝雪发觉自己的身体已经被转移到了一张大床上，那张入眼的俊美脸庞绽着邪魅的笑容，“肆弟，别来无恙。”<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405621&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405621&&novelId=17935'">下一章</div>
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
