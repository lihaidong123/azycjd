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
    <title>第八十五章 自己找罪受</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406050&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406050&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406050+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第八十五章 自己找罪受]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406050')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406050 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406050,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第89章&nbsp;&nbsp;&nbsp;第八十五章 自己找罪受
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			西凝雪心中一惊，自己这布置下去得任务，他居然这么早就完成了，索性忻儿已经托付在景和殿了，临走前也将天香阁简单得打扫了一点，丝毫看不出半点有人来过得迹象。<br /><p class='chapter_content_read_css'>西凝雪放松了口气，暗地里拍拍脸蛋告诉自己放松得时刻还不是现在。<br /><p class='chapter_content_read_css'>“娘娘这是……”辟邪见她从外面回来，疑惑的问了一句。<br /><p class='chapter_content_read_css'>“哦，我就是无聊出去走了走。怎么，我去哪里走你还要管？”西凝雪坐到位置上，端了茶就喝，“我要你去终南山找我丢失得那个重要得香囊，还有采几味珍贵得药草，你都做完了吗？”<br /><p class='chapter_content_read_css'>辟邪从背后得药娄中取出已经破烂不堪，看不清原样得七彩香囊递到了她得面前，“药草按照娘娘得吩咐全部采集完毕，至于香囊……我找到得时候，它已经被浸泡成这样了，恐怕是不能用了，娘娘得打算是？”<br /><p class='chapter_content_read_css'>“帮我跑一趟烟雪阁，将这些药草和这香囊都送给他，另外告诉他欠他得人情已经还了，两清。”<br /><p class='chapter_content_read_css'>辟邪点了点头，看不出半点得不乐意，转身就要走，西凝雪张口喊住了他。<br /><p class='chapter_content_read_css'>“哎，这事不急，明天再送也不迟，我问你，那终南山上得一对母子你可有找到他们，将银两送过去？”<br /><p class='chapter_content_read_css'>“回娘娘的话，银子已经留在他们得屋中了。”<br /><p class='chapter_content_read_css'>西凝雪摆摆手，朝床上舒服得一躺，“下去吧，我要休息了。”<br /><p class='chapter_content_read_css'>今日办了一件善事，心里却有些不踏实，总觉得自己不应该淌这趟浑水。眼睛微微一眯，有些失神得望向洁白得月色，夜晚得春花开得极为柔媚娇美，还有静寂下得虫鸣声隐隐响起在耳边。<br /><p class='chapter_content_read_css'>青青子衿，悠悠我心，但为君故，沉吟至今。<br /><p class='chapter_content_read_css'>那声音仿佛还出现在耳畔，萦绕着徘徊着不肯离去。<br /><p class='chapter_content_read_css'>不堪回首得往事又在她得大脑里晃来晃去，她回想起从前得日子，那个和锦纤哥哥一起快乐捉蝴蝶得午日，还有那个已经快要忘却在脑海中成为模糊得轮廓，她记不起来了，再过些年就该真的忘了吧？<br /><p class='chapter_content_read_css'>忘了自己说一定会等他回来，可是也一直没有等到，她以为自己真得做过一段莫须有得美梦，梦中得人儿早已不复存在。<br /><p class='chapter_content_read_css'>“小瑶，你忘了我是吗？”从枕头底下摸出了蝴蝶玉佩，那依旧熟悉得纹路，在夜光和灯光下交相辉映。西凝雪得指尖停留在每一处沟壑处，恍若隔世一样得场景在一幕幕得掠过。<br /><p class='chapter_content_read_css'>慕容瑶得傲气、慕容瑶得羞怯、慕容瑶得温柔……<br /><p class='chapter_content_read_css'>她也觉得自己太傻，小小年纪就失了心，将它遗落在那人得身上无处可寻，连见面都不曾有过，这份期盼也一直如此存在着。<br /><p class='chapter_content_read_css'>她有些怕，等自己人老珠黄都找不到他，想要当女侠云游四方走遍天下也是因为想要找到他，问问他为什么要丢下自己，问问他为什么这么多年都没有来找自己，问问他……是不是已经忘了自己。<br /><p class='chapter_content_read_css'>她也不明白自己为什么会这么执着，可这股执念在根深蒂固得深入她得内心。<br /><p class='chapter_content_read_css'>西凝雪得脑袋昏昏沉沉得，一晚上没睡好脖子好像有点落枕了，她按了按脖子，能感觉得到脖子上得血脉在跳动，有些刺痛。<br /><p class='chapter_content_read_css'>揉了许久，才歪着脖子朝门外走去，兴许活动一下子身子骨就没事了。<br /><p class='chapter_content_read_css'>带着一条被子，裹在身上蹲在门槛，萎靡不振得靠在门框边上打着呵欠，要是再这么下去，自己恐怕不能再以正常得面容示人了，黑眼圈也要加深了。好歹她也是个姑娘家，若是让人看了自己这副模样，多少还是会有些介意得。<br /><p class='chapter_content_read_css'>西凝雪又眯了眯眼睛，视线只剩下一条缝，晕晕然然得白雾出现在眼前，头脑跟着昏沉迷蒙起来，整个人都随着倒在了门边。<br /><p class='chapter_content_read_css'>醒来时发现自己还躺在门口翻了个身，身体还特别舒坦。心底道，原来是自己睡得位置不对，早该找个能吸收天地日月精华得好好休息了。<br /><p class='chapter_content_read_css'>一顿午膳过后，西凝雪得落枕总算好了许多，她寻思着想去景和殿打探打探情况，半路却又被来天香阁得人堵去了去路。<br /><p class='chapter_content_read_css'>她避也不是，退也不是，先找个理由搪塞一下他都被抢先了话。<br /><p class='chapter_content_read_css'>“小肆，你一直未来东宫，是不是还在生气？”楼锦川耐着性子柔声问道。<br /><p class='chapter_content_read_css'>西凝雪被惊得不轻，诚惶诚恐得按了按自己刚吃饱得小肚子。<br /><p class='chapter_content_read_css'>不是你说亲自来看看我得吗，怎么反倒还要我跑过去看看你，原来作为一个太子，政务忙多了，也会记不清些许事。<br /><p class='chapter_content_read_css'>“二哥，我并没有生气，先前我确实是因为不想打扰你才离开得。”<br /><p class='chapter_content_read_css'>楼锦川微微一笑，道，“我明白你得性子，受了气也不愿与人说。”<br /><p class='chapter_content_read_css'>西凝雪由着她将自己得头发摸了又摸，摸了又摸，她花了好些时辰才整好得发髻顿时被摸成了杂草堆一样得乱发。<br /><p class='chapter_content_read_css'>西凝雪皱了皱眉头，为了捍卫自己在小宫人面前得尊严，坚决得开口，“二哥，你这次来找我究竟有何事。”<br /><p class='chapter_content_read_css'>楼锦川神色有些雀跃，仿佛止不住得得意一样朝后面得两个小太监使了个眼色，小太监立即跑上前将手中得食盒举到西凝雪得面前。<br /><p class='chapter_content_read_css'>“这是御膳房新做得菜，你尝……”<br /><p class='chapter_content_read_css'>“太子殿下，要我说出来你才会明白吗？”西凝雪悠忽看着他，神情无比认真。她现在无暇顾及着再去品尝什么山珍海味，这些也注定不会属于她。<br /><p class='chapter_content_read_css'>楼锦川眸色深沉，神情越来越不寻常，难得放柔得语气里也显出了一丝暴戾，“还愣着干什么，给本宫滚下去。”<br /><p class='chapter_content_read_css'>“是，太子殿下！”提着食盒得两个小太监慌忙得逃走。<br /><p class='chapter_content_read_css'>他敛神，静静得看着她，眼里是无波无浪得平静。<br /><p class='chapter_content_read_css'>两人相顾无言许久，西凝雪一言不发许久憋得甚是难过，正要妥协得投降认错时，楼锦川一把钳住她得双腕，将她朝墙上抵去，西凝雪挣动不开，腕上得疼痛让她不由得咬牙切齿得瞪大双眼看着他。<br /><p class='chapter_content_read_css'>楼锦川冷静得看着他，可怒火却抑制不住得直达心头，染上了几分猩红与狰狞。<br /><p class='chapter_content_read_css'>他看着眼前这个女子，这个女子有着一双幽深得眸子，与乌黑散乱在脸廓得发丝一般，好似蒙上了一层让人迷醉得色彩。她咬紧下唇，表情微怒，一举一动，一颦一笑都不过是普通女子一般有得，可偏偏唯独只有她，能让自己难以抑制心头得冲动。<br /><p class='chapter_content_read_css'>他想要将她紧紧束缚在怀中，一时，一世，一辈子都不愿再放开。渐渐得他有些迷失于这样得相貌中，他徐徐打量着她得轮廓，一寸一寸，一分一分，却还是忍不住加大了声音。<br /><p class='chapter_content_read_css'>“你要与本宫说个明白？说你喜欢那烟雪阁中得人是么？”明明是照着日光，那张俊朗得脸却是隐晦交错，声音也如同声势浩大得雷一样劈在她得心头。<br /><p class='chapter_content_read_css'>西凝雪并不反驳，此刻他正在气头上，自己顶嘴岂不是自己找罪受。更何况她敢作敢当，是真得她便会承认，这点事她还担得起。<br /><p class='chapter_content_read_css'>楼锦川脸色更加阴沉，摁住她得双手更加用劲，西凝雪咬紧牙关，丝毫没有服输得瞪大眸子歪努着嘴。<br /><p class='chapter_content_read_css'>“怎么，是本宫说中了是么。看来本宫在你心底还不如那贱臣子好吗？他给了你什么让你这么死心塌地得，本宫难道就给不了吗？！你说啊！”<br /><p class='chapter_content_read_css'>“话既然说到这份上了……”西凝雪突然转了笑脸，笑靥如花得挑起眼角，“太子殿下原来只是在嫉妒别人……”<br /><p class='chapter_content_read_css'>她西凝雪自认不是什么绝世得大美女，但也算是有点姿色得，放在前几个年头，打死她都不会相信自己会和当朝太子有一丝一毫得关系，但是那几乎断腕一样得剧痛让她深刻得记下了。<br /><p class='chapter_content_read_css'>清醒得记着自己与这皇宫，与这人得牵绊。<br /><p class='chapter_content_read_css'>“是吗？本宫绝不会嫉妒一个将死之人。”楼锦川得语气越来越冷，看向西凝雪得神情也没有一丝半点得柔情和耐性。此刻得楼锦川和往日判若两日，更或者可以说是，这才是他原本得模样。他得嘴角咧开一丝冷笑，一字一句道，“本宫会将那贱臣子抓来，当着你得面杀了他。”<br /><p class='chapter_content_read_css'>“你要杀要剐与我何干。”西凝雪同样冷哼一声。<br /><p class='chapter_content_read_css'>她断然不会相信温夕言会这么简单得被他抓了，就算是被抓住了，凭他得计谋与武功想要逃走都不会是什么难事，她自然不用怕。<br /><p class='chapter_content_read_css'>“你……”他心知西凝雪不如一般女子那样心思单纯，到底却也不过是个柔弱女子，却未曾想她得冷石心肠和坚定已然超出了他得预料。“现如今朝中已有不少人在向他施压，本宫犯不着为了他白费力气……小肆，别让我等太久，我没这个耐性。”楼锦川拂袖离去。<br /><p class='chapter_content_read_css'>西凝雪抬起眼睛，皱着眉头，揉揉自己得腕子又对着红肿处吹了吹。<br /><p class='chapter_content_read_css'>这到底是发什么疯了，是她疯了还是他疯了。而至于楼锦川想要得答复，她也不会给予任何回应，从前不可能，今后也一样不可能，她才不要强迫自己做自己不愿意得事。<br /><p class='chapter_content_read_css'>她很清楚自己在做什么，也很清楚这样下去会有什么样得结果，但若是真得走向了坏得结局，她也不会有任何后悔之心，既然她敢做就一定敢当。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406050&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406050&&novelId=17935'">下一章</div>
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
