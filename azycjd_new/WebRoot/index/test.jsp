<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="day_registration_form">
		<div class="divTableCss">
				<style type="text/css">
					.selectDivCss{margin-left: 552px;}
					.div_css_test{display: none;}
				</style>
				<script type="text/javascript">
					function showDivFn(id){
						$("#"+id).slideToggle();
					}
				</script>
				<table width="100%">
					<tr>
						<td>昵称：花花s</td>
					</tr>
					<tr>
						<td style="padding-top: 10px;">
							账户余额(安之币)：1000
							<input type="text" style="width:120px; float: right; margin-right: 20px;" class="selectTxtCss" id="accountSearch" name="accountSearch" >
						</td>
					</tr>
				</table>
				<table class="tableCss" width="100%" style="margin-top: 30px;">
					<tr>
						<td>序号</td>
						<td>消费时间</td>
						<td>消费金额(安之币)</td>
						<td>消费小说</td>
						<td>消费类型</td>
						<td>之前余额(安之币)</td>
						<td>之后余额(安之币)</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2015-07-03</td>
						<td>300</td>
						<td>激活血脉</td>
						<td>打赏</td>
						<td>300</td>
						<td><a href="javascript:showDivFn('div1')">展开</a></td>
					</tr>
					<tr>
						<td colspan="7">
							<div id="div1" class="div_css_test">
								这是测试效果
							</div>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td>2015-07-03</td>
						<td>300</td>
						<td>精灵球</td>
						<td>小说购买</td>
						<td>300</td>
						<td><a href="javascript:showDivFn('div2')">展开</a></td>
					</tr>
					<tr>
						<td colspan="7">
							<div id="div2" class="div_css_test">
								这是测试效果
							</div>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td>2015-07-03</td>
						<td>300</td>
						<td>血脉皇者</td>
						<td>打赏</td>
						<td>300</td>
						<td><a href="javascript:showDivFn('div3')">展开</a></td>
					</tr>
					<tr>
						<td colspan="7">
							<div id="div3" class="div_css_test">
								这是测试效果
							</div>
						</td>
					</tr>
					<tr>
						<td>4</td>
						<td>2015-07-03</td>
						<td>300</td>
						<td>血脉皇者</td>
						<td>打赏</td>
						<td>300</td>
						<td><a href="javascript:showDivFn('div4')">展开</a></td>
					</tr>
					<tr>
						<td colspan="7">
							<div id="div4" class="div_css_test">
								这是测试效果
							</div>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td>2015-07-03</td>
						<td>300</td>
						<td>盛世巨星</td>
						<td>小说购买</td>
						<td>300</td>
						<td><a href="javascript:showDivFn('div5')">展开</a></td>
					</tr>
					<tr>
						<td colspan="7">
							<div id="div5" class="div_css_test">
								这是测试效果
							</div>
						</td>
					</tr>
					<tr>
						<td>6</td>
						<td>2015-07-03</td>
						<td>300</td>
						<td>花姑娘</td>
						<td>小说购买</td>
						<td>300</td>
						<td><a href="javascript:showDivFn('div6')">展开</a></td>
					</tr>
					<tr>
						<td colspan="7">
							<div id="div6" class="div_css_test">
								这是测试效果
							</div>
						</td>
					</tr>
				</table>
	    </div>
	  <jsp:include page="../next_page.jsp" flush="false"></jsp:include>
   </form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>