<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="top.jsp"></jsp:include>
	<script language="javascript">var novelTypeName='${novelTypeName}';</script>
	<script language="javascript">var loadMoreData='${loadMoreData}';</script>
	<script language="javascript">var loadMoreData='${loadMoreData}';</script>
	<script language="javascript">var pptHuanYiPiType='${param.menutype}';
		$(function(){
			totalDataPageNum=${anzhinovelList.total/10};
			totalDataPageNum=(totalDataPageNum%1==0)?totalDataPageNum:parseInt(totalDataPageNum)+1;
			searchPageNum=${fn:length(anzhinovelList.list)/10};
			searchPageNum=(searchPageNum%1==0)?searchPageNum:parseInt(searchPageNum)+1;
			$("#loadingData").slideUp();//隐藏加载中	
			$("#loadMoreData").slideUp();//显示加载更多
			if(totalDataPageNum>searchPageNum){
				$("#loadMoreData").slideDown();//显示加载更多
			}
			loadLoginInfo();
			getHtmlContent("html_novel_vote",95);
			pptHuanYipiTimer=setTimeout("pptHuanYiPi()",pptHuanYipiDelay);
		});
		var searchPageNum=1;//默认查询第1页
		var totalDataPageNum=0;
		function searchNovel(){
			searchPageNum=1;
			loadNovelData(false);
		}
		
		function getSearchParam(){
			var param={};
			param.bigType=novelTypeName;
			param.pageNum=searchPageNum;
			param.timenow=new Date().getTime();
			return param;
		}
		
		//Ajax的加载数据 appendBoolean--true：追加数据 false：覆盖数据
		function loadNovelData(appendBoolean){
			var params=getSearchParam();
			$("#loadMoreData").slideUp();//隐藏加载更多
			$("#loadingData").slideDown();//显示加载中
			$.post(path+"/anzhinovel/shuku.do",params,function(res){
				if(appendBoolean){
					$(res).appendTo($("#novel_main_div"));
				}else{
					$("#novel_main_div").html(res);
					searchPageNum=1;
					$("#loadMoreData").html("点击加载更多数据");
				}
				totalDataPageNum=parseInt($("#"+params.timenow).val());//设定页码总数
				$("#loadMoreData").slideDown();//显示加载更多
				$("#loadingData").slideUp();//隐藏加载中
			});
		}
		
		//点击加载更多，异步加载数据
		function loadMoreDataFn(){
			searchPageNum++;
			if(searchPageNum>totalDataPageNum){
				$("#loadMoreData").html("没有更多数据了->>");
				return;
			}else{
				loadNovelData(true);
			}
		}

	</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugings/adv/css/adv.css"/>
	<script language="javascript" src="<%=request.getContextPath()%>/plugings/adv/js/adv.js"></script>
	<c:forEach items="${pptlist.list }" var="s">
		<script language="javascript">
			imgArr[imgArr.length]='${s.novelImg}';
			pic_ds[pic_ds.length]='${s.novelImg}';
			novalTitleEn[novalTitleEn.length]='${s.enName}';
			novalTitleZh[novalTitleZh.length]='${s.novelTitle}';
			novalTitleAuthor[novalTitleAuthor.length]='${s.authorWriterName}';
			novalTitleInfo[novalTitleInfo.length]='${s.vote}';
			novalId[novalId.length]='${s.id}';
		</script>
	</c:forEach>
	<div id="recommad_one" style="position:absolute; top:710px; width:375px; height:500px; background-image:url(${pptFirst.novelImg }); margin-left:690px;">
		<script language="javascript">
			new moveAdv({delaysN:500,widN:375,heiN:500}).init();
		</script>
	</div>
	<div style="position:absolute; top:1130px; margin-left:110px;">
		<img src="${signNovel.novelImg }" width="318" height="458"  onclick="window.location.href='<%=request.getContextPath()%>/novel/${signNovel.id }.jsp'"/>
	</div>
	<div class="main_2_div">
		<div class="title_div_css">
			小说&nbsp;>&nbsp;${novelTypeName }
		</div>
		<div style="margin-top:30px;line-height: 40px; vertical-align: middle; padding-left: 20px;">
			精彩推荐&nbsp;&nbsp;&nbsp;<font style="color:#cbcbcb;">DAILY RECOMMAND</font>
		</div>
		<div style="background-color:#e5e5e5; height: 468px;">
			<table width="100%" border="0">
			  <tr>
				<td width="350" valign="top">
					<div class="recommand_1_css">
						<div class="en_title" style="font-size:20px;" id="novalTitleEnDiv">${pptFirst.enName }</div>
						<div class="title_self_css" id="novalTitleZhDiv">${pptFirst.novelTitle }</div>
						<div>——</div>
						<div id="novalTitleAutorDiv">
							${pptFirst.authorWriterName }&nbsp;著
						</div> 
						<div>
							<div class="self_btn" id="novelHref" style="margin-right:0px;"  onclick="window.location.href='<%=request.getContextPath()%>/novel/${pptFirst.id }.jsp'">立刻阅读</div>
						</div>
					</div>
				</td>
				<td valign="top">
					<div id="novalTitleInfoDiv" class="html_novel_vote" style="width:220px; padding:30px; line-height:26px; font-size:12px; padding-top:60px;">
						${pptFirst.vote } 
					</div>
				</td>
			  </tr>
			</table>
		</div>
		<div style="height:350px; margin-top: 28px;">
			<table width="100%" border="0">
			  <tr>
				<td width="430">&nbsp;</td>
				<td width="200" valign="top">
					<div class="recommand_1_css" id="recommand_div_1_css">
						<div class="en_title" style="font-size:20px;">${signNovel.enName }</div>
						<div class="title_self_css">${signNovel.novelTitle }</div>
						<div>——</div>
						<div>
							${signNovel.authorWriterName }&nbsp;著
						</div> 
						<div>
							<div class="self_btn" style="margin-left:0px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${signNovel.id }.jsp'">立刻阅读</div>
						</div>
					</div>
				</td>
				<td valign="top">
					<div class="html_novel_vote" style="padding:10px; line-height:26px; font-size:12px; padding-top:60px;">
						${signNovel.vote } 
					</div>
				</td>
			  </tr>
			</table>
		</div>
	
		<div style="background-color:#e5e5e5; height: 345px; width:100%;">
			<div style="width:96px; height:66px; position:absolute; margin-top:-5px; margin-left:-5px; background-image:url(images/huanyipi.png); cursor:pointer;" onclick="getMoreHuanYiPi('${param.menutype}3')">
				
			</div>
			<div style="clear: both;" id="huanyipiDIv">
				<jsp:include page="huanyipi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="paixu_div" style="margin-top:40px;">
			<table width="100%" border="0">
			  <tr style="line-height:35px;">
				<td width="70%" style="padding-left:10px;">
					${novelTypeName }
				</td>
				<td width="12%">
					<!-- <input type="checkbox" />只显示已完成 -->
				</td>
				<td width="9%">
					<!-- <input type="checkbox" />VIP作品 -->
				</td>
				<td width="9%">
					<!-- <input type="checkbox" />半价库 -->
				</td>
			  </tr>
			</table>
		</div>
		<div id="novel_main_div">
			<jsp:include page="article_list.jsp" flush="false"></jsp:include>
		</div>
		<div id="loadMoreData" class="heng_div_css" onclick="loadMoreDataFn()">
			点击加载更多小说...
		</div>
		<div id="loadingData" class="heng_div_css">
			正在努力加载中...
		</div>
	</div>
	
<jsp:include page="foot.jsp"></jsp:include>