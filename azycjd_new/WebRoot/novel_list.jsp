<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Random r=new Random();
	String d=r.nextDouble()+"";
	d="end"+d.substring(3,d.length())+"leixing";
 %>
<jsp:include page="top.jsp"></jsp:include>
	<div id="tree_css_div" class="tree_css" style="position:fixed; display:none;">          
		<div class="paihangbang.html?#ling">1、月票榜</div>
		<div class="paihangbang.html?#er">2、点击榜</div>
		<div class="paihangbang.html?#san">3、收藏榜</div>
		<div class="paihangbang.html?#si">4、更新榜</div>
		<div class="paihangbang.html?#liu">5、推荐榜</div>
		<div class="paihangbang.html?#shi">6、订阅榜</div>
		<div class="paihangbang.html?#shier">7、新书月票榜</div>
		<div class="paihangbang.html?#wu">8、书友打赏榜</div>		
		<div class="paihangbang.html?#qi">9、新书点击榜</div>
		<div class="paihangbang.html?#ba">10、新书推荐榜</div>
		<div class="paihangbang.html?#jiu">11、新书收藏榜</div>		
		<div class="paihangbang.html?#shiyi">12、完结精品榜</div>
	</div>

	<div class="main_2_div">
		<div style="position:absolute;background-color:#e5e5e5; height: 500px; width:485px; z-index:-1; top:1025px; margin-left:295px;">
		</div>
		<div class="title_div_css">
			<div class="novel_list_div">
				<div><a href="anzhinovel/morePahangbang.do?types=1" target="_blank">月票榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=2" target="_blank">点击榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=3" target="_blank">收藏榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=4" target="_blank">更新榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=5" target="_blank">推荐榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=6" target="_blank">订阅榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=7" target="_blank">新书月票榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=8" target="_blank">书友打赏榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=9" target="_blank">新书点击榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=10" target="_blank">新书推荐榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=11" target="_blank">新书收藏榜</a></div>
				<div><a href="anzhinovel/morePahangbang.do?types=12" target="_blank">完结精品榜</a></div>
			</div>
		</div>
		<div style="height:525px;">
			<a name="ling"></a>
			<table width="100%" border="0">
			  <tr>
				<td valign="top" width="30">
					<div class="shuxing">
						月票榜
					</div>
				</td>
				<td valign="top" width="180">
					<div class="novel_1_css">
						<div>
							<img src="images/4_pic_1.png" width="72" height="175" />
						</div>
						<div>
							授权方式： ${firstNovel.authorizationLevel eq 0?'原创':'连载' }
						</div>
						<div>
							是否签约： ${firstNovel.isSigned eq 0?'未签约':'已签约' }
						</div>
						<div>
							发表方式： 【${firstNovel.postedWay eq 0?'独家首发':'' }】
						</div>
						<div>
							总点击：${firstNovel.clickNum }
						</div>
						<div>
							总字数：${firstNovel.totalCharNum }
						</div>
						<div>
							总阅读：${firstNovel.readNum }
						</div>
						<div>
							<c:if test="${not empty firstNovel}">
								<div class="self_btn" style="margin-right:0px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${firstNovel.id }.jsp'">立刻阅读</div>
							</c:if>
							<c:if test="${empty firstNovel}">
								<div class="self_btn" style="margin-right:0px;">立刻阅读</div>
							</c:if>
							
						</div>
					</div>
				</td>
				<td valign="top" width="270">
					<div class="novel_2_css">
						<div class="novel_1_title_css">${firstNovel.novelTitle }</div>
						<div class="novel_1_author_css">作者： ${firstNovel.authorWriterName }</div>
						<div>
							<c:if test="${not empty firstNovel}">
								<img src="${firstNovel.novelImg }" width="310" height="401" onclick="window.location.href='<%=request.getContextPath()%>/novel/${firstNovel.id }.jsp'"/>
							</c:if>
							<c:if test="${empty firstNovel}">
								<img src="${firstNovel.novelImg }" width="310" height="401"/>
							</c:if>
							
						</div>
					</div>
				</td>
				<td valign="top" width="200">
					<div class="novel_1_css" style="margin-top:150px;">
						<div>
							<img src="images/4_pic_2.png" width="82" height="139"/>
						</div>
						<div>
							授权方式： ${secondNovel.authorizationLevel eq 0?'原创':'连载' }
						</div>
						<div>
							是否签约： ${secondNovel.isSigned eq 0?'未签约':'已签约' }
						</div>
						<div>
							发表方式： 【${secondNovel.postedWay eq 0?'独家首发':'' }】
						</div>
						<div>
							总点击：${secondNovel.clickNum }
						</div>
						<div>
							总字数：${secondNovel.totalCharNum }
						</div>
						<div>
							总阅读：${secondNovel.readNum }
						</div>
						<div>
							<c:if test="${not empty secondNovel}">
								<div class="self_btn" style="margin-right:0px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${secondNovel.id }.jsp'">立刻阅读</div>
							</c:if>
							<c:if test="${empty secondNovel}">
								<div class="self_btn" style="margin-right:0px;">立刻阅读</div>
							</c:if>
							
						</div>
					</div>
				</td>
				<td valign="top">
					<div class="novel_2_css" style="margin-top:180px;">
						<div class="novel_1_title_css">${secondNovel.novelTitle }</div>
						<div class="novel_1_author_css">作者： ${secondNovel.authorWriterName }</div>
						<div>
							<c:if test="${not empty secondNovel}">
								<img src="${secondNovel.novelImg }" width="236" height="301" onclick="window.location.href='<%=request.getContextPath()%>/novel/${secondNovel.id }.jsp'"/>
							</c:if>
							<c:if test="${empty secondNovel}">
								<img src="${secondNovel.novelImg }" width="236" height="301"/>
							</c:if>
							
						</div>
					</div>
				</td>
			  </tr>
			</table>
		</div>
		
		<div>
			<table width="100%" border="0">
			  <tr>
				<td valign="top" width="370">
					<div class="novel_1_css" style="margin-top:20px;">
						<div>
							<img src="images/4_pic_3.png" width="73" height="123"/>
						</div>
						<div>
							授权方式： ${threeNovel.authorizationLevel eq 0?'原创':'连载' }
						</div>
						<div>
							是否签约： ${threeNovel.isSigned eq 0?'未签约':'已签约' }
						</div>
						<div>
							发表方式： 【${threeNovel.postedWay eq 0?'独家首发':'' }】
						</div>
						<div>
							总点击：${threeNovel.clickNum }
						</div>
						<div>
							总字数：${threeNovel.totalCharNum }
						</div>
						<div>
							总阅读：${threeNovel.readNum }
						</div>
						<div>
							<c:if test="${not empty threeNovel }">
								<div class="self_btn" style="margin-right:0px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/${threeNovel.id }.jsp'">立刻阅读</div>
							</c:if>
							<c:if test="${empty  threeNovel}">
								<div class="self_btn" style="margin-right:0px;">立刻阅读</div>
							</c:if>
							
						</div>
					</div>
				</td>
				<td valign="top">
					<div class="novel_2_css" style="margin-top:20px;">
						<div class="novel_1_title_css">${threeNovel.novelTitle }</div>
						<div class="novel_1_author_css">作者：${threeNovel.authorWriterName }</div>
						<div>
							<c:if test="${not empty threeNovel }">
								<img src="${threeNovel.novelImg }" width="236" height="301" onclick="window.location.href='<%=request.getContextPath()%>/novel/${threeNovel.id }.jsp'"/>
							</c:if>
							<c:if test="${empty threeNovel }">
								<img src="${threeNovel.novelImg }" width="236" height="301" />
							</c:if>
							
						</div>
					</div>
				</td>
			  </tr>
			</table>
		</div>
		
		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="yi"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">月票榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=1" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;">
				<c:forEach items="${yuepiao.list }" var="s" begin="0" varStatus="ind">
					<div class="article_items" id="article_items00${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>0">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>0").data("nums",${s.num});
					</script>
				</c:forEach>
			</div>			
		</div>
		
		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="er"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">点击榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=2" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv1">
				<c:forEach items="${dianji.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items01${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>1">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>1").data("nums",${s.clickNum});
					</script>
				</c:forEach>	
			</div>
		</div>
		
		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="san"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">收藏榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=3" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv2">
				<c:forEach items="${shoucang.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items02${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>2">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>2").data("nums",${s.totalSaveNum});
					</script>
				</c:forEach>	
			</div>
		</div>
		
		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="si"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">更新榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=4" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv3">
				<c:forEach items="${gengxin.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items03${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>3">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>3").data("nums",${s.num});
					</script>
				</c:forEach>	
			</div>
		</div>
		
		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="liu"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">推荐榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=5" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv4">
				<c:forEach items="${tuijian.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items04${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>4">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>4").data("nums",${s.totalRecommand});
					</script>
				</c:forEach>	
			</div>
		</div>
		
		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="shi"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">订阅榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=6" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv5">
				<c:forEach items="${dingyue.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items05${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>5">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>5").data("nums",${s.totalDingyueNum});
					</script>
				</c:forEach>	
			</div>
		</div>
		
		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="shier"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">新书月票榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=7" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv6">
				<c:forEach items="${xinshuYuepiao.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items06${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>6">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>6").data("nums",${s.num});
					</script>
				</c:forEach>	
			</div>
		</div>

		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="wu"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">书友打赏榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=8" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv7">
				<c:forEach items="${dashang.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items07${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>7">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>7").data("nums",${s.num});
					</script>
				</c:forEach>	
			</div>
		</div>
		
		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="qi"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">新书点击榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=9" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv8">
				<c:forEach items="${xinDianji.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items08${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>8">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>8").data("nums",${s.clickNum});
					</script>
				</c:forEach>	
			</div>
		</div>
		
		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="ba"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">新书推荐榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=10" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv9">
				<c:forEach items="${xinTuijian.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items09${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>9">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>9").data("nums",${s.totalRecommand});
					</script>
				</c:forEach>	
			</div>
		</div>
		
		
		<div class="positon_div"></div>
		<div class="list_items">
			<a name="jiu"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">新书收藏榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=11" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv10">
				<c:forEach items="${xinShoucang.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items10${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>10">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>10").data("nums",${s.totalSaveNum});
					</script>
				</c:forEach>	
			</div>
		</div>


		<div class="positon_div"></div>
		<div class="list_items">
			<a name="shiyi"></a>
			<div>
				<table class="list_table" width="100%" border="0">
				  <tr>
					<td class="list_title" width="90%">完结精品榜</td>
					<td>
						<div class="more_record">
							<a href="anzhinovel/morePahangbang.do?types=12" target="_blank">更多</a>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			<div style="clear:both; overflow:auto;" id="articePageMainDiv11">
				<c:forEach items="${wanjie.list }" var="s" varStatus="ind">
					<div class="article_items" id="article_items11${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
						<div class="noval_img" id="${s.id }novalImg${ind.index}<%=d%>11">
							<img src="${s.novelImg }" width="177" height="234"/>
						</div>
						<div class="noval_title" title="${s.novelTitle }">
							${fn:substring(s.novelTitle,0,9) }
						</div>
						<div class="noval_info_css">
							${fn:substring(s.vote,0,26) }...
						</div>
						<div class="noval_author"  title="${s.authorWriterName }">
							by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
						</div>
						<div class="article_type_css" style="height:25px;">
							${s.novelType }
						</div>
						<div class="article_items_foot">
							<table width="100%" border="0">
							  <tr>
								<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
								<td class="read_num_css" title="点击数">${s.clickNum }</td>
								<td class="end_article">${novelStateArr[s.state] }</td>
							  </tr>
							</table>
						</div>
					</div>
					<script language="javascript">
						$("#${s.id }novalImg${ind.index}<%=d%>11").data("nums",${s.num});
					</script>
				</c:forEach>	
			</div>
		</div>
		
	</div>
	<script language="javascript">
		window.onscroll=function(){myscroll()};
		$(function(){
			loadLoginInfo();
			$(".noval_img").hover(function(){
				try{
					$("#paimingshuzi").remove();
				}catch(e){}
				var ids=$(this)[0].id;
				var novleId=ids.substring(0,ids.indexOf("novalImg"));
				var nums=ids.substring(ids.indexOf("novalImg")+8,ids.indexOf("end"));
				var types=ids.substring(ids.indexOf("leixing")+7,ids.length);
				var info="<div style='padding-top:40px;'>"+paihangbang[parseInt(types)]+"</div>";
				
				info+="<div>No.<font class='numCss'>"+(parseInt(nums)+1)+"</font></div>";
				info+="<div style='text-align:center'><hr class='xiahuaxiancss'/></div>";
				if(parseInt(types)!=11){
					info+="<div>"+paihangbangName[parseInt(types)]+"："+$(this).data("nums")+"</div>";
				}else{
					info+="<div></div>";
				}
				
				$("<div id='paimingshuzi' class='paimingshuzi' onclick=\"window.location.href='"+path+"/novel/"+novleId+".jsp'\"></div").html(info).height($(this).height()).width($(this).width()-5).insertBefore($($(this).children("img")[0]));
			
				$("#book_info_css_div").remove();
				clearInterval(removeBookBaiscTimer);
				getBookBasicObject=$(this)[0];
				
				if($(this).data("novelId")==null){
					//说明没有加载
					loadNovelPartInfo(getBookBasicObject);
				}else{
					novelImg=$(this).data("novelImg");
					novelTitle=$(this).data("novelTitle");
					authorWriter=$(this).data("authorWriter");
					clickNum=$(this).data("clickNum");
					readNum=$(this).data("readNum");
					novelVote=$(this).data("novelVote");
					novelId=$(this).data("novelId");
					getBookBasicTimer=setTimeout("getBookBasicInfo()",400);
				}
			},function(){
				clearInterval(getBookBasicTimer);
				getBookBasicObject=null;
				novelImg=null;
				novelTitle=null;
				authorWriter=null;
				clickNum=null;
				readNum=null;
				novelVote=null;
				novelId=null;
				removeBookBaiscTimer=setTimeout("removeBookBasic()",1000);
				try{
					$("#paimingshuzi").remove();
				}catch(e){}
			});
			novalImgClick();
		});
	</script>
<jsp:include page="foot.jsp"></jsp:include>